const jwt = require('jsonwebtoken');
const {APP_SECRET_KEY} = process.env;
const {response:formResponse} = require('../formResponse');

const auth = (req, res, next) => {
    console.log(req.headers);
    if (req.headers.authorization) {
        if (req.headers.authorization.startsWith('Bearer')){
            try {
                const token = req.headers.authorization.slice(7);
                const user = jwt.verify(token, APP_SECRET_KEY);
                req.authUser = user;
                if(req.authUser.role === 'customer') {
                    next();
                } else {
                    return formResponse(res, 400, 'Sorry you are not admin!');
                }
            } catch (err) {
                return formResponse(res, 401, 'Session expired, please login!');
            }
        }
    } else {
        return formResponse(res, 401, 'Auth Token needed!');
    }
};

module.exports = auth;