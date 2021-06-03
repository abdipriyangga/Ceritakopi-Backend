/* eslint-disable quotes */
const myDb = require('../helpers/myDb');

exports.getVariants = (cb) => {
    myDb.query('select * from variants', cb);
};

exports.addVariants = (data, cb) => {
    myDb.query(`insert into variants (name) values ('${data.name}')`, cb);
};

exports.getVariantsById = (id, cb) => {
    myDb.query(`select * from variants where id = ${id}`, cb);
};

exports.updateVariants = (data,id, cb) => {
    // myDb.query(`update items set name='${data.name}', images=${data.images}, price=${data.price}, id_category=${data.id_category}, detail='${data.detail}', updated_at='${data.updated_at}' where id=${data.id}`, cb);
    myDb.query(`update variants set ? where id=?`, [data,id], cb);
};

exports.deleteVariants = (id, cb) => {
    myDb.query(`DELETE FROM variants WHERE id=?`, [id], cb);
};