const express = require('express');
const categoriesRouter = express.Router(); 
const categoriesController = require('../controllers/categories');

categoriesRouter.get('/', categoriesController.getCategoriies);
categoriesRouter.post('/', categoriesController.addCategories);
categoriesRouter.patch('/:id', categoriesController.updateItem);
categoriesRouter.delete('/:id', categoriesController.deleteItem);



module.exports = categoriesRouter;