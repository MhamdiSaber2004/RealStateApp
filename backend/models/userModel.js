const mongoose = require("mongoose");
const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");
const dotenv = require("dotenv");
dotenv.config();

const userSchema = new mongoose.Schema(
  {
    name: { type: String, required: true },
    email: { type: String, required: true, unique: true },
    password: { type: String }, // optional for OAuth users
    avatar: { type: String },
    phoneNumber : {type : String , mutch : [/^[2459]\d{7}$/ , "Please add a valid phone number"]},
    role: { type: String, enum: ["owner", "agent", "customer"], required: true },
    phone: { type: String },
    bio: { type: String },

    // OAuth IDs
    googleId: { type: String },
    facebookId: { type: String },

    // Customer fields
    favorites: [{ type: mongoose.Schema.Types.ObjectId, ref: "Property" }],

    // Agent fields
    properties: [{ type: mongoose.Schema.Types.ObjectId, ref: "Property" }],
    chats: [{ type: mongoose.Schema.Types.ObjectId, ref: "Chat" }],
  },
  { timestamps: true }
);



userSchema.pre("save", async function (next) {
  if (!this.isModified("password")) return next();
  const salt = await bcrypt.genSalt(10);
  this.password = await bcrypt.hash(this.password, salt);
  next();
});

userSchema.methods.matchPassword = async function (enteredPassword) {
  return await bcrypt.compare(enteredPassword, this.password);
};

userSchema.methods.generateToken = function () {
  return jwt.sign(
    { id: this._id, role: this.role },
    process.env.JWT_SECRET,
    { expiresIn: "7d" }
  );
};

module.exports = mongoose.model("User", userSchema);
