const myDb = require('../helpers/myDb');
const table = 'transactions';

exports.createTransaction = (data, cb) => {
    myDb.query(`
    INSERT INTO ${table} (code_transaction, id_user, total, tax, shipping_cost, shipping_address, payment_method)
    VALUES (?,?,?,?,?,?,?)
    `, [data.code, data.id_user, data.total, data.tax, data.shipping_cost, data.shipping_address, data.payment_method], cb);
};

exports.createProductTransaction = (data, cb) => {
    myDb.query(`
    INSERT INTO items_transaction (name, price, amount, id_item, id_transaction) VALUES (?,?,?,?,?)
    `, [data.name, data.price, data.amount, data.id_item, data.id_transaction], cb);
};

exports.getTransactionByIdOn = (id, cb) => {
    myDb.query(`
    SELECT id, code, total, tax, shipping_cost, shipping_address, payment_method FROM ${table}
    WHERE id_user = ?`, [id], cb);
};

exports.getTransactionDetail = (id, cb) => {
    myDb.query(`
    SELECT items_transaction.id_transaction, name, price, amount FROM items_transaction
    WHERE items_transaction.id_transaction = ?`, [id], cb);
};