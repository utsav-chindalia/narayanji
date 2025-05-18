const express = require('express');
const morgan = require('morgan');
const app = express();
const config = require('./config');
const routes = require('./routes');

app.use(express.json());
app.use(morgan('dev'));

app.use('/api', routes);

app.get('/', (req, res) => {
  res.send('Express server is running!');
});

app.listen(config.port, () => {
  console.log(`Server is running on port ${config.port}`);
}); 