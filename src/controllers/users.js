const userModel = require('../models/users');
const { response: formResponse } = require('../helpers/formResponse');
const { APP_URL, APP_UPLOAD_ROUTE } = process.env;

exports.getUserProfile = (req, res) => {
    userModel.getUserById(req.authUser.id, (err, results) => {
        if (!err) {
            results.forEach((img, index) => {
                if (results[index].images !== null && !results[index].images.startsWith('http')) {
                    results[index].images = `${APP_URL}${results[index].images}`;
                }
            });
            const data = {
                id: '',
                role: '',
                name: '',
                images: '',
                email: '',
                address: '',
                phone_number: '',
                gender: '',
                tanggal_lahir: '',
                ...results[0]
            }
            return formResponse(res, 200, 'Profile Detail', data);
        }
        else {
            return formResponse(res, 404, 'Profile not Found');
        }
    });
};

exports.updateProfile = (req, res) => {
    userModel.getUserById(req.authUser.id, (err, results, _fields) => {
        if (!err) {
            if (results.length > 0) {
                req.body.images = req.file ? `${APP_UPLOAD_ROUTE}/${req.file.filename}` : null;
                const { name, email, address, phone_number, images, gender, tanggal_lahir } = req.body;
                if (images) {
                    const data = { name, email, address, phone_number, images, gender, tanggal_lahir };
                    userModel.updateProfile(data, req.authUser.id, (err, resultsNew, _fields) => {
                        if (!err) {
                            if (results[0].images !== null) {
                                const path = results[0].images;
                                const newPath = path.split('/');
                                return formResponse(res, 200, `Profile updated successfully!`, data);
                            } else {
                                return formResponse(res, 200, `Profile updated successfully!`, data);
                            }
                        }
                        else {
                            console.error(err);
                            return formResponse(res, 500, 'An error occured');
                        }
                    });
                }
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