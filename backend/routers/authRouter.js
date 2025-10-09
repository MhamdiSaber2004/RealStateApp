const express = require("express");
const router = express.Router();
const {
    googleAuth,
    registerUser,
    loginUser,
    verifyEamil,
    getUserProfile,
    updateUserProfile,
    sendResetPasswordEmail,
    resePassword,
} = require("../controllers/authController");
const { protect } = require("../middelwares/authMiddleware");

// Public routes
router.post('/google-auth',googleAuth)        //google auth (login / registre)
router.post("/register", registerUser);      // Register new user
router.get("/verify-email" , verifyEamil)     //vrify email
router.post("/login", loginUser);           // Email/password login
router.post("/reset-password-email" , sendResetPasswordEmail) // sen the reset password url 
router.post('/rest-password' , resePassword)     //rest password from url

// Protected routes
router.get("/profile", protect, getUserProfile);      // Get current user's profile
router.put("/profile", protect, updateUserProfile);   // Update current user's profile

module.exports = router;
