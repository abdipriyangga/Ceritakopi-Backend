const express = require('express');
const mainRouter = express.Router();
const itemsRouter = require('./items');
const welcomeRouter = require('./welcome');
const categoriesRouter = require('./categories');

// endpoint handler
mainRouter.use('/items', itemsRouter);
mainRouter.use('/categories', categoriesRouter);
mainRouter.use('/', welcomeRouter);

module.exports = mainRouter;