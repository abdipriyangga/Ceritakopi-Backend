/* eslint-disable no-unused-vars */
const itemModel = require('../models/items');
const {response:formResponse} = require('../helpers/formResponse');
const timeHelper = require('../helpers/time');
exports.getItems = (req, res) => {
    itemModel.getItems((err, results, _fields) => {
        if(!err) {
            return formResponse(res, 200, true, 'List of items', results);
        }
        else {
            return formResponse(res, 500, false, 'Bad request');
        }
    });
};

exports.addItem = (req, res) => {
    itemModel.addItem(req.body, () => {
        return formResponse(res, 200, true, 'Create item has been successfully!');
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
                        return formResponse(res, 500, false, 'Bad request');
                    }
                });
            }
            else {
                return formResponse(res, 404, false, 'Item not found!');
            }
        }
        else {
            return formResponse(res, 500, false, 'Bad request');
        }
    });
};

// Search and Sort
exports.getItemSearchAndSort = (req, res) => {
    const sort = req.query.sort;
    const search = req.query.q;
    itemModel.getItemSearchAndSort(search, sort, (err, results, _field) => {
        if(!err) {
            if (results.length > 0) {
                return formResponse(res, 200, true, 'Search items', results);
            } else {
                return formResponse(res, 404, false, 'Item not found');
            }
        } 
        else {
            console.log('hello');
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
                return formResponse(res, 200, true, 'Detail Item', results[0]);
            }
            else {
                return formResponse(res, 404, false, 'Item not Found!');
            }
        }
        else {
            return formResponse(res, 500, false, 'Bad Request!');
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
                        return formResponse(res, 200, true, `item with id ${id} has been delete!`);
                    }
                    else {
                        console.error(err);
                        return formResponse(res, 500, false, 'Bad request');
                    }
                });
            }
            else {
                return formResponse(res, 404, false, 'Item not found!');
            }
        }
        else {
            return formResponse(res, 500, false, 'Bad request');
        }
    });
};
