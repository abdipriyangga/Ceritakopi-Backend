const express = require('express');
const chatRouter = express.Router();
const chatController = require('../controllers/chats');
const auth = require('../helpers/middlewares/checkToken');


chatRouter.get('/all', auth, chatController.getChatRoom);
chatRouter.post('/', auth, chatController.createChat);
chatRouter.get('/list', auth, chatController.getUserChat);
chatRouter.get('/search', auth, chatController.searchUsers);
chatRouter.delete('/:id', auth, chatController.deleteChat);

module.exports = chatRouter;