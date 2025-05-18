const express = require('express');
const router = express.Router();

// Example: router.use('/users', require('../controllers/userController'));

router.use('/example', require('./example'));

module.exports = router; 