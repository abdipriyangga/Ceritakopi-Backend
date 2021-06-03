const express = require('express');
const variantsRouter = express.Router();
const variantsController = require('../controllers/variants');

variantsRouter.get('/', variantsController.getVariants);
variantsRouter.post('/', variantsController.addVariants);
variantsRouter.patch('/:id', variantsController.updateVariants);
variantsRouter.delete('/:id', variantsController.deleteVariants);


module.exports = variantsRouter;