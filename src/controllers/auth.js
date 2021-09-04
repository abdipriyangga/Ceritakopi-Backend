/* eslint-disable no-undef */
const authModel = require('../models/auth');
const {response} = require('../helpers/formResponse');
const bycrpt = require('bcrypt');
const jwt = require('jsonwebtoken');
const {APP_SECRET_KEY} = process.env;
const nodemailer = require('nodemailer');
const regex = require('../helpers/validation');

exports.signup = async (req, res) => {
    const data = req.body;
    const checkEmail = await authModel.getUserByEmail(data.email);
    if (checkEmail.length > 0) {
        return response(res, 401, "Email already exist!")
    } 
    const checkPhoneNumber = await authModel.getUserByPhoneNumber(data.phone_number);
    if (checkPhoneNumber.length > 0) {
        return response(res, 401, "Phone number already exist!")
    }
    if (regex.validateEmail(data.email)) {
        const saltRounds = await bycrpt.genSalt(10);
        data.password = await bycrpt.hash(data.password, saltRounds);
        await authModel.createUser(data);
        return response(res, 200, 'Create user has been successfully!', data);
    } else {
        return response(res, 401, 'Email is not valid!');
    }
};

exports.login = async (req, res) => {
    const {email, password} = req.body;
    const checkEmail = await authModel.getUserByEmail(email)
    if(checkEmail.length < 1) {
        return response(res, 404, "email not found!")
    } 
    const user = checkEmail[0];
    // console.log('data user: ', user);
    const compare = await bycrpt.compare(password, user.password);
    if (compare) {
        const token = jwt.sign({ id: user.id, email: user.email }, APP_SECRET_KEY, { expiresIn: '1h' });
        return response(res, 200, 'Login Success!', { token });
    } else {
        return response(res, 401, 'Wrong email or password!');
    }
};

// exports.forgotPassword  = async (req, res) => {
//     const{email} = req.body;
    
//     const checkEmail = await authModel.checkEmail(email);
//     try {
//         if (checkEmail.length < 1) {
//             return response(res, 404, 'Email not found!')
//         } else {
//             if (results[0]) {
//                 const user = results[0];
//                 const tokenForgot = jwt.sign({
//                     id: user.id,
//                     email: user.email
//                 }, APP_SECRET_KEY, {
//                     expiresIn: '24h'
//                 });
//                 //Nodemailer: 
//                 let transporter = nodemailer.createTransport({
//                     service: 'gmail',
//                     host: 'smtp.gmail.com',
//                     port: 578,
//                     secure: false,
//                     auth: {
//                         user: process.env.USER_EMAIL,
//                         pass: process.env.PASS_EMAIL
//                     }
//                 });

//                 let mailOptions = {
//                     from: '<noreply@gmail.com>',
//                     to: req.body.email,
//                     subject: 'Generate Link for Reset Password from BravoTeam',
//                     html: ` <h3> Link  to Reset Password </h3>
//                             <p> Hello, this is your link: ${process.env.APP_URL}/auth/reset-password/${tokenForgot} </p>`
//                 };
//                 transporter.sendMail(mailOptions, (err) => {
//                     if (err) {
//                         console.log('Its Error: ', err);
//                     } else {
//                         console.log('Sent Success!!!!');
//                     }
//                 });
//                 return response(res, 200, 'Your link has been sent in your mail!');
//             }
//             else {
//                 return response(res, 404, 'Your email is not found!');
//             }
//         }
//     } catch (error) {
//         return response(res, 500, 'error occured!', error)
//     }
// };