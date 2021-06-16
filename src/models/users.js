/* eslint-disable quotes */

const myDb = require('../helpers/myDb');
const table = 'users';
const { promisify } = require('util');
const execPromise = promisify(myDb.query).bind(myDb);

exports.createUsers = (data, cb) => {
    myDb.query(`
    INSERT INTO ${table} (name, email, password) VALUES (?,?,?)
    `, [data.name, data.email, data.password], cb);
};

exports.getUserByEmail = (email, cb) => {
    myDb.query(`
    SELECT users.id ,users.email, users.password FROM users WHERE users.email = ?
    `, [email], cb);
};
exports.getUserRole = (id, cb) => {
    myDb.query(`
    SELECT role FROM users WHERE id = ?
    `, [id], cb);
};

exports.getUserRoleAsync = (id) => {
    return execPromise(`
    SELECT role FROM users WHERE id = ?
    `, [id]);
};
exports.getUserIdAsync = (id) => {
    return execPromise(`
    SELECT id FROM users WHERE id = ?
    `, [id]);
};
exports.getUserById = (id, cb) => {
    myDb.query(`
    SELECT id, role, name, images, email, address, phone_number FROM users WHERE id = ?
    `, [id], cb);
};