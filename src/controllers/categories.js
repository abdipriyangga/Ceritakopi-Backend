/* eslint-disable no-unused-vars */
const categoriesModel = require('../models/categories');
const {response:formResponse} = require('../helpers/formResponse');
const { getItemsByCategories, getItemsByCategory } = require('../models/items');

exports.getCategories = (req, res) => {
    categoriesModel.getCategories((err, results, _fields) => {
        if(!err) {
            return formResponse(res, 200, 'List of categories', results);
        }
        else {
            return formResponse(res, 500,  'An error occured');
        }
    });
};

exports.addCategories = (req, res) => {
    categoriesModel.addCategories(req.body, (err) => {
        if (!err) {
            return formResponse(res, 200, null ,'Create categories has been successfully!');
        } else {
            return formResponse(res, 400,  'Bad Request!');
        }
    });
};

exports.getDetailCategories = (req, res) => {
    const {id:stringId} = req.params;
    const id = parseInt(stringId);
    categoriesModel.getCategoriesById(id, (err, results, _fields) => {
        if(!err){
            if(results.length === 1) {
                return formResponse(res, 200,  'Detail Categories', results[0]);
            }
            else {
                return formResponse(res, 404,  'Categories not Found!');
            }
        }
        else {
            return formResponse(res, 400,  `Error: ${err.sqlMessage}`);
        }
    });
};


exports.updateCategories = (req, res) => {
    const {id} = req.params;
    categoriesModel.getCategoriesById(id, (err, results, _fields) => {
        if(!err) {
            if(results.length > 0) {
                // const {name, images, price, id_category, detail} = req.body;
                // const updatedData = {id, name, images, price, id_category, detail, updated_at:timeHelper.now()};
                const data = req.body;
                categoriesModel.updateCategories(data,id, (err,results, _fields) => {
                    if(!err) {
                        return formResponse(res, 200, `Categeories with id ${id} updated successfully!`);
                    }
                    else {
                        console.error(err);
                        return formResponse(res, 500,  'An error occured');
                    }
                });
            }
            else {
                return formResponse(res, 404,  'Categories not found!');
            }
        }
        else {
            return formResponse(res, 400, null ,`Error: ${err.sqlMessage}`);
        }
    });
};

exports.deleteCategories = (req, res) => {
    const {id:stringId} = req.params;
    const id = parseInt(stringId);
    categoriesModel.getCategoriesById(id, (err, results, _fields) => {
        if(!err) {
            if(results.length > 0) {
                categoriesModel.deleteCategories(id, (err,results, _fields) => {
                    if(!err) {
                        return formResponse(res, 200,  `categories with id ${id} has been deleted!`);
                    }
                    else {
                        console.error(err);
                        return formResponse(res, 500,  'An error occured');
                    }
                });
            }
            else {
                return formResponse(res, 404, 'categories not found!');
            }
        }
        else {
            return formResponse(res, 400, `Error: ${err.sqlMessage}`);
        }
    });
};

exports.getItemsByCategories = (req, res) => {
    const {id} = req.params;
    getItemsByCategory(id, (err,results, _fields) => {
        if(!err) {
            return formResponse(res, 200, 'List item by category!', results);
        }
        else {
            return formResponse(res, 400, `Error: ${err.sqlMessage}`);
        }
    });
};