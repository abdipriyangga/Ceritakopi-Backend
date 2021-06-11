/* eslint-disable quotes */
const myDb = require('../helpers/myDb');

const table = 'categories';

exports.getCategories = (cb) => {
    myDb.query(`select name from ${table}`, cb);
};

exports.addCategories = (data, cb) => {
    myDb.query(`insert into ${table} (name) values (?)`, [data.name], cb);
};

exports.getCategoriesById = (id, cb) => {
    myDb.query(`select * from ${table} where id = ${id}`, cb);
};

exports.updateCategories = (data,id, cb) => {
    // myDb.query(`update items set name='${data.name}', images=${data.images}, price=${data.price}, id_category=${data.id_category}, detail='${data.detail}', updated_at='${data.updated_at}' where id=${data.id}`, cb);
    myDb.query(`update ${table} set ? where id=?`, [data,id], cb);
};

exports.deleteCategories = (id, cb) => {
    myDb.query(`DELETE FROM ${table} WHERE id=?`, [id], cb);
};
