/* eslint-disable quotes */
const myDb = require('../helpers/myDb');
const {promisify} = require('util');
const table = 'users';
const execPromise = promisify(myDb.query).bind(myDb);
const role = 'general';

exports.createUser = (data) => {
    return execPromise(`insert into ${table} (email, password, phone_number, role) values (?, ?, ?, ${role})`, [data.email, data.password, data.phone_number, data.role]);
};

exports.getUserByEmail = (email) => {
    return execPromise(`Select id, email, password from ${table} where email = ?`, email)
};

exports.getUserByPhoneNumber = (phone_number) => {
    return execPromise(`Select id, email, password, phone_number from ${table} where phone_number = ?`, phone_number)
};

exports.getUserById = (id, cb) => {
    myDb.query(`
    SELECT id, name, images, email, address, phone_number, role FROM ${table} WHERE id = ?
    `, [id], cb);
};
