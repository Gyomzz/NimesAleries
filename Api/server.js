require('dotenv').config();


const path = require('path');
const PORT = process.env.SERVER_PORT;
const express = require('express');
const cors = require('cors');
const app = express();
const mysql = require('mysql');
const config = {
    connection : mysql.createConnection({
    host: process.env.HOST,
    user: process.env.USER,
    password: process.env.PASSWORD,
    database: process.env.DATABASE
})}

global.appRoot = path.resolve(__dirname);

app.use(cors());

config.connection.connect();


const execQuery = async (query) => {
    return new Promise((resolve, reject) => {
        config.connection.query(query,
        function (err, results, fields) {
            if (err) reject(err)
            else resolve(results)
        });
    })
}

module.exports = execQuery;

require('./app/routes/request')(app);

app.use('/', express.static('apidoc'));

app.all('/', function(req,res){
  res.redirect('/request');
});


app.listen(process.env.PORT || 6060, () => {
    console.log(`Server is running on port : ${PORT}`);
})


app.use(function(err, req, res, next) {
  console.error(err.stack);
  res.status(500).send('Something broke!');
});