const mongoose = require("mongoose");

const reviewSchema = new mongoose.Schema(
  {
    property: { type: mongoose.Schema.Types.ObjectId, ref: "Property", },
    agent : {type : mongoose.Schema.Types.ObjectId , ref : "User"},
    user: { type: mongoose.Schema.Types.ObjectId, ref: "User", required: true },
    rating: { type: Number, min: 1, max: 5, required: true },
    comment: { type: String },
    validation : {type : Boolean , default : false}
  },
  { timestamps: true }
);

module.exports = mongoose.model("Review", reviewSchema);
