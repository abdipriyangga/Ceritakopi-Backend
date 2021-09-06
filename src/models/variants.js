/* eslint-disable quotes */
const myDb = require('../helpers/myDb');
const { promisify } = require('util');
const execPromise = promisify(myDb.query).bind(myDb);

exports.getVariants = (cb) => {
    return execPromise('select name, code from variants', cb);
};

exports.addVariants = (data) => {
    return execPromise(`insert into variants (name, code) values (?, ?)`, [data.name, data.code]);

};

exports.getVariantsById = (id) => {
    return execPromise(`select * from variants where id = ${id}`);
};

exports.updateVariants = (data,id) => {
    return execPromise(`update variants set ? where id=?`, [data, id]);
};

exports.deleteVariants = (id) => {
    return execPromise(`DELETE FROM variants WHERE id=?`, [id]);
};