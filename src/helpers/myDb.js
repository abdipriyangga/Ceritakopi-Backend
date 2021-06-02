const mysql = require('mysql');

const connection = mysql.createConnection({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASS,
    database: process.env.DB
});

connection.connect((err) => {
    if(err) throw err;
    console.log('Database has been connected');
});


module.exports = connection;
