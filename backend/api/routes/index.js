const express = require('express');
const router = express.Router();
const authMiddleware = require('../middleware/authMiddleware');

// Apply authentication middleware to all /api routes
router.use(authMiddleware);

// Example: router.use('/users', require('../controllers/userController'));

router.use('/example', require('./example'));
// Route for checking if a vendor phone is allowed
router.use('/check-vendor', require('./vendor'));
router.use('/catalog', require('./catalog'));
router.use('/cart', require('./cart'));
router.use('/orders', require('./orders'));

module.exports = router; 