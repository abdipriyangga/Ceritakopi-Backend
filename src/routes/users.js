const express = require('express');
const userRouter = express.Router();
const userController = require('../controllers/users');
const chatRouter = express.Router();
const chatController = require('../controllers/chats');
const auth = require('../helpers/middlewares/checkToken');
const upload = require('../helpers/upload');


userRouter.get('/', auth, userController.getUserProfile);
userRouter.put('/', auth, userController.updateProfile);

chatRouter.get('/chats/all', auth, chatController.getChatRoom);
chatRouter.post('/chats', auth, chatController.createChat);
chatRouter.get('/chats/list', auth, chatController.getUserChat);
chatRouter.get('/chats/search', auth, chatController.searchUsers);
chatRouter.delete('/chats/:id', auth, chatController.deleteChat);

module.exports = userRouter;