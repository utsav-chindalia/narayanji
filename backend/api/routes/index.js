const express = require('express');
const router = express.Router();

// Example: router.use('/users', require('../controllers/userController'));

router.use('/example', require('./example'));
// Route for checking if a vendor phone is allowed
router.use('/check-vendor', require('./vendor'));

module.exports = router; 