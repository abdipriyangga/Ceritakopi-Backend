/* eslint-disable quotes */
const myDb = require('../helpers/myDb');

exports.getCategories = (cb) => {
    myDb.query('select * from categories', cb);
};

exports.addCategories = (data, cb) => {
    myDb.query(`insert into categories (name) values ('${data.name}')`, cb);
};

exports.getCategoriesById = (id, cb) => {
    myDb.query(`select * from categories where id = ${id}`, cb);
};

exports.updateCategories = (data,id, cb) => {
    // myDb.query(`update items set name='${data.name}', images=${data.images}, price=${data.price}, id_category=${data.id_category}, detail='${data.detail}', updated_at='${data.updated_at}' where id=${data.id}`, cb);
    myDb.query(`update categories set ? where id=?`, [data,id], cb);
};

exports.deleteCategories = (id, cb) => {
    myDb.query(`DELETE FROM categories WHERE id=?`, [id], cb);
};