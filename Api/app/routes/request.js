const express = require('express');
const requestRoutes = express.Router();
const ProductController = require('../controllers/product');
const OrderController = require('../controllers/order');

module.exports = (app) => {

    /**
     * @api {get} /sumOfSales Sum of Sales.
     * @apiName SumOfSales
     * @apiGroup Product
     * @apiDescription return the Sum of the sales.
     * @apiExample {curl} Curl example:
     *     curl -i https://api-nimesaleries.herokuapp.com/sumOfSales
     * @apiVersion 1.0.0
     * @apiSampleRequest /sumOfSales
     */
    requestRoutes.get('/sumOfSales', ProductController.getSumOfSales);

    /**
     * @api {get} /avgCartPrice Average price of cart.
     * @apiName Average cart price
     * @apiGroup Product
     * @apiDescription return the average price of a cart.
     * @apiExample {curl} Curl example:
     *     curl -i https://api-nimesaleries.herokuapp.com/avgCartPrice
     * @apiVersion 1.0.0
     * @apiSampleRequest /avgCartPrice
     */
    requestRoutes.get('/avgCartPrice', ProductController.getAvgCartPrice);

    /**
     * @api {get} /bestProducts Best products.
     * @apiName Best Poducts
     * @apiGroup Product
     * @apiDescription return the best products with count orderby count desc.
     * @apiExample {curl} Curl example:
     *     curl -i https://api-nimesaleries.herokuapp.com/bestProducts
     * @apiVersion 1.0.0
     * @apiSampleRequest /bestProducts
     */
    requestRoutes.get('/bestProducts', ProductController.getBestProducts);
{}
    /**
     * @api {get} /newClient New client.
     * @apiName New client
     * @apiGroup Order
     * @apiDescription return the pourcentage of new client.
     * @apiExample {curl} Curl example:
     *     curl -i https://api-nimesaleries.herokuapp.com/newClient
     * @apiVersion 1.0.0
     * @apiSampleRequest /newClient
     */
    requestRoutes.get('/newClient', OrderController.getPercentageOfNewClient);

    /**
     * @api {get} /numberOfCarts Number of carts.
     * @apiName Number of Carts
     * @apiGroup Order
     * @apiDescription return the number of carts.
     * @apiExample {curl} Curl example:
     *     curl -i https://api-nimesaleries.herokuapp.com/numberOfCarts
     * @apiVersion 1.0.0
     * @apiSampleRequest /numberOfCarts
     */
    requestRoutes.get('/numberOfCarts', OrderController.getNumberOfCarts);

    /**
     * @api {get} /numberOfOrders Numbers of orders.
     * @apiName Number of orders
     * @apiGroup Order
     * @apiDescription return the numbers of orders.
     * @apiExample {curl} Curl example:
     *     curl -i https://api-nimesaleries.herokuapp.com/numberOfOrders
     * @apiVersion 1.0.0
     * @apiSampleRequest /numberOfOrders
     */
    requestRoutes.get('/numberOfOrders', OrderController.getNumberOfOrders);
    
    /**
     * @api {get} /abandonedCart Abandoned Cart.
     * @apiName Cart abandoned
     * @apiGroup Order
     * @apiDescription return the pourcentage of cart abandoned.
     * @apiExample {curl} Curl example:
     *     curl -i https://api-nimesaleries.herokuapp.com/abandonedCart
     * @apiVersion 1.0.0
     * @apiSampleRequest /abandonedCart
     */
    requestRoutes.get('/abandonedCart', OrderController.getPercentageAbandonedCart);

    /**
     * @api {get} /convertedCart Converted Cart.
     * @apiName Cart converted
     * @apiGroup Order
     * @apiDescription return the pourcentage of cart converted.
     * @apiExample {curl} Curl example:
     *     curl -i https://api-nimesaleries.herokuapp.com/convertedCart
     * @apiVersion 1.0.0
     * @apiSampleRequest /convertedCart
     */
    requestRoutes.get('/convertedCart', OrderController.getPercentageConvertedCart);

    app.use('/', requestRoutes);
    
}