const connection = require('../../server.js').connection;

connection.connect();

const execQuery = async (query) => {
    return new Promise((resolve, reject) => {
        connection.query(query,
        function (err, results, fields) {
            if (err) reject(err)
            else resolve(results)
        });
    })
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


exports.getBestProducts = async (req, res) => {
    res.send(
        JSON.stringify(
            await getProductsById(
                await getIdListOfBestProducts()
            )
        )
    );
}