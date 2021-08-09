require('dotenv').config();
const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');

const app = express();
const mainRouter = require('./src/routes/index');

app.use(cors());
app.use(bodyParser.urlencoded({extended: false}));


app.listen(process.env.PORT, () => {
    console.log(`Server running on port : ${process.env.PORT}`);
});

app.use('/', mainRouter);
module.exports = app;