const mongoose = require("mongoose");
const bcrypt = require("bcryptjs");
const crypto = require("crypto");
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
    role: { type: String, enum: ["owner", "agent", "customer"], required: true , default : "customer"},
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

    //acount validated
    verified : {type : Boolean , default : false},

    //validation Acount Token
    verifyToken : {type : String},

    //reset password Token
    tokenRestPassword : {type : String},
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

userSchema.methods.generateVerificationToken = async function() {
  const token = crypto.randomBytes(20).toString("hex");
  const hashedToken = await bcrypt.hash(token, 10);
  this.verifyToken = hashedToken;
  await this.save();
  return token;
};

userSchema.methods.verifyEmailToken = async function(token) {
  if (!this.verifyToken) {
    return false;
  }

  const isValid = await bcrypt.compare(token, this.verifyToken);
  if (!isValid) {
    return false;
  }

  this.verified = true;
  this.verifyToken = undefined; 
  await this.save();

  return true;
};

userSchema.methods.generatePasswordResrtToken = async function() {
  const token = crypto.randomBytes(20).toString("hex");
  const hashedToken = await bcrypt.hash(token, 10);
  this.tokenRestPassword = hashedToken;
  await this.save();
  return token;
};

userSchema.methods.verifyResetPasswordToken = async function(token) {
   if (!this.tokenRestPassword) {
    return false;
  }

  const isValid = await bcrypt.compare(token, this.tokenRestPassword);
  if (!isValid) {
    return false;
  }

  this.verified = true;
  this.tokenRestPassword = undefined; 
  await this.save();

  return true;
};


module.exports = mongoose.model("User", userSchema);
