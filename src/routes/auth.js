const express = require('express');
const authRouter = express.Router();
const authController = require('../controllers/auth');

authRouter.post('/signup', authController.signup);
authRouter.post('/login', authController.login);
// authRouter.post('/forgot-password', authController.forgotPassword);
// authRouter.patch('/reset-password/:token', authController.forgotPassword);

module.exports = authRouter;