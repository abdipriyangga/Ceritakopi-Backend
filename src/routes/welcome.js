const express = require('express');
const welcomeRouter = express.Router();

welcomeRouter.get('/', (req, res) => {
    res.send('Welcome to Coffee Shop API');
});

module.exports = welcomeRouter;