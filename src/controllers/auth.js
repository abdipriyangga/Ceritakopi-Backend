/* eslint-disable no-undef */
const authModel = require('../models/auth');
const {response:formResponse} = require('../helpers/formResponse');
const bycrpt = require('bcrypt');
const jwt = require('jsonwebtoken');
const {APP_SECRET_KEY} = process.env;
const nodemailer = require('nodemailer');

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

exports.forgotPassword  = (req, res) => {
    const{email} = req.body;

    authModel.checkEmailForgot(email, async(err, results) => {
        if (!err) {
            if(results[0]) {
                const user = results[0];
                const tokenForgot = jwt.sign({
                    id: user.id,
                    email: user.email
                }, APP_SECRET_KEY, {
                    expiresIn: '1h'
                });
                //Nodemailer: 
                let transporter = nodemailer.createTransport({
                    service: 'gmail',
                    host: 'smtp.gmail.com',
                    port: 578,
                    secure: false,
                    auth: {
                        user: process.env.USER_EMAIL,
                        pass: process.env.PASS_EMAIL
                    }
                });

                let mailOptions = {
                    from: '<noreply@gmail.com>',
                    to: req.body.email,
                    subject: 'Generate Link for Reset Password from BravoTeam',
                    html: ` <h3> Link  to Reset Password </h3>
                            <p> Hello, this is your link: ${process.env.APP_URL}/auth/reset-password/${tokenForgot} </p>`
                };
                transporter.sendMail(mailOptions, (err) => {
                    if (err) {
                        console.log('Its Error: ', err);
                    } else {
                        console.log('Sent Success!!!!');
                    }
                });
                return formResponse(res, 200, 'Your link has been sent in your mail!');
            }
            else {
                return formResponse(res, 404, 'Your email is not found!');
            }
        } else {
            return formResponse(res, 401, 'Bad Request!');
        }
    });
};