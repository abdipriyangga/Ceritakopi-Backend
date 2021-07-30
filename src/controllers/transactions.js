const {response:formResponse} = require('../helpers/formResponse');
const {codeTransaction} = require('../helpers/transactions');
const {getItembyIdTrx} = require('../models/items');
const {createTransaction, createProductTransaction, getTransactionById, getTransactionDetail } = require('../models/transactions');
const {getUserById} = require('../models/auth');

exports.createTransaction = (req, res) => {
    const data = req.body;
    if (typeof data.id_item === 'string') {
        data.id_item = [data.id_item];
        data.item_amount = [data.item_amount];
    }
    getItembyIdTrx(data.id_item.map(id => parseInt(id)), (err, items) => {
        if (!err) {
            const code = codeTransaction(process.env.APP_TRANSACTION_PREFIX, 1);
            const total = items.map((item, idx) => item.price * data.item_amount[idx]).reduce((acc, curr) => acc + curr);
            const tax = total * (10 / 100);
            const shippingCost = 10000;
            const paymentMethod = data.payment_method;
            const idUser = req.authUser.id;
            getUserById(idUser, (err, results) => {
                if (!err) {
                    const shippingAddress = results[0].address;
                    const finalData = {
                        code,
                        total,
                        tax,
                        shipping_cost: shippingCost,
                        shipping_address: shippingAddress,
                        payment_method: paymentMethod,
                        id_user: idUser
                    };
                    createTransaction(finalData, (err, results) => {
                        if (!err) {
                            items.forEach((item, idx) => {
                                const dataFinal = {
                                    name: item.name,
                                    price: item.price,
                                    amount: data.item_amount[idx],
                                    id_item: item.id,
                                    id_transaction: results.insertId
                                };
                                console.log(dataFinal);
                                createProductTransaction(dataFinal, (err) => {
                                    if(err) throw err;
                                });
                            });
                            return formResponse(res, 200, 'transaction success');
                        } else {
                            console.log(err);
                            return formResponse(res, 400, 'transaction failed');
                        }
                    });
                } else {
                    return formResponse(res, 404, 'id not found!');
                }
            });
        } else {
            return formResponse(res, 404, 'id not found!');
        }
    });
};

exports.getTransactionById = (req, res) => {
    const { id } = req.authUser;
    getTransactionById(id, (err, results) => {
        if (results < 1) {
            return formResponse(res, 404, 'History not found');
        }
        if (!err) {
            return formResponse(res,  200, 'History Transaction', results);
        } else {
            console.log(err);
            return formResponse(res, 404, 'History not found');
        }
    });
};

exports.getTransactionDetail = (req, res) => {
    const { id } = req.params;
    getTransactionDetail(id, (err, results) => {
        if (!err) {
            formResponse(res, 200,'History Detail', results);
        } else {
            formResponse(res, 404, 'History not found');
        }
    });
};