const mongoose = require("mongoose");

const chatSchema = new mongoose.Schema(
  {
    participants: [{ type: mongoose.Schema.Types.ObjectId, ref: "User" }], // agent + customer
    messages: [
      {
        sender: { type: mongoose.Schema.Types.ObjectId, ref: "User" },
        text: { type: String, required: true },
        createdAt: { type: Date, default: Date.now },
      },
    ],
    property: { type: mongoose.Schema.Types.ObjectId, ref: "Property" }, // optional property context
  },
  { timestamps: true }
);

module.exports = mongoose.model("Chat", chatSchema);
