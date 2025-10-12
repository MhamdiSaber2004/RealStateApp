const express = require("express");
const {
  createReview,
  getAllReviews,
  getPropertyReviews,
  getAgentReviews,
  getCustomerReviews,
  validateReview,
  deleteReview,
} = require("../controllers/reviewController");

const { protect, authorize } = require("../middelwares/authMiddleware");

const router = express.Router();

// Public routes
router.get("/", getAllReviews);
router.get("/property/:propertyId", getPropertyReviews);
router.get("/agent/:agentId", getAgentReviews);


// Private routes
router.post("/", protect, authorize("customer"), createReview); // Only customers can create reviews
router.put("/:reviewId/validate", protect, authorize("owner"), validateReview); // Only owners can validate reviews
router.delete("/:reviewId", protect, authorize("customer", "owner"), deleteReview); // Owner can delete any review, customer can delete their own
router.get("/customer/:customerId", protect, authorize("customer", "owner"), getCustomerReviews); // Owner can see any review, customer can see their reviews

module.exports = router;
