const mysql = require('mysql');

const connection = mysql.createConnection({
    host: 'localhost',
    user: 'zero',
    password: 'blacKnight',
    database: 'b22_coffee_shop'
});

connection.connect((err) => {
    if(err) throw err;
    console.log('Database has been connected');
});

module.exports = connection;
