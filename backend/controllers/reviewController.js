const Review = require("../models/reviewModel");
const Property = require("../models/propertyModel");
const User = require("../models/userModel");
const UserActivity = require("../models/userActivityModel");

// CREATE REVIEW
exports.createReview = async (req, res) => {
  try {
    const { agentId, propertyId, rating, comment } = req.body;

    if (!rating) {
      return res.status(400).json({ message: "Rating is required" });
    }

    if (!agentId && !propertyId) {
      return res.status(400).json({
        message: "You must provide either agentId or propertyId",
      });
    }

    if (agentId) {
      const agent = await User.findById(agentId);
      if (!agent || agent.role !== "agent") {
        return res.status(404).json({ message: "Agent not found" });
      }

      if (agentId.toString() === req.user._id.toString()) {
        return res.status(400).json({ message: "You cannot review yourself" });
      }
    }

    if (propertyId) {
      const property = await Property.findById(propertyId);
      if (!property) {
        return res.status(404).json({ message: "Property not found" });
      }
    }

    const existing = await Review.findOne({
      user: req.user._id,
      ...(agentId ? { agent: agentId } : {}),
      ...(propertyId ? { property: propertyId } : {}),
    });

    if (existing) {
      return res
        .status(400)
        .json({ message: "You already reviewed this item" });
    }

    const review = await Review.create({
      agent: agentId || null,
      property: propertyId || null,
      user: req.user._id,
      rating,
      comment,
      validation: false,
    });

    await UserActivity.create({
      user: req.user._id,
      action: `created review for ${agentId ? "agent" : "property"}`,
      target: review._id,
      targetModel: "Review",
    });

    return res.status(201).json({
      message: "Review created successfully (waiting for validation)",
      review,
    });
  } catch (error) {
    console.error("Create review error:", error);
    return res.status(500).json({ message: "Server error" });
  }
};

// GET ALL REVIEWS
exports.getAllReviews = async (req, res) => {
  try {
    const reviews = await Review.find()
      .populate("user", "name email")
      .populate("agent", "name email")
      .populate("property", "title location")
      .sort({ createdAt: -1 });

    return res.status(200).json(reviews);
  } catch (error) {
    console.error("Get all reviews error:", error);
    return res.status(500).json({ message: "Server error" });
  }
};

// GET PROPERTY REVIEWS
exports.getPropertyReviews = async (req, res) => {
  try {
    const { propertyId } = req.params;
    const reviews = await Review.find({
      property: propertyId,
      validation: true,
    })
      .populate("user", "name email")
      .sort({ createdAt: -1 });

    return res.status(200).json(reviews);
  } catch (error) {
    console.error("Get property reviews error:", error);
    return res.status(500).json({ message: "Server error" });
  }
};

// GET AGENT REVIEWS
exports.getAgentReviews = async (req, res) => {
  try {
    const { agentId } = req.params;
    const reviews = await Review.find({
      agent: agentId,
      validation: true,
    })
      .populate("user", "name email")
      .sort({ createdAt: -1 });

    return res.status(200).json(reviews);
  } catch (error) {
    console.error("Get agent reviews error:", error);
    return res.status(500).json({ message: "Server error" });
  }
};

// GET CUSTOMER REVIEWS
exports.getCustomerReviews = async (req, res) => {
  try {
    const { customerId } = req.params;
    const reviews = await Review.find({
      user: customerId,
      validation: true,
    })
      .populate("user", "name email")
      .sort({ createdAt: -1 });

    return res.status(200).json(reviews);
  } catch (error) {
    console.error("Get customer reviews error:", error);
    return res.status(500).json({ message: "Server error" });
  }
};

// VALIDATE REVIEW
exports.validateReview = async (req, res) => {
  try {
    const { reviewId } = req.params;

    const review = await Review.findById(reviewId);
    if (!review) {
      return res.status(404).json({ message: "Review not found" });
    }

    review.validation = true;
    await review.save();

    await UserActivity.create({
      user: req.user._id,
      action: "validated a review",
      target: review._id,
      targetModel: "Review",
    });

    return res
      .status(200)
      .json({ message: "Review validated successfully", review });
  } catch (error) {
    console.error("Validate review error:", error);
    return res.status(500).json({ message: "Server error" });
  }
};

// DELETE REVIEW
exports.deleteReview = async (req, res) => {
  try {
    const { reviewId } = req.params;

    const review = await Review.findById(reviewId);
    if (!review) {
      return res.status(404).json({ message: "Review not found" });
    }

    if (
      review.user.toString() !== req.user._id.toString() &&
      !["owner", "admin"].includes(req.user.role)
    ) {
      return res.status(403).json({ message: "Unauthorized action" });
    }

    await review.deleteOne();

    await UserActivity.create({
      user: req.user._id,
      action: "deleted a review",
      target: reviewId,
      targetModel: "Review",
    });

    return res.status(200).json({ message: "Review deleted successfully" });
  } catch (error) {
    console.error("Delete review error:", error);
    return res.status(500).json({ message: "Server error" });
  }
};
