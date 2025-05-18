const exampleService = require('../services/exampleService');

exports.hello = (req, res) => {
  res.json({ message: exampleService.getMessage() });
}; 