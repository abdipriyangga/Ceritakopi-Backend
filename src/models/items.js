/* eslint-disable quotes */
const myDb = require('../helpers/myDb');

exports.getItems = (cb) => {
    myDb.query('select items.id, items.name as product_name, items.images, items.price, items.created_at from items', cb);
};

exports.addItem = (data, cb) => {
    myDb.query(`insert into items (name,images,price,quantity,delivery_on,detail) values (?,?,?,?,?,?)`, [data.name, data.images, data.price, data.quantity, data.delivery_on, data.detail], cb);
};

exports.getItemById = (id, cb) => {
    myDb.query(`SELECT items.id, items.images, items.name, items.detail, items.quantity, items.delivery_on, items.price as base_price, item_variants.additional_price, 
(items.price + item_variants.additional_price) as end_price,variants.name as variant_name, variants.code, items.created_at, items.updated_at from items 
INNER JOIN item_variants on item_variants.id_item = items.id
INNER Join variants on item_variants.id_variant = variants.id where items.id = ?`, [id], cb);
};

exports.updateItem = (data,id, cb) => {
    myDb.query(`update items set ? where id=?`, [data,id], cb);
};

exports.deleteItem = (id, cb) => {
    myDb.query(`DELETE FROM items WHERE id=?`, [id], cb);
};

// Search and Sort
exports.getItemSearchAndSort = (search, order, value, cb) => {
    myDb.query(`SELECT items.id, items.name, items.images, items.price as price, items.id_category, items.detail, categories.name as category_name, items.created_at as newest FROM items LEFT JOIN categories ON categories.id = items.id_category WHERE items.name LIKE '%${search}%' ORDER BY ${order} ${value}`, [search, order, value], cb);
};

exports.getItemsByCategory = (id, cb) => {
    myDb.query(`SELECT items.name, items.images, items.price as price FROM items LEFT JOIN item_category ON item_category.id_item = items.id where item_category.id_category = ?`, [id], cb);
};