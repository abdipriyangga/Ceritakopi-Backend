/* eslint-disable quotes */
const myDb = require('../helpers/myDb');
const { promisify } = require('util');
const table = 'categories';
const execPromise = promisify(myDb.query).bind(myDb);

exports.getCategories = () => {
    return execPromise(`select id, name from ${table}`,)
};

exports.addCategories = (data) => {
    return execPromise(`insert into ${table} (name) values (?)`, [data.name]);
};

exports.getCategoriesById = (id) => {
    return execPromise(`select * from ${table} where id = ${id}`);
};

exports.updateCategories = (data, id) => {
    return execPromise(`update ${table} set ? where id=?`, [data, id]);
};

exports.deleteCategories = (id) => {
    return execPromise(`DELETE FROM ${table} WHERE id = ?`, [id]);
};
