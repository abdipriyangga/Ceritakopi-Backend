const express = require('express');
const itemsRouter = express.Router();
const itemsController = require('../controllers/items');

itemsRouter.get('/search', itemsController.getItemSearchAndSort);
itemsRouter.get('/', itemsController.getItems);
itemsRouter.post('/', itemsController.addItem);
itemsRouter.get('/:id', itemsController.getDetailItem);
itemsRouter.patch('/:id', itemsController.updateItem);
itemsRouter.delete('/:id', itemsController.deleteItem);



module.exports = itemsRouter;