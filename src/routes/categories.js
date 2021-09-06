const express = require('express');
const categoriesRouter = express.Router(); 
const categoriesController = require('../controllers/categories');
const admin = require('../helpers/middlewares/checkTokenAdmin');

categoriesRouter.get('/', categoriesController.getCategories);
categoriesRouter.post('/', admin, categoriesController.addCategories);
categoriesRouter.patch('/:id', admin, categoriesController.updateCategories);
categoriesRouter.delete('/:id', admin, categoriesController.deleteCategories);
categoriesRouter.get('/:id/items', categoriesController.getItemsByCategories);



module.exports = categoriesRouter;