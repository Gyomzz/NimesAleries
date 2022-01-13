const express = require('express');
const requestRoutes = express.Router();
const ProductController = require('../controllers/product');
const OrderController = require('../controllers/order');

module.exports = (app) => {

    requestRoutes.get('/api', function(req, res){
        res.sendFile(appRoot + '/app/views/doc.html');
    });

    requestRoutes.get('/api/sumOfSales', ProductController.getSumOfSales);

    requestRoutes.get('/api/avgCartPrice', ProductController.getAvgCartPrice);
    
    requestRoutes.get('/api/bestProducts', ProductController.getBestProducts);

    requestRoutes.get('/api/newClient', OrderController.getPercentageOfNewClient);

    requestRoutes.get('/api/numberOfCarts', OrderController.getNumberOfCarts);

    requestRoutes.get('/api/numberOfOrders', OrderController.getNumberOfOrders);
    
    requestRoutes.get('/api/abandonedCart', OrderController.getPercentageAbandonedCart);

    requestRoutes.get('/api/convertedCart', OrderController.getPercentageConvertedCart);

    app.use('/', requestRoutes);
    
}