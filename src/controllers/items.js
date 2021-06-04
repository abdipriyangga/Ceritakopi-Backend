/* eslint-disable no-unused-vars */
const itemModel = require('../models/items');
const {response:formResponse} = require('../helpers/formResponse');
const {validateInteger} = require('../helpers/validation');

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
                        return formResponse(res, 200, 'Create item has been successfully!');
                    }
                    else {
                        return formResponse(res, 400, null, 'An error occured');
                    }
                } else {
                    // console.error(err);
                    // return formResponse(res, 400, 'An error occured');
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
                // const {name, images, price, id_category, detail} = req.body;
                // const updatedData = {id, name, images, price, id_category, detail, updated_at:timeHelper.now()};
                const data = req.body;
                itemModel.updateItem(data,id, (err,results, _fields) => {
                    if(!err) {
                        return formResponse(res, 200, true, `item with id ${id} updated successfully!`);
                    }
                    else {
                        console.error(err);
                        return formResponse(res, 500, false, 'An error occured');
                    }
                });
            }
            else {
                return formResponse(res, 404, false, 'Item not found!');
            }
        }
        else {
            return formResponse(res, 500, false, 'An error occured');
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
                return formResponse(res, 200, true, `Items search by ${search}`, results);
            } else {
                return formResponse(res, 404, false, 'Item not found');
            }
        } 
        else {
            console.error(err);
            return formResponse(res, 500, false, 'An error occured');
        }
        
    });
};

exports.getDetailItem = (req, res) => {
    const {id:stringId} = req.params;
    const id = parseInt(stringId);
    itemModel.getItemById(id, (err, results, _fields) => {
        if(!err){
            if(results.length === 1) {
                return formResponse(res, 200, 'Detail Item', results[0]);
            }
            else {
                return formResponse(res, 404, null, 'Item not Found!');
            }
        }
        else {
            return formResponse(res, 500,  null, 'An error occured!');
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
                        return formResponse(res, 200, true, `item with id ${id} has been deleted!`);
                    }
                    else {
                        console.error(err);
                        return formResponse(res, 500, false, 'An error occured');
                    }
                });
            }
            else {
                return formResponse(res, 404, false, 'Item not found!');
            }
        }
        else {
            return formResponse(res, 500, false, 'An error occured');
        }
    });
};
