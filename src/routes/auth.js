const express = require('express');
const authRouter = express.Router();
const authController = require('../controllers/auth');

authRouter.post('/signup', authController.signup);
authRouter.get('/login', authController.login);

module.exports = authRouter;