/* eslint-disable no-unused-vars */
const itemModel = require('../models/items');
const {response:formResponse} = require('../helpers/formResponse');
const {validateInteger} = require('../helpers/validation');
const { addItemCategory } = require('../models/itemCategories');

exports.getItems = (req, res) => {
    itemModel.getItems((err, results, _fields) => {
        if(!err) {
            return formResponse(res, 200, 'List of items', results);
        }
        else {
            return formResponse(res, 500, 'An error occured');
        }
    });
};

exports.addItem = (req, res) => {
    validateInteger(res, req.body.price, 'Price', () => {
        validateInteger(res, req.body.quantity, 'Quantity', () => {
            itemModel.addItem(req.body, (err, results, _fields) => {
                if (!err) {
                    if(results.affectedRows > 0 ) {
                        if(typeof req.body.category !== 'object') {
                            req.body.category = [req.body.category];
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
                        return formResponse(res, 200, 'Create item has been successfully!');
                    }
                    else {
                        return formResponse(res, 500, 'An error occured');
                    }
                } else {
                    return formResponse(res, 400, `Error: ${err.sqlMassege}`);
                }
            });
        });
    });
};

exports.updateItem = (req, res) => {
    const {id} = req.params;
    itemModel.getItemById(id, (err, results, _fields) => {
        if(!err) {
            if(results.length > 0) {
                const data = req.body;
                itemModel.updateItem(data,id, (err,results, _fields) => {
                    if(!err) {
                        return formResponse(res, 200, `item with id ${id} updated successfully!`);
                    }
                    else {
                        console.error(err);
                        return formResponse(res, 500,  'An error occured');
                    }
                });
            }
            else {
                return formResponse(res, 404,  'Item not found!');
            }
        }
        else {
            return formResponse(res, 400, `Error: ${err.sqlMassege}`);
        }
    });
};

// Search and Sort
exports.getItemSearchAndSort = (req, res) => {
    const order = req.query.sortBy || 'newest';
    const value = req.query.value || 'asc';
    const search = req.query.q || '';
    itemModel.getItemSearchAndSort(search, order, value, (err, results, _field) => {
        if(!err) {  
            if(results.length > 0) {
                return formResponse(res, 200, `Items search by ${search}`, results);
            } else {
                return formResponse(res, 404, 'Item not found');
            }
        } 
        else {
            return formResponse(res, 400, `Error: ${err.sqlMassege}`);
        }
        
    });
};

exports.getDetailItem = (req, res) => {
    const {id:stringId} = req.params;
    const id = parseInt(stringId);
    itemModel.getItemById(id, (err, results, _fields) => {
        if(!err){
            if(results.length > 0) {
                const data = {
                    id: '',
                    images: '',
                    name: '',
                    detail: '',
                    delivery_on: '',
                    quantity: '',
                    variants: [],
                    created_at : '',
                    updated_at: '',
                    ...results[0]
                };
                const hiddenColoumn = ['base_price', 'additional_price', 'end_price', 'variant_name', 'code'];
                hiddenColoumn.forEach(column => {
                    delete data[column];
                });
                results.forEach(item => {
                    data.variants.push({
                        name: item.variant_name,
                        code: item.code,
                        price: item.end_price
                    });
                });
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

exports.deleteItem = (req, res) => {
    const {id:stringId} = req.params;
    const id = parseInt(stringId);
    itemModel.getItemById(id, (err, results, _fields) => {
        if(!err) {
            if(results.length > 0) {
                itemModel.deleteItem(id, (err,results, _fields) => {
                    if(!err) {
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
