/* eslint-disable no-unused-vars */
const variantsModel = require('../models/categories');
const {response:formResponse} = require('../helpers/formResponse');


exports.getVariants = (req, res) => {
    variantsModel.getvariants((err, results, _fields) => {
        if(!err) {
            return formResponse(res, 200, true, 'List of variants', results);
        }
        else {
            return formResponse(res, 500, false, 'An error occured');
        }
    });
};

exports.addVariants = (req, res) => {
    variantsModel.addVariants(req.body, (err) => {
        if (!err) {
            return formResponse(res, 200, true, 'Create variants has been successfully!');
        } else {
            return formResponse(res, 400, false, 'Bad Request!');
        }
    });
};

exports.getDetailVariants= (req, res) => {
    const {id:stringId} = req.params;
    const id = parseInt(stringId);
    variantsModel.getVariantsById(id, (err, results, _fields) => {
        if(!err){
            if(results.length === 1) {
                return formResponse(res, 200, true, 'Detail variants', results[0]);
            }
            else {
                return formResponse(res, 404, false, 'Variant not Found!');
            }
        }
        else {
            return formResponse(res, 500, false, 'An error occured!');
        }
    });
};


exports.updateVariants = (req, res) => {
    const {id} = req.params;
    variantsModel.getVariantsById(id, (err, results, _fields) => {
        if(!err) {
            if(results.length > 0) {
                // const {name, images, price, id_category, detail} = req.body;
                // const updatedData = {id, name, images, price, id_category, detail, updated_at:timeHelper.now()};
                const data = req.body;
                variantsModel.updateVariants(data,id, (err,results, _fields) => {
                    if(!err) {
                        return formResponse(res, 200, true, `Variant with id ${id} updated successfully!`);
                    }
                    else {
                        console.error(err);
                        return formResponse(res, 500, false, 'An error occured');
                    }
                });
            }
            else {
                return formResponse(res, 404, false, 'Variants not found!');
            }
        }
        else {
            return formResponse(res, 500, false, 'An error occured');
        }
    });
};

exports.deleteVariants = (req, res) => {
    const {id:stringId} = req.params;
    const id = parseInt(stringId);
    variantsModel.getVariantsById(id, (err, results, _fields) => {
        if(!err) {
            if(results.length > 0) {
                variantsModel.deleteVariants(id, (err,results, _fields) => {
                    if(!err) {
                        return formResponse(res, 200, true, `variant with id ${id} has been deleted!`);
                    }
                    else {
                        console.error(err);
                        return formResponse(res, 500, false, 'An error occured');
                    }
                });
            }
            else {
                return formResponse(res, 404, false, 'variant not found!');
            }
        }
        else {
            return formResponse(res, 500, false, 'An error occured');
        }
    });
};