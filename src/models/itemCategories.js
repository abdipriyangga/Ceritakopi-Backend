/* eslint-disable quotes */
const myDb = require('../helpers/myDb');

const table = 'item_category';

exports.addItemCategory = (data, cb) => {
    myDb.query(`insert into ${table} (id_item, id_category) values (?,?)`,[data.id_item, data.id_category], cb);
};

