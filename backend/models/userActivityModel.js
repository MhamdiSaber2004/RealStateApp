const mongoose = require("mongoose");

const userActivitySchema = new mongoose.Schema(
  {
    user: { type: mongoose.Schema.Types.ObjectId, ref: "User", required: true },
    action: { type: String , required: true },
    target: { type: mongoose.Schema.Types.ObjectId, refPath: "targetModel" },
    targetModel: { type: String }, 
    metadata: { type: Object }, 
  },
  { timestamps: true }
);

module.exports = mongoose.model("UserActivity", userActivitySchema);
