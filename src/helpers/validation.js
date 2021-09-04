const {response:standardResponse} = require('./formResponse');

exports.validateInteger = (res, data, fields, cb) => {
    if(data) {
        data = parseInt(data);
        if (data < 1) {
            return standardResponse(res, 400, `${fields} at least must be 1`);
        }
        else {
            cb();
        }
    }
};

exports.validateEmail = (email) => {
    const regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return regex.test(email);
}