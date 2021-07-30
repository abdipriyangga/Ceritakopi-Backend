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