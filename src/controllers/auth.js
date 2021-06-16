/* eslint-disable no-undef */
const authModel = require('../models/auth');
const {response:formResponse} = require('../helpers/formResponse');
const bycrpt = require('bcrypt');
const jwt = require('jsonwebtoken');
const {APP_SECRET_KEY} = process.env;

exports.signup = async (req, res) => {
    const data = req.body;
    const saltRounds = await bycrpt.genSalt(10);
    data.password = await bycrpt.hash(data.password, saltRounds);
    authModel.createUser(data, (err) => {
        if(!err) {
            return formResponse(res, 200, 'Create user has been successfully!');
        } else {
            return formResponse(res, 401,  'Bad Request!');
        }
    });
};

exports.login = (req, res) => {
    const {email, password} = req.body;
    authModel.getUserByEmail(email, async (err, results) => {
        if(err) throw err;
        if(results.length < 1) return formResponse(res, 404, 'Email not found!');
        const user = results[0];
        console.log(user.id);
        const compare =  await  bycrpt.compare(password, user.password);
        if (compare) {
            const token = jwt.sign({id: user.id, email: user.email}, APP_SECRET_KEY, {expiresIn: '1h'});
            return formResponse(res, 200, 'Login Success!', {token});
        } else {
            return formResponse(res, 401, 'Wrong email or password!');
        }
    });
};