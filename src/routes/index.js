const express = require('express');
const mainRouter = express.Router();
const itemsRouter = require('./items');

// endpoint handler
mainRouter.use('/items', itemsRouter);
module.exports = mainRouter;