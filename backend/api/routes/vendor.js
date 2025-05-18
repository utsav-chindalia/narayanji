const express = require('express');
const router = express.Router();
const vendorController = require('../controllers/vendorController');

// Route for checking if a vendor phone is allowed (POST /api/check-vendor)
// POST /api/check-vendor
router.post('/', vendorController.checkVendor);

module.exports = router; 