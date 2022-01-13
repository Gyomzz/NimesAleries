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
     * @apiSuccessExample Success-Response:
     *     HTTP/1.1 200 OK
     *     {"sumOfSales": "285"}
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
     * @apiSuccessExample Success-Response:
     *     HTTP/1.1 200 OK
     *     {"avgCartPrice": "29.1"}
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
     * @apiSuccessExample Success-Response:
     *     HTTP/1.1 200 OK
     *      {"id":2,"soldCount":4,"product":
     *          {"id":2,"id_categorie_id":7,"mark":null,"name":"Bonies 200g Saumon",
     *          "description":"Récompense entre les repas.","price":3,"active":1,
     *          "image":"BoniesSaumon200g-619561f51b079.jpg",
     *          "created_at":"2021-06-16T00:00:00.000Z","stock":50}},
     *      {"id":6,"soldCount":4,"product":
     *          {"id":6,"id_categorie_id":8,"mark":null,"name":"Tapis basique",
     *          "description":"Tapis pour chien.","price":9,"active":1,
     *          "image":"AnioneTapisBasicS-6195636d7997d.jpg",
     *          "created_at":"2021-05-19T00:00:00.000Z","stock":51}},
     *      {"id":1,"soldCount":2,"product":
     *          {"id":1,"id_categorie_id":7,"mark":null,"name":"Royal Canin Croquettes",
     *          "description":"Royal Canin Maxi Adulte sont des croquettes pour les gros chiens.",
     *          "price":25,"active":1,"image":"royal-canin-6195558d3f8a1.jpg",
     *          "created_at":"2021-11-10T00:00:00.000Z","stock":55}}
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
     * @apiSuccessExample Success-Response:
     *  HTTP/1.1 200 OK
     *      {"percentageOfNewClient":100}
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
     * @apiSuccessExample Success-Response:
     *  HTTP/1.1 200 OK
     *      {"numberOfCarts":7}
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
     * @apiSuccessExample Success-Response:
     *  HTTP/1.1 200 OK
     *      {"numberOfOrders":6}
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
     * @apiSuccessExample Success-Response:
     *  HTTP/1.1 200 OK
     *      {"abandonedCart":14.29}
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
     * @apiSuccessExample Success-Response:
     *  HTTP/1.1 200 OK
     *      {"convertedCart":85.71}
     */
    requestRoutes.get('/convertedCart', OrderController.getPercentageConvertedCart);

    app.use('/', requestRoutes);
    
}