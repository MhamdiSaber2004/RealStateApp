// models/chatModel.js
const mongoose = require("mongoose");

const chatSchema = new mongoose.Schema(
  {
    participants: [
      { type: mongoose.Schema.Types.ObjectId, ref: "User", required: true }
    ],
    messages: [
      {
        sender: { type: mongoose.Schema.Types.ObjectId, ref: "User" },
        text: { type: String, required: true },
        createdAt: { type: Date, default: Date.now },
      },
    ],
  },
  { timestamps: true }
);

module.exports = mongoose.model("Chat", chatSchema);
