const express = require('express');
const itemsRouter = express.Router();
const itemsController = require('../controllers/items');
const auth = require('../helpers/middlewares/checkToken');

itemsRouter.get('/search', itemsController.getItemSearchAndSort);
itemsRouter.get('/', itemsController.getItems);
itemsRouter.post('/', auth, itemsController.addItem);
itemsRouter.get('/:id',itemsController.getDetailItem);
itemsRouter.patch('/:id', auth ,itemsController.updateItem);
itemsRouter.delete('/:id', itemsController.deleteItem);



module.exports = itemsRouter;