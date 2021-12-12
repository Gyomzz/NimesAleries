const express = require('express');
const requestRoutes = express.Router();
const ProductController = require('../controllers/product');
const OrderController = require('../controllers/order');

module.exports = (app) => {

    requestRoutes.get('/sumOfSales', ProductController.getSumOfSales);

    requestRoutes.get('/avgCartPrice', ProductController.getAvgCartPrice);
    
    requestRoutes.get('/bestProducts', ProductController.getBestProducts);

    requestRoutes.get('/newClient', OrderController.getPercentageOfNewClient);

    requestRoutes.get('/numberOfCarts', OrderController.getNumberOfCarts);

    requestRoutes.get('/numberOfOrders', OrderController.getNumberOfOrders);
    
    requestRoutes.get('/abandonedCart', OrderController.getPercentageAbandonedCart);

    requestRoutes.get('/convertedCart', OrderController.getPercentageConvertedCart);

    app.use('/', requestRoutes);
    
}