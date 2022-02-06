require('dotenv').config();

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
})}

global.appRoot = path.resolve(__dirname);

app.use(cors())           
app.use(morgan('tiny'))                    
app.use(express.json())                 
app.use(express.urlencoded({ extended: true }))

// List of Users
const users = [
    { id: 1, username: 'admin', password: '123' }
]

/* Connexion Form */
app.post('/login', (req, res) => {
    // If no data
    if (!req.body.username || !req.body.password) {
        return res.status(400).json({ message: 'Error. Please enter the correct username and password' })
    }

    // Checking
    const user = users.find(u => u.username === req.body.username && u.password === req.body.password)

    // Wrong Data
    if (!user) {
        return res.status(400).json({ message: 'Error. Wrong login or password' })
    }

    const token = jwt.sign({
        id: user.id,
        username: user.username
    }, process.env.SECRET, { expiresIn: '3 hours' })

    return res.json({ access_token: token })
})

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

app.use(function(req, res, next) {
  res.status(404).send('Sorry cant find that!');
});

app.use(function(err, req, res, next) {
  res.status(500).send('Something broke!');
});

app.listen(process.env.PORT || 6060, () => {
    console.log(`Server is running on port : ${PORT}`);
})
