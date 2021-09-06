/* eslint-disable no-unused-vars */
const categoriesModel = require('../models/categories');
const {response:formResponse} = require('../helpers/formResponse');
const { getItemsByCategories, getItemsByCategory, getItemsByCategoryAsync } = require('../models/items');

exports.getCategories = async (req, res) => {
    const results = await categoriesModel.getCategories();
    try {
        return formResponse(res, 200, 'List of categories', results);
    } catch (error) {
        return formResponse(res, 500, 'An error occured', error);
    }
};

exports.addCategories = async (req, res) => {
    const {name} = req.body
    try {
        if(name === '') {
            return formResponse(res, 400, 'You must input name categories!')
        } else {
            const data = await categoriesModel.addCategories(req.body);
            return formResponse(res, 200, 'Create categories has been successfully!', data);
        }
    } catch (error) {
        console.log(error);
        return formResponse(res, 500, 'An error occured!', error);
    }
};

// exports.getDetailCategories = async (req, res) => {
//     const {id:stringId} = req.params;
//     const id = parseInt(stringId);
//     const results = await categoriesModel.getCategoriesById(id);
//     try {
//         if (results.length === 1) {
//             return formResponse(res, 200, 'Detail Categories', results[0]);
//         }
//         else {
//             return formResponse(res, 404, 'Categories not Found!');
//         }
//     } catch (error) {
//         return formResponse(res, 500, 'an error occured!');
//     }
// };


exports.updateCategories = async (req, res) => {
    const {id} = req.params;
    const results = await categoriesModel.getCategoriesById(id);
    if (results.length > 0) {
        const data = req.body;
        const dataUpdate = await categoriesModel.updateCategories(data, id);
        return formResponse(res, 200, `Categeories updated successfully!`, dataUpdate);
    }
    else {
        return formResponse(res, 404, 'Categories not found!');
    }
};

exports.deleteCategories = async (req, res) => {
    const {id:stringId} = req.params;
    const id = parseInt(stringId);
    const getCategoryId = await categoriesModel.getCategoriesById(id);
    
    if (getCategoryId.length > 0) {
        const results = await categoriesModel.deleteCategories(id);
        return formResponse(res, 200, `categories has been deleted!`, results);
    }
    else {
        return formResponse(res, 404, 'categories not found!');
    }
};

exports.getItemsByCategories = async (req, res) => {
    const {id} = req.params;
    const results = await getItemsByCategoryAsync(id);
    try {
        if (!results[0]) {
            return formResponse(res, 400, 'Sorry items is nothing', results);
        } else {
            return formResponse(res, 200, 'List item by category!', results);
        }
    } catch (error) {
        return formResponse(res, 500, `An error occured!`);
    }
};