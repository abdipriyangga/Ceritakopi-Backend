const express = require('express');
const categoriesRouter = express.Router(); 
const categoriesController = require('../controllers/categories');

categoriesRouter.get('/', categoriesController.getCategories);
categoriesRouter.post('/', categoriesController.addCategories);
categoriesRouter.patch('/:id', categoriesController.updateCategories);
categoriesRouter.delete('/:id', categoriesController.deleteCategories);



module.exports = categoriesRouter;