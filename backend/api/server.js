const express = require('express');
const morgan = require('morgan');
const cors = require('cors');
const app = express();
const config = require('./config');
const routes = require('./routes');

app.use(express.json());
app.use(morgan('dev'));
app.use(cors());

app.use('/api', routes);

app.get('/', (req, res) => {
  res.send('Express server is running!');
});

app.listen(config.port, () => {
  console.log(`Server is running on port ${config.port}`);
});

// Global error handler
app.use((err, req, res, next) => {
  console.error('Internal error:', err);
  res.status(500).json({ error: err.message || 'Internal server error' });
}); 