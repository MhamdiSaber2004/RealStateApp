const mongoose = require("mongoose");

const propertySchema = new mongoose.Schema(
  {
    title: { type: String, required: true },
    description: { type: String },
    type: { type: String, enum: ["sale", "rent"], required: true },
    price: { type: Number, required: true },
    area: { type: Number },
    rooms: { type: Number },
    status: { type: String, enum: ["pending", "approved", "sold", "rented"], default: "pending" },
    city: { type: String },
    images: [{ type: String }],
    agent: { type: mongoose.Schema.Types.ObjectId, ref: "User", required: true }, // reference to Agent
    views: { type: Number, default: 0 },
  },
  { timestamps: true }
);

module.exports = mongoose.model("Property", propertySchema);
