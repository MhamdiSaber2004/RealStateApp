// controllers/chatController.js
const Chat = require("../models/chatModel");
const UserActivity = require("../models/userActivityModel");
const User = require("../models/userModel")

exports.sendMessage = async (req, res) => {
  try {
    const { receiverId, text } = req.body;
    const senderId = req.user._id;

    if (!receiverId || !text) {
      return res.status(400).json({ message: "Receiver ID and text are required" });
    }

    const user = await User.findOne({_id : receiverId});
    if(!user){
        return res.status(404).json({ message: "user not found" });
    }

    let chat = await Chat.findOne({
      participants: { $all: [senderId, receiverId] },
    });

    if (!chat) {
      chat = await Chat.create({
        participants: [senderId, receiverId],
        messages: [],
      });

      await UserActivity.create({
        user: senderId,
        action: `create chat with user ${receiverId}`,
        target: chat._id,
        targetModel: "Chat",
      });
    }

    chat.messages.push({
      sender: senderId,
      text,
      createdAt: new Date(),
    });

    await chat.save();

    await UserActivity.create({
      user: senderId,
      action: "send message",
      target: chat._id,
      targetModel: "Chat",
    });

    return res.status(200).json(chat);
  } catch (error) {
    console.error("Send message error:", error);
    return res.status(500).json({ message: "Server error" });
  }
};

exports.getUserChats = async (req, res) => {
  try {
    const chats = await Chat.find({ participants: req.user._id })
      .populate("participants", "name email role")
      .sort({ updatedAt: -1 });

    return res.status(200).json(chats);
  } catch (error) {
    console.error("Get chats error:", error);
    return res.status(500).json({ message: "Server error" });
  }
};

exports.getChatById = async (req, res) => {
  try {
    const chat = await Chat.findById(req.params.id)
      .populate("participants", "name email role")
      .populate("messages.sender", "name email");

    if (!chat) return res.status(404).json({ message: "Chat not found" });


    console.log(req.user._id.toString());
    console.log(chat.participants);

    if (!chat.participants.some(p => p._id.toString() === req.user._id.toString())) {
      return res.status(403).json({ message: "Not authorized" });
    }

    return res.status(200).json(chat);
  } catch (error) {
    console.error("Get chat error:", error);
    return res.status(500).json({ message: "Server error" });
  }
};
