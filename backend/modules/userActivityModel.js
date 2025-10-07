const mongoose = require("mongoose");

const userActivitySchema = new mongoose.Schema(
  {
    user: { type: mongoose.Schema.Types.ObjectId, ref: "User", required: true },
    action: {
      type: String,
      enum: [
        "login",
        "logout",
        "view_property",
        "favorite_property",
        "send_message",
        "create_property",
        "update_property",
        "delete_property",
        "payment",
        "review"
      ],
      required: true,
    },
    target: { type: mongoose.Schema.Types.ObjectId, refPath: "targetModel" },
    targetModel: { type: String, enum: ["Property", "Chat", "Transaction", "Review"] }, 
    metadata: { type: Object }, 
  },
  { timestamps: true }
);

module.exports = mongoose.model("UserActivity", userActivitySchema);
