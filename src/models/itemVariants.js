const myDb = require('../helpers/myDb');

const table = 'item_variants';

exports.addItemVariant = (data, cb) => {
    myDb.query(`insert into ${table} (additional_price, id_item, id_variant) values (?,?,?)`,[data.additional_price, data.id_item, data.id_variant], cb);
};
