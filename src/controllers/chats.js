const userModel = require('../models/users');
const chatModel = require('../models/chats');
const { response: formResponse } = require('../helpers/formResponse');
const { APP_URL } = process.env;

exports.createChat = (req, res) => {
    const { recipient } = req.body
    const phone = { phone_number: recipient }
    chatModel.checkPhoneNumber(phone, (err, results, _fields) => {
        if (!err) {
            if (results.length > 0) {
                userModel.getUserById(req.authUser.id, (err, resultsMe, _fields) => {
                    if (!err) {
                        const form = {
                            sender: resultsMe[0].phone_number,
                            recipient: recipient
                        }
                        chatModel.updateChat(form, (err, results, _fields) => {
                            if (!err) {
                                const formData = {
                                    sender: resultsMe[0].phone_number,
                                    recipient: recipient,
                                    message: req.body.message
                                }
                                chatModel.createChat(formData, (err, results, _fields) => {
                                    if (!err) {
                                        req.socket.emit('recipient', {
                                            message: req.body.message,
                                            sender: resultsMe[0].phone_number
                                        })
                                        // req.socket.emit('hello', 'world')
                                        return formResponse(res, 200, 'Send message success', results);
                                    } else {
                                        return formResponse(res, 400, 'Send message failed');
                                    }
                                })
                            } else {
                                return formResponse(res, 400, 'failed update isLatest');
                            }
                        })
                    } else {
                        return formResponse(res, 500, 'error occured');
                    }
                })
            } else {
                return formResponse(res, 404, 'phone number not found');
            }
        } else {
            return formResponse(res, 500, 'error occured');
        }
    })
};

exports.getChatRoom = (req, res) => {
    const { recipient } = req.query
    const phone_number = { phone_number: recipient }
    chatModel.checkPhoneNumber(phone_number, (err, resultsOtherUser, _fields) => {
        if (!err) {
            resultsOtherUser.forEach((img, index) => {
                if (
                    resultsOtherUser[index].images !== null &&
                    !resultsOtherUser[index].images.startsWith('http')
                ) {
                    resultsOtherUser[index].images = `${APP_URL}${resultsOtherUser[index].images}`
                }
            })
            userModel.getUserById(req.authUser.id, (err, resultsMe, _fields) => {
                if (!err) {
                    resultsMe.forEach((img, index) => {
                        if (
                            resultsMe[index].images !== null &&
                            !resultsMe[index].images.startsWith('http')
                        ) {
                            resultsMe[index].images = `${APP_URL}${resultsMe[index].images}`
                        }
                    })
                    const form = {
                        sender: resultsMe[0].phone_number,
                        recipient: recipient
                    }
                    chatModel.getAllChatRoom(form, (err, results, _fields) => {
                        if (!err) {
                            const form = {
                                sender: {
                                    name: resultsMe[0].name,
                                    images: resultsMe[0].images,
                                    phone_number: resultsMe[0].phone_number
                                },
                                recipient: {
                                    name: resultsOtherUser[0]?.name,
                                    images: resultsOtherUser[0]?.images,
                                    phone_number: resultsOtherUser[0]?.phone_number
                                },
                                message: results
                            }
                            return formResponse(res, 200, 'List chat Room', form);
                        } else {
                            return formResponse(res, 404, 'chat room not found', form);
                        }
                    })
                } else {
                    return formResponse(res, 404, 'chat room not found', form);
                }
            })
        } else {
            return formResponse(res, 500, 'error occured');
        }
    })
};

exports.getUserChat = (req, res) => {
    const { recipient } = req.body
    const phone_number = { phone_number: recipient }
    console.log("PHONE NUMBER: ", phone_number);
    chatModel.checkPhoneNumber(phone_number, (err, resultsOtherUser, _fields) => {
        if (!err) {
            resultsOtherUser.forEach((img, index) => {
                if (
                    resultsOtherUser[index].images !== null &&
                    !resultsOtherUser[index].images.startsWith('http')
                ) {
                    resultsOtherUser[index].images = `${APP_URL}${resultsOtherUser[index].images}`
                }
            })
            userModel.getUserById(req.authUser.id, (err, resultsMe, _fields) => {
                if (req.authUser) {
                    resultsMe.forEach((img, index) => {
                        if (
                            resultsMe[index].images !== null &&
                            !resultsMe[index].images.startsWith('http')
                        ) {
                            resultsMe[index].images = `${APP_URL}${resultsMe[index].images}`
                        }
                    })
                    const form = {
                        sender: resultsMe[0].phone_number,
                        recipient: recipient
                    }
                    console.log('====================================');
                    console.log("FORM: ", form);
                    console.log("RESULT ME: ", resultsMe);
                    console.log("OTHER USER: ", resultsOtherUser);
                    console.log('====================================');
                    chatModel.getUserChat(form, (err, results, _fields) => {
                        if (!err) {
                            results.forEach((img, index) => {
                                if (
                                    results[index].images !== null &&
                                    !results[index].images.startsWith('http')
                                ) {
                                    results[index].images = `${APP_URL}${results[index].images}`
                                }
                            })
                            const form = {
                                message: results
                            }
                            console.log("RESULTS: ", results);
                            return formResponse(res, 200, 'List chat Room', form);
                        }
                    })
                } else {
                    return formResponse(res, 404, 'user not found', null);
                }
            })
        } else {
            return formResponse(res, 500, 'error occured');
        }
    })
};

exports.searchUsers = (req, res) => {
    const data = req.query;
    data.search = data.q || '';
    data.cond = data.cond || 'name';
    data.id = req.authUser.id;
    chatModel.searchUsers(data, (err, results, _fields) => {
        if (!err) {
            results.forEach((img, index) => {
                if (
                    results[index].images !== null &&
                    !results[index].images.startsWith('http')
                ) {
                    results[index].images = `${APP_URL}${results[index].images}`
                }
            })
            return formResponse(res, 200, 'List users', results);
        } else {
            return formResponse(res, 404, 'User not found');
        }
    })
}

exports.deleteChat = (req, res) => {
    const { id } = req.params
    chatModel.deleteChat(id, (err, results, _fields) => {
        if (!err) {
            return formResponse(res, 200, 'chat has been deleted!', null);
        } else {
            return formResponse(res, 404, 'chat not found', null);
        }
    })
};