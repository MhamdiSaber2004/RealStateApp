const express = require("express");
const router = express.Router();
const {
    googleAuth,
    registerUser,
    loginUser,
    getUserProfile,
    updateUserProfile,
} = require("../controllers/authController");
const { protect } = require("../middelwares/authMiddleware");

// Public routes
router.post('/google-auth',googleAuth)        //google auth (login / registre)
router.post("/register", registerUser);      // Register new user
router.post("/login", loginUser);           // Email/password login

// Protected routes
router.get("/profile", protect, getUserProfile);      // Get current user's profile
router.put("/profile", protect, updateUserProfile);   // Update current user's profile

module.exports = router;
