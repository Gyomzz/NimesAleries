const express = require('express');
const productRoutes = express.Router();
const ProductController = require('../controllers/product');

module.exports = (app) => {

    productRoutes.get('/bestProducts', ProductController.getBestProducts);

    app.use('/', productRoutes);
    
}