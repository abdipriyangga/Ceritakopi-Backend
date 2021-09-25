/* eslint-disable no-unused-vars */
const itemModel = require('../models/items');
const { response: formResponse } = require('../helpers/formResponse');
const { validateInteger } = require('../helpers/validation');
const { addItemCategory } = require('../models/itemCategories');
const itemImage = require('../helpers/upload');
const path = require('path');
const { addItemVariant } = require('../models/itemVariants');
const { APP_URL, APP_UPLOAD_ROUTE } = process.env;

exports.getItems = async (req, res) => {
    const cond = req.query;
    cond.limit = cond.limit || 12;
    cond.offset = cond.offset || 0;
    cond.page = cond.page || 1;
    cond.offset = (cond.page - 1) * cond.limit;
    const results = await itemModel.getItems(cond);
    const countResult = await itemModel.getProductCount();
    const pageInfo = {};
    try {

        // console.log('total items: ', countResult[0].count_item);

        const totalItems = countResult[0].count_item;
        // console.log(totalItems);
        const lastPage = Math.ceil(totalItems / cond.limit);
        pageInfo.totalItems = totalItems
        pageInfo.currentPage = cond.page
        pageInfo.lastPage = lastPage
        pageInfo.limitData = cond.limit
        pageInfo.nextPage =
            cond.page < lastPage
                ? `${APP_URL}/items?page=${cond.page + 1}`
                : null
        pageInfo.prevPage =
            cond.page > 1
                ? `${APP_URL}/items?page=${cond.page - 1}`
                : null
        return formResponse(res, 200, 'List of items', results, pageInfo);
    } catch (error) {
        return formResponse(res, 500, 'An error occured!', error);
    }
};

exports.addItem = (req, res) => {
    itemImage(req, res, err => {
        validateInteger(res, req.body.price, 'Price', () => {
            validateInteger(res, req.body.quantity, 'Quantity', () => {
                req.body.images = path.join(process.env.APP_UPLOAD_ROUTE, req.file.filename);
                try {
                    itemModel.addItem(req.body, (err, results, _fields) => {
                        if (!err) {
                            if (results.affectedRows > 0) {
                                if (req.body.category) {
                                    if (typeof req.body.category !== 'object') {
                                        req.body.category = [req.body.category];
                                    }
                                    if (typeof req.body.variant !== 'object') {
                                        req.body.variant = [req.body.variant];
                                    }
                                    if (typeof req.body.priceVariant !== 'object') {
                                        req.body.priceVariant = [req.body.priceVariant];
                                    }
                                    req.body.category.forEach(category => {
                                        const data = {
                                            id_item: results.insertId,
                                            id_category: category
                                        };
                                        addItemCategory(data, () => {
                                            console.log(`item ${results.insertId} add to category ${category}`);
                                        });
                                    });
                                    req.body.variant.forEach((idVariant, idx) => {
                                        const data = {
                                            id_item: results.insertId,
                                            id_variant: idVariant,
                                            additional_price: req.body.priceVariant[idx]
                                        };
                                        addItemVariant(data, () => {
                                            console.log(`id variant: ${idVariant}`);
                                        });
                                    });
                                }
                                return formResponse(res, 200, 'Create item has been successfully!');
                            } else {
                                return formResponse(res, 500, 'An error occured');
                            }
                        } else {
                            return formResponse(res, 400, `Error: ${err.sqlMassege}`);
                        }
                    });
                } catch (error) {
                    return formResponse(res, 400, `Error: ${error.sqlMassege}`, error);
                }
            });
        });
    });
};

exports.updateItem = (req, res) => {
    const { id } = req.params;
    itemModel.getItemById(id, (err, results, _fields) => {
        if (!err) {
            if (results.length > 0) {
                const data = req.body;
                itemModel.updateItem(data, id, (err, results, _fields) => {
                    if (!err) {
                        return formResponse(res, 200, `item with id ${id} updated successfully!`);
                    }
                    else {
                        console.error(err);
                        return formResponse(res, 500, 'An error occured');
                    }
                });
            }
            else {
                return formResponse(res, 404, 'Item not found!');
            }
        }
        else {
            return formResponse(res, 400, `Error: ${err.sqlMassege}`);
        }
    });
};

// Search and Sort
exports.getItemSearchAndSort = (req, res) => {
    const cond = req.query;
    cond.limit = cond.limit || 5;
    cond.offset = cond.offset || 0;
    cond.order = cond.sortBy || 'newest';
    cond.value = cond.value || 'asc';
    cond.search = cond.q || '';
    cond.page = cond.page || 1;
    cond.offset = (cond.page - 1) * cond.limit;

    itemModel.getItemSearchAndSort(cond, (err, results, _field) => {
        if (!err) {
            if (!err) {
                return formResponse(res, 200, 'List of items', results);
            } else {
                return formResponse(res, 404, 'Item not found');
            }
        }
        else {
            console.log(err);
            return formResponse(res, 400, `Error: ${err}`);
        }

    });
};

exports.getDetailItem = (req, res) => {
    const { id: stringId } = req.params;
    const id = parseInt(stringId);
    itemModel.getItemById(id, (err, results, _fields) => {
        if (!err) {
            if (results.length > 0) {
                const item = results[0];
                if (item.images !== null && !item.images.startsWith('http')) {
                    item.images = `${APP_URL}${item.images}`;
                }
                const data = {
                    id: '',
                    images: '',
                    name: '',
                    detail: '',
                    delivery_on: '',
                    quantity: '',
                    variants: [],
                    created_at: '',
                    updated_at: '',
                    ...results[0]
                };
                const hiddenColoumn = ['additional_price', 'end_price', 'variant_name', 'code'];
                hiddenColoumn.forEach(column => {
                    delete data[column];
                });
                results.forEach(item => {
                    data.variants.push({
                        id: item.id,
                        images: item.images,
                        id_variant: item.id_variant,
                        item_name: item.name,
                        name: item.variant_name,
                        code: item.code,
                        base_price: item.base_price,
                        price: item.end_price
                    });
                });
                console.log(data);
                return formResponse(res, 200, 'Detail Item', data);
            }
            else {
                return formResponse(res, 404, 'Item not Found!');
            }
        }
        else {
            return formResponse(res, 400, `Error: ${err.sqlMassege}`);
        }
    });
};

exports.getItemByCategory = (req, res) => {
    const { id: stringId } = req.params;
    const id = parseInt(stringId);
    itemModel.getItemsByCategory(id, (err, results, _fields) => {
        if (!err) {
            return formResponse(res, 200, 'Item with category ', results);
        }
        else {
            return formResponse(res, 500, 'An error occured');
        }
    });
};

exports.deleteItem = (req, res) => {
    const { id: stringId } = req.params;
    const id = parseInt(stringId);
    itemModel.getItemById(id, (err, results, _fields) => {
        if (!err) {
            if (results.length > 0) {
                itemModel.deleteItem(id, (err, results, _fields) => {
                    if (!err) {
                        return formResponse(res, 200, `item with id ${id} has been deleted!`);
                    }
                    else {
                        return formResponse(res, 500, 'An error occured');
                    }
                });
            }
            else {
                return formResponse(res, 404, 'Item not found!');
            }
        }
        else {
            return formResponse(res, 400, `Error: ${err.sqlMassege}`);
        }
    });
};
