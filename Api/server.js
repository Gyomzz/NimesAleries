require('dotenv').config();

const PORT = process.env.SERVER_PORT;
const express = require('express');
const cors = require('cors');
const app = express();
const mysql = require('mysql');
const config = {
    connection : mysql.createConnection({
    host: process.env.host,
    user: process.env.user,
    password: process.env.password,
    database: process.env.database
})}

app.use(cors());

config.connection.connect();


module.exports = config;

require('./app/routes/request')(app);

app.use((req, res, next) => {
    res.redirect('/request');
})

app.listen(PORT, () => {
    console.log(`Server is running on port : ${PORT}`);
})