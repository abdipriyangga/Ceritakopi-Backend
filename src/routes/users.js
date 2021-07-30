const express = require('express');
const userRouter = express.Router();
const userController = require('../controllers/users');
const auth = require('../helpers/middlewares/checkToken');

userRouter.get('/', auth , userController.getUserProfile);

module.exports = userRouter;