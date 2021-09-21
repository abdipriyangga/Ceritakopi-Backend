/* eslint-disable no-unused-vars */
const categoriesModel = require('../models/categories');
const { response: formResponse } = require('../helpers/formResponse');
const { getItemCountByCategory, getItemsByCategoryAsync } = require('../models/items');
const { APP_URL } = process.env
exports.getCategories = async (req, res) => {
    const results = await categoriesModel.getCategories();
    try {
        return formResponse(res, 200, 'List of categories', results);
    } catch (error) {
        return formResponse(res, 500, 'An error occured', error);
    }
};

exports.addCategories = async (req, res) => {
    const { name } = req.body
    try {
        if (name === '') {
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
    const { id } = req.params;
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
    const { id: stringId } = req.params;
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
    const { id } = req.params;
    const cond = req.query;
    cond.limit = cond.limit || 7;
    cond.offset = cond.offset || 0;
    cond.page = cond.page || 1;
    cond.offset = (cond.page - 1) * cond.limit;
    const results = await getItemsByCategoryAsync(id, cond);
    // const results = await itemModel.getItems(cond);
    console.log(results);
    const countResult = await getItemCountByCategory(id);
    const pageInfo = {};
    try {
        if (!results[0]) {
            return formResponse(res, 400, 'Sorry items is nothing', results);
        } else {

            // console.log('total items: ', countResult[0].count_item);

            const totalItems = countResult[0].count_item;
            console.log('total items: ', totalItems);
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
            return formResponse(res, 200, 'List item by category!', results, pageInfo);
        }
    } catch (error) {
        console.log(error);
        return formResponse(res, 500, `An error occured!`, error, pageInfo);
    }
};