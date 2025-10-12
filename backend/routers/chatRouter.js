const express = require("express");
const {
  sendMessage,
  getUserChats,
  getChatById,
} = require("../controllers/chatController");
const { protect } = require("../middelwares/authMiddleware");

const router = express.Router();

router.post("/message", protect, sendMessage);
router.get("/", protect, getUserChats);
router.get("/:id", protect, getChatById);

module.exports = router;
