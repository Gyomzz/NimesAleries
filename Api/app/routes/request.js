const express = require('express');
const requestRoutes = express.Router();
const ProductController = require('../controllers/product');
const OrderController = require('../controllers/order');

module.exports = (app) => {

    requestRoutes.get('/bestProducts', ProductController.getBestProducts);

    requestRoutes.get('/abandonedCart', OrderController.getPercentageAbandonedCart);

    requestRoutes.get('/convertedCart', OrderController.getPercentageConvertedCart);

    app.use('/', requestRoutes);
    
}