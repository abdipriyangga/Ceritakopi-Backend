require('dotenv').config();
const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');

const app = express();
const port = 8090;
const mainRouter = require('./src/routes/index');

app.use(cors());
app.use(bodyParser.urlencoded({extended: false}));


app.listen(port, () => {
    console.log(`Server running on port : ${port}`);
});

app.use('/', mainRouter);
module.exports = app;