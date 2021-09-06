/* eslint-disable no-unused-vars */
const variantsModel = require('../models/variants');
const {response:formResponse} = require('../helpers/formResponse');


exports.getVariants = async (req, res) => {
    const results = await variantsModel.getVariants();
    try {
        return formResponse(res, 200, 'List of variants', results);
    } catch (error) {
        return formResponse(res, 500, 'An error occured');
    }
    
};

exports.addVariants = async (req, res) => {
    const {name, code} = req.body;
    try {
        if (name === '' || code === '') {
            return formResponse(res, 400, 'You must input name and code variants!')
        } else {
            const results = await variantsModel.addVariants(req.body);
            return formResponse(res, 200, 'Create variants has been successfully!', results);
        }
    } catch (error) {
        // console.log(error);
        return formResponse(res, 500, 'An error occured!', error);
    }
    
};

exports.getDetailVariants = async (req, res) => {
    const {id:stringId} = req.params;
    const id = parseInt(stringId);
    try {
        const results = await variantsModel.getVariantsById(id);
        if (results.length === 1) {
            return formResponse(res, 200, 'Detail variants', results[0]);
        }
        else {
            return formResponse(res, 404, 'Variant not Found!');
        }
    } catch (error) {
        console.log(error);
        return formResponse(res, 500, 'An error occured!', error)
    }
};


exports.updateVariants = async (req, res) => {
    const {id} = req.params;
    const getVariantId = await variantsModel.getVariantsById(id);
    try {
        if (getVariantId.length > 0) {
            const data = req.body;
            const results = await variantsModel.updateVariants(data, id);
            return formResponse(res, 200, `Variant updated successfully!`, results[0]);
        }
        else {
            return formResponse(res, 404, 'Variants not found!');
        }
    } catch (error) {
        return formResponse(res, 500, 'An error occured!', error);
    }
    
};

exports.deleteVariants = async (req, res) => {
    const {id:stringId} = req.params;
    const id = parseInt(stringId);
    
    const getVariantId = await variantsModel.getVariantsById(id);
    try {
        if (getVariantId.length > 0) {
            const results = await variantsModel.deleteVariants(id);
            return formResponse(res, 200, `variant has been deleted!`, results);
        }
        else {
            return formResponse(res, 404, 'variant not found!');
        }
    } catch (error) {
        console.log(error);
        return formResponse(res, 500, 'An error occured', error);
    }
};