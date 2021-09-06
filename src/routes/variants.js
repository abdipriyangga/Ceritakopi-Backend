const express = require('express');
const variantsRouter = express.Router();
const variantsController = require('../controllers/variants');
const admin = require('../helpers/middlewares/checkTokenAdmin');

variantsRouter.get('/', variantsController.getVariants);
variantsRouter.get('/:id', variantsController.getDetailVariants);
variantsRouter.post('/', admin,variantsController.addVariants);
variantsRouter.patch('/:id', admin, variantsController.updateVariants);
variantsRouter.delete('/:id', admin, variantsController.deleteVariants);


module.exports = variantsRouter;