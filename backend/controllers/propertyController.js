const Property = require("../models/propertyModel");
const UserActivity = require("../models/userActivityModel");

// Create new property (only agent)
// controller/propertyController.js
exports.createProperty = async (req, res) => {
  try {
    let { title, description, type, price, area, rooms, city, images, AgentId } = req.body;

    if (!title || !type || !price) {
      return res.status(400).json({ message: "Title, type, and price are required" });
    }

    if (AgentId && req.user.role !== "owner") {
      return res.status(403).json({ message: "Only owners can assign properties to other agents" });
    }

    if (!AgentId) {
      AgentId = req.user._id;
    }

    const property = await Property.create({
      title,
      description,
      type,
      price,
      area,
      rooms,
      city,
      images,
      agent: AgentId,
    });

    await UserActivity.create({
      user: req.user._id,
      action: `create property`,
      forUser:AgentId,
      target: property._id,
      targetModel: "Property",
    });

    return res.status(201).json(property);
  } catch (error) {
    console.error("Create property error:", error);
    return res.status(500).json({ message: "Server error" });
  }
};


// Get all properties
exports.getAllProperties = async (req, res) => {
  try {
    const filters = {};

    if (req.query.city) filters.city = req.query.city;
    if (req.query.type) filters.type = req.query.type;
    if (req.query.status) filters.status = req.query.status;
    if (req.query.minPrice || req.query.maxPrice) {
      filters.price = {};
      if (req.query.minPrice) filters.price.$gte = Number(req.query.minPrice);
      if (req.query.maxPrice) filters.price.$lte = Number(req.query.maxPrice);
    }

    const properties = await Property.find(filters)
      .populate("agent", "name email phoneNumber")
      .sort({ createdAt: -1 });

    return res.status(200).json(properties);
  } catch (error) {
    console.error("Get properties error:", error);
    return res.status(500).json({ message: "Server error" });
  }
};

// Get single property by ID
exports.getPropertyById = async (req, res) => {
  try {
    const property = await Property.findById(req.params.id)
      .populate("agent", "name email phoneNumber");
    if (!property) return res.status(404).json({ message: "Property not found" });

    // Increment views
    property.views += 1;
    await property.save();

    return res.status(200).json(property);
  } catch (error) {
    console.error("Get property error:", error);
    return res.status(500).json({ message: "Server error" });
  }
};

// Update property (agent or owner)
exports.updateProperty = async (req, res) => {
  try {
    const property = await Property.findById(req.params.id);
    if (!property) return res.status(404).json({ message: "Property not found" });

    if (req.user.role !== "owner" && property.agent.toString() !== req.user._id.toString()) {
      return res.status(403).json({ message: "Not authorized to update this property" });
    }

    Object.assign(property, req.body);

    await property.save();

    await UserActivity.create({
      user: req.user._id,
      action: "update property",
      target: property._id,
      targetModel: "Property",
    });

    return res.status(200).json(property);
  } catch (error) {
    console.error("Update property error:", error);
    return res.status(500).json({ message: "Server error" });
  }
};

// Delete property (agent or owner)
exports.deleteProperty = async (req, res) => {
  try {
    const property = await Property.findById(req.params.id);
    if (!property) return res.status(404).json({ message: "Property not found" });

    if (req.user.role !== "owner" && property.agent.toString() !== req.user._id.toString()) {
      return res.status(403).json({ message: "Not authorized to delete this property" });
    }

    await property.deleteOne();

    await UserActivity.create({
      user: req.user._id,
      action: "delete property",
      target: property._id,
      targetModel: "Property",
    });

    return res.status(200).json({ message: "Property deleted successfully" });
  } catch (error) {
    console.error("Delete property error:", error);
    return res.status(500).json({ message: "Server error" });
  }
};
