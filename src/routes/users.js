const express = require('express');
const userRouter = express.Router();
const userController = require('../controllers/items');

userRouter.get('/signup', userController);
userRouter.get('/', userController.getItems);
userRouter.post('/', userController.addItem);



module.exports = userRouter;