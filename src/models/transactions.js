const myDb = require('../helpers/myDb');
const table = 'transactions';
const { promisify } = require('util');
const execPromise = promisify(myDb.query).bind(myDb);

exports.createTransaction = (data, cb) => {
    myDb.query(`
    INSERT INTO ${table} (code_transaction, id_user, total, tax, shipping_cost, shipping_address, payment_method)
    VALUES (?,?,?,?,?,?,?)
    `, [data.code, data.id_user, data.total, data.tax, data.shipping_cost, data.shipping_address, data.payment_method], cb);
};

exports.createProductTransaction = (data, cb) => {
    myDb.query(`
    INSERT INTO items_transaction (name, variants, price, amount, id_item, id_transaction) VALUES (?,?,?,?,?,?)
    `, [data.name, data.variants, data.price, data.amount, data.id_item, data.id_transaction], cb);
};

exports.getTransactionById = (id, cb) => {
    myDb.query(`
    SELECT items_transaction.name AS item_name, transactions.id, transactions.code_transaction, transactions.total, transactions.tax, transactions.shipping_cost, transactions.shipping_address, transactions.payment_method, items.images, transactions.created_at  FROM ${table}
    LEFT JOIN items_transaction ON items_transaction.id_transaction = transactions.id
    LEFT JOIN items ON items_transaction.id_item = items.id
    where transactions.id_user = ? ORDER BY transactions.created_at DESC;
    `, [id], cb);
};

exports.getTransactionDetail = (id, cb) => {
    myDb.query(`
    SELECT items_transaction.id_transaction, name, price, amount FROM items_transaction
    WHERE items_transaction.id_transaction = ?`, [id], cb);
};

exports.createTransactionPromise = (data) => {
    return execPromise(`INSERT INTO ${table} (code_transaction, id_user, total, tax, shipping_cost, shipping_address, payment_method)
    VALUES (?,?,?,?,?,?,?)`, [data.code, data.id_user, data.total, data.tax, data.shipping_cost, data.shipping_address, data.payment_method])
};
exports.getTransactionId = (id) => {
    return execPromise(`SELECT id, code_transaction, total, tax, shipping_cost, shipping_address, payment_method FROM ${table} WHERE id = ?`, [id])
}
exports.deleteHistory = (id) => {
    return execPromise(`DELETE FROM transactions WHERE id=?`, [id])
}