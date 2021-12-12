const connection = require('../../server.js').connection;

const execQuery = async (query) => {
    return new Promise((resolve, reject) => {
        connection.query(query,
        function (err, results, fields) {
            if (err) reject(err)
            else resolve(results)
        });
    })
}

const sumOfSales = async () => {
    return await execQuery(`SELECT SUM(product.price)
        FROM product
        JOIN product_orders on product_orders.product_id = product.id
        join orders on orders.id = product_orders.orders_id
        WHERE orders.validity_date is not null
    `)
}

const avgCartPrice = async () => {
    return await execQuery(`SELECT round(AVG(product.price), 2) as averageCartPrice
        FROM product_orders
        JOIN product ON product.id = product_orders.product_id
        JOIN orders ON orders.id = product_orders.orders_id
    `)
}

const getIdListOfBestProducts = async () => {
    return await execQuery(`SELECT DISTINCT COUNT(product_id) AS bestProduct, product_id 
    FROM product_orders 
    GROUP BY product_id 
    ORDER BY bestProduct  
    DESC LIMIT 10`)
}

const getProductById = async (id) => {
    let productAsArray = await execQuery(`SELECT * FROM product WHERE id LIKE ${id};`)
    return productAsArray[0];
}

const getProductsById = async (idsPacket) => {
    const products = [];
    for(const idPacket of idsPacket) {
        products.push({
            id: idPacket.product_id,
            soldCount: idPacket.bestProduct,
            product: await getProductById(idPacket.product_id)
        });
    }

    return products;
}

exports.getSumOfSales = async (req, res) => {
    res.send(
        JSON.stringify(
            await(sumOfSales())
        )
    )
}

exports.getAvgCartPrice = async (req, res) => {
    res.send(
        JSON.stringify(
            await(avgCartPrice())
        )
    )
}

exports.getBestProducts = async (req, res) => {
    res.send(
        JSON.stringify(
            await getProductsById(
                await getIdListOfBestProducts()
            )
        )
    );
}