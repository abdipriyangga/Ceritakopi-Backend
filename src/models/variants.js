/* eslint-disable quotes */
const myDb = require('../helpers/myDb');

exports.getVariants = (cb) => {
    myDb.query('select name, code from variants',cb);
};

exports.addVariants = (data, cb) => {
    myDb.query(`insert into variants (name, code) values (?, ?)`, [data.name, data.code] ,cb);
};

exports.getVariantsById = (id, cb) => {
    myDb.query(`select * from variants where id = ${id}`, cb);
};

exports.updateVariants = (data,id, cb) => {
    myDb.query(`update variants set ? where id=?`, [data,id], cb);
};

exports.deleteVariants = (id, cb) => {
    myDb.query(`DELETE FROM variants WHERE id=?`, [id], cb);
};