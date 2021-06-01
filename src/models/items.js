/* eslint-disable quotes */
const myDb = require('../helpers/myDb');

exports.getItems = (cb) => {
    myDb.query('select * from items', cb);
};

exports.addItem = (data, cb) => {
    myDb.query(`insert into items (name,price,id_category,detail) values ('${data.name}','${data.price}', '${data.id_category}','${data.detail}')`, cb);
};

exports.getItemById = (id, cb) => {
    myDb.query(`select * from items where id = ${id}`, cb);
};

exports.updateItem = (data,id, cb) => {
    // myDb.query(`update items set name='${data.name}', images=${data.images}, price=${data.price}, id_category=${data.id_category}, detail='${data.detail}', updated_at='${data.updated_at}' where id=${data.id}`, cb);
    myDb.query(`update items set ? where id=?`, [data,id], cb);
};

exports.deleteItem = (id, cb) => {
    myDb.query(`DELETE FROM items WHERE id=?`, [id], cb);
};

// Search and Sort
exports.getItemSearchAndSort = (search, order, value, cb) => {
    myDb.query(`SELECT items.id, items.name, items.images, items.price as price, items.id_category, items.detail, categories.name as category_name, items.created_at as newest FROM items LEFT JOIN categories ON categories.id = items.id_category WHERE items.name LIKE '%${search}%' ORDER BY ${order} ${value}`, [search, order, value], cb);
};