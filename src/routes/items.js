const express = require('express');
const itemsRouter = express.Router();
const itemsController = require('../controllers/items');
const admin = require('../helpers/middlewares/checkTokenAdmin');

itemsRouter.get('/', itemsController.getItems);
itemsRouter.post('/', admin, itemsController.addItem);
itemsRouter.get('/search', itemsController.getItemSearchAndSort);
itemsRouter.get('/category/:id/items', itemsController.getItemByCategory);
itemsRouter.get('/:id', itemsController.getDetailItem);
itemsRouter.patch('/:id', admin, itemsController.updateItem);
itemsRouter.delete('/:id', itemsController.deleteItem);


module.exports = itemsRouter;