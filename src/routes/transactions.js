const express = require('express');
const transactionsRouter = express.Router();
const transactionsController = require('../controllers/transactions');
const auth = require('../helpers/middlewares/checkToken');

transactionsRouter.delete('/:id', auth, transactionsController.deleteHistory);
transactionsRouter.get('/:id', auth, transactionsController.getTransactionDetail);
transactionsRouter.get('/', auth, transactionsController.getTransactionById);
transactionsRouter.post('/', auth, transactionsController.createTransaction);

module.exports = transactionsRouter;