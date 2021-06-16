const express = require('express');
const transactionsRouter = express.Router();
const transactionsController = require('../controllers/transactions');
const auth = require('../helpers/middlewares/checkToken');

transactionsRouter.post('/', auth ,transactionsController.createTransaction);

module.exports = transactionsRouter;