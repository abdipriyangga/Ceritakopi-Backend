require('dotenv').config();
const express = require('express');
const bodyParser = require('body-parser');

const app = express();
const port = 8081;
const mainRouter = require('./src/routes/index');

app.use(bodyParser.urlencoded({extended: false}));

app.listen(port, () => {
    console.log(`Server running on port : ${port}`);
});

app.use('/', mainRouter);
module.exports = app;