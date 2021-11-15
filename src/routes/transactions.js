const express = require('express');
const transactionsRouter = express.Router();
const transactionsController = require('../controllers/transactions');
const auth = require('../helpers/middlewares/checkToken');

transactionsRouter.get('/', auth, transactionsController.getTransactionById);
transactionsRouter.post('/', auth, transactionsController.createTransaction);
transactionsRouter.delete('/:id', auth, transactionsController.deleteHistory);

module.exports = transactionsRouter;