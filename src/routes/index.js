const express = require('express');
const mainRouter = express.Router();
const itemsRouter = require('./items');
const welcomeRouter = require('./welcome');
const categoriesRouter = require('./categories');
const variantsRouter = require('./variants');

// endpoint handler
mainRouter.use('/items', itemsRouter);
mainRouter.use('/categories', categoriesRouter);
mainRouter.use('/variants', variantsRouter);
mainRouter.use('/', welcomeRouter);

module.exports = mainRouter;