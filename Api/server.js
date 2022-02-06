require('dotenv').config();

const bcrypt = require('bcryptjs');
const morgan = require('morgan')
const jwt = require('jsonwebtoken')
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
    })
}

global.appRoot = path.resolve(__dirname);

app.use(cors())           
app.use(morgan('tiny'))                    
app.use(express.json())                 
app.use(express.urlencoded({ extended: true }))

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

app.post('/login', (req, res) => {
    if (!req.body.username || !req.body.password) {
        return res.status(400).json({ message: 'Error. Please enter the username and password' })
    }
    config.connection.connect(function(err) {
        config.connection.query(`SELECT * FROM user where name = ${config.connection.escape(req.body.username)}`, function (err, result, fields) {
            if (err) throw err;
            if(!result.length) {
                return res.status(401).send({
                    msg: 'Username or password is incorrect!'
                });
            }
            // check password
            bcrypt.compare(
                req.body.password,
                result[0]['password'],
                (bErr, bResult) => {
                    if(bErr) return res.status(401).send({
                        msg: 'Username or password is incorrect!'
                    });
                    
                    if(bResult) {
                        const token = jwt.sign({id:result[0].id}, process.env.SECRET, { expiresIn: '3 hours' });
                        return res.status(200).send({
                            msg: 'Logged in!',
                            token,
                            user: result[0]['name']
                        });
                    }
                    return res.status(401).send({
                        msg: 'Username or password is incorrect!'
                    });
                }
            )
        });
    });
})

require('./app/routes/request')(app);

app.use('/', express.static('apidoc'));

app.all('/', function(req,res){
  res.redirect('/request');
});

app.use(function(req, res, next) {
  res.status(404).send('Sorry cant find that!');
});

app.use(function(err, req, res, next) {
  res.status(500).send('Something broke!');
});

app.listen(process.env.PORT || 6060, () => {
    console.log(`Server is running on port : ${PORT}`);
})
