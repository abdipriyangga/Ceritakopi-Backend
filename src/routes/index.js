const express = require('express');
const mainRouter = express.Router();
const itemsRouter = require('./items');
const categoriesRouter = require('./categories');
const variantsRouter = require('./variants');
const authRouter = require('./auth');
const transactionsRouter = require('./transactions');
const userRouter = require('./users');
const { APP_UPLOAD_ROUTE, APP_UPLOAD_PATH } = process.env;
const welcomeRouter = require('./welcome');
const chatRouter = require('./chats');
// endpoint handler
mainRouter.use(APP_UPLOAD_ROUTE, express.static(APP_UPLOAD_PATH));
mainRouter.use('/auth', authRouter);
mainRouter.use('/items', itemsRouter);
mainRouter.use('/categories', categoriesRouter);
mainRouter.use('/variants', variantsRouter);
mainRouter.use('/transactions', transactionsRouter);
mainRouter.use('/profile', userRouter);
mainRouter.use('/chats', chatRouter);
mainRouter.use('/', welcomeRouter);


module.exports = mainRouter;