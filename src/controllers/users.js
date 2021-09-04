const userModel = require('../models/users');
const {response: formResponse} = require('../helpers/formResponse');
const {APP_URL} = process.env;

exports.getUserProfile = (req, res) => {
    userModel.getUserById(req.authUser.id, (err, results) => {
        if(!err) {
            results.forEach((img, index) => {
                if (results[index].images !== null && !results[index].images.startsWith('http')) {
                    results[index].images = `${APP_URL}${results[index].images}`;
                }
            });
            return formResponse(res, 200, 'Profile Detail', results);
        }
        else {
            return formResponse(res, 404, 'Profile not Found');
        }
    });
};

exports.updateProfile = (req, res) => {
    const {id} = req.params;
    userModel.getUserById(id, (err, results, _fields) => {
        if(!err) {
            if(results.length > 0) {
                const data = req.body;
                userModel.updateProfile(data,id, (err,results, _fields) => {
                    if(!err) {
                        return formResponse(res, 200, `Profile with id ${id} updated successfully!`);
                    }
                    else {
                        console.error(err);
                        return formResponse(res, 500,  'An error occured');
                    }
                });
            }
            else {
                return formResponse(res, 404,  'User not found!');
            }
        }
        else {
            return formResponse(res, 400, `Error: ${err.sqlMassege}`);
        }
    });
};