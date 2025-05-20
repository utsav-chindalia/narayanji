const express = require('express');
const router = express.Router();
const catalogController = require('../controllers/catalogController');

// GET /api/catalog
router.get('/', catalogController.getCatalog);

module.exports = router; 