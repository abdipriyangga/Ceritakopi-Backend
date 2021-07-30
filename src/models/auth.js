/* eslint-disable quotes */
const myDb = require('../helpers/myDb');

const table = 'users';

exports.createUser = (data, cb) => {
    myDb.query(`insert into ${table} (email, password, phone_number) values (?, ?, ?)`, [data.email, data.password, data.phone_number], cb);
};

exports.getUserByEmail = (email, cb) => {
    myDb.query(`Select id, email, password from ${table} where email = ?`, email, cb);
};

exports.getUserById = (id, cb) => {
    myDb.query(`
    SELECT id, name, images, email, address, phone_number, role FROM ${table} WHERE id = ?
    `, [id], cb);
};

exports.checkEmailForgot = (email, cb) => {
    myDb.query(`select email from ${table} where email =  ?`, email, cb);
};