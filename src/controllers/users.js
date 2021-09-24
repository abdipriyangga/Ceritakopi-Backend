const userModel = require('../models/users');
const { response: formResponse } = require('../helpers/formResponse');
const { APP_URL } = process.env;

exports.getUserProfile = (req, res) => {
    userModel.getUserById(req.authUser.id, (err, results) => {
        if (!err) {
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
    console.log("ini id user yang login: ", req.authUser.id);
    userModel.getUserById(req.authUser.id, (err, results, _fields) => {
        if (!err) {
            if (results.length > 0) {
                const { name, email, address, phone_number } = req.body;
                const data = { name, email, address, phone_number };
                userModel.updateProfile(data, req.authUser.id, (err, resultsNew, _fields) => {
                    if (!err) {
                        return formResponse(res, 200, `Profile updated successfully!`, data);
                    }
                    else {
                        console.error(err);
                        return formResponse(res, 500, 'An error occured');
                    }
                });
            }
            else {
                return formResponse(res, 404, 'User not found!');
            }
        }
        else {
            return formResponse(res, 400, `Error: ${err.sqlMassege}`);
        }
    });
};