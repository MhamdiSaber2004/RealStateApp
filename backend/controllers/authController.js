const User = require("../models/userModel");
const UserActivity = require("../models/userActivityModel");
const { OAuth2Client } = require("google-auth-library");
const { sendVerficationEmail } = require('../services/emailService')


//Google auth(login / registre)
exports.googleAuth = async (req, res) => {
  try {
    const { idToken } = req.body; // Frontend sends Google ID token
    if (!idToken) {
      return res.status(400).json({ message: "No Google token provided" });
    }

    // Verify token with Google
    const client = new OAuth2Client(process.env.GOOGLE_CLIENT_ID);
    const ticket = await client.verifyIdToken({
      idToken,
      audience: process.env.GOOGLE_CLIENT_ID,
    });
    
    const payload = ticket.getPayload();
    const { sub, email, name, picture } = payload;

    // Check if user already exists
    let user = await User.findOne({ email });

    if (!user) {
      // Register new user
      user = await User.create({
        name,
        email,
        verified : true,
        googleId: sub,
        avatar: picture,
        role: "customer",
      });

      await UserActivity.create({
        user: user._id,
        action: "register_google",
        target: user._id,
        targetModel: "User",
      });
    } else {
      // Update avatar if changed
      user.avatar = picture || user.avatar;
      await user.save();

      await UserActivity.create({
        user: user._id,
        action: "login_google",
        target: user._id,
        targetModel: "User",
      });
    }

    // Return JWT token
    return res.json({
      _id: user._id,
      name: user.name,
      email: user.email,
      avatar: user.avatar,
      role: user.role,
      token: user.generateToken(),
    });

  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Google authentication failed" });
  }
};

// Register a new user
exports.registerUser = async (req, res) => {
  try {
    const { name, email, password, phoneNumber } = req.body;

    if (!name || !email || !password || !phoneNumber) {
      return res.status(400).json({ message: "Please provide all required fields" });
    }

    //email existe
    userExists = await User.findOne( { $or : [ { email } , {phoneNumber} ] });
    if (userExists) {
      return res.status(400).json({ message: "User already exists" });
    }

    const user = await User.create({ name, email, password, phoneNumber});
    
    const token = await user.generateVerificationToken();
    const verificationUrl = `${process.env.FRONT_URL}/api/auth/verify-email?email=${email}&token=${token}`;

    await sendVerficationEmail(email, name, verificationUrl , 'registering');

    if (user) {
      // Log activity
      await UserActivity.create({
        user: user._id,
        action: "register",
        target: user._id,
        targetModel: "User",
      });

      return res.status(201).json({
        _id: user._id,
        name: user.name,
        email: user.email,
        phoneNumber : user.phoneNumber,
        role: user.role,
        token: user.generateToken(),
      });
    } else {
      return res.status(400).json({ message: "Invalid user data" });
    }
  } catch (error) {
    console.error(error);
    return res.status(500).json({ message: "Server error" });
  }
};

// Login user
exports.loginUser = async (req, res) => {
  try {
    const { emailOrPhoneNumber ,  password } = req.body;

    user = await User.findOne({$or : [{email : emailOrPhoneNumber } , {phoneNumber : emailOrPhoneNumber}] });
   
    if (user && (await user.matchPassword(password))) {
      // Log activity
      await UserActivity.create({
        user: user._id,
        action: "login",
        target: user._id,
        targetModel: "User",
      });

      return res.json({
        _id: user._id,
        name: user.name,
        email: user.email,
        phoneNumber : user.phoneNumber,
        role: user.role,
        token: user.generateToken(),
      });
    } else {
      return res.status(401).json({ message: "Invalid email or password" });
    }
  } catch (error) {
    console.error(error);
    return res.status(500).json({ message: "Server error" });
  }
};

//verify email
exports.verifyEamil = async (req,res)=>{
  try {
    const {email , token} = req.query;

    if(!email || !token){
      return res.status(404).json({ message: "User not found" });
    }

    const user = await User.findOne({email});

    if(user){
      const verified = await user.verifyEmailToken(token);
      console.log(verified)
      if(verified){

      await UserActivity.create({
      user: user._id,
      action: "validate acount",
      target: user._id,
      targetModel: "User",
      });

      return res.status(200).json(
        {
          _id: user._id,
          name: user.name,
          email: user.email,
          phoneNumber : user.phoneNumber,
          role: user.role,
          token: user.generateToken(),
        }
      )
      }else{
        return res.status(404).json({ message: "Invalide token" });
      }
    }else{
      return res.status(404).json({ message: "User not found" });
    }
  } catch (error) {
    return res.status(500).json({ message: "Server error" });
  }
}

// Get user profile
exports.getUserProfile = async (req, res) => {
  try {
    const user = await User.findById(req.user._id);

    if (user) {
      // Log activity
      await UserActivity.create({
        user: user._id,
        action: "view_profile",
        target: user._id,
        targetModel: "User",
      });

      return res.json({
        _id: user._id,
        name: user.name,
        email: user.email,
        role: user.role,
        avatar: user.avatar,
        phone: user.phone,
        bio: user.bio,
        favorites: user.favorites,
        chats: user.chats,
      });
    } else {
      return res.status(404).json({ message: "User not found" });
    }
  } catch (error) {
    console.error(error);
    return res.status(500).json({ message: "Server error" });
  }
};






