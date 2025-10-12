const express = require("express");
const {
    createProperty,
    getAllProperties,
    getPropertyById,
    updateProperty,
    deleteProperty
}=require("../controllers/propertyController");
const {protect , authorize} = require("../middelwares/authMiddleware")

const router = express.Router();

//public routers
router.get('/',getAllProperties);
router.get('/:id',getPropertyById);

//private routers
router.post('/',protect , authorize('agent','owner') , createProperty);
router.put('/:id',protect,authorize('agent','owner') , updateProperty);
router.delete('/:id',protect , authorize('agent', 'owner') , deleteProperty);

module.exports = router