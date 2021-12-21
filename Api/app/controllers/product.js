const execQuery = require('../../server.js');



const sumOfSales = async () => {
    return await execQuery(`SELECT sum(product.price * order_item.quantity) as sumOfSales
        FROM product
        JOIN order_item ON order_item.product_id = product.id
        JOIN order_ref ON order_ref.id = order_item.order_ref_id
        WHERE order_ref.validity_date is NOT NULL;
    `)
}

const avgCartPrice = async () => {
    return await execQuery(`SELECT AVG(product.price * order_item.quantity) as averageCartPrice
        FROM product
        JOIN order_item ON order_item.product_id = product.id;
    `)
}

const getIdListOfBestProducts = async () => {
    return await execQuery(`SELECT DISTINCT COUNT(product_id) AS bestProduct, product_id 
    FROM order_item 
    GROUP BY product_id 
    ORDER BY bestProduct  
    DESC LIMIT 10;`)
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