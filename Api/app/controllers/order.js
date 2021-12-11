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

const abandonedCart = async () => {
    return await execQuery(`SELECT ROUND((t_a.a * 100)/ t_b.b ,2) as pourcentage
        FROM(SELECT COUNT(*) as a
        FROM orders
        WHERE orders.validity_date is NULL) as t_a
        JOIN(SELECT COUNT(*) as b
        FROM orders) as t_b
    `)
}

const convertedCart = async () => {
    return await execQuery(`SELECT ROUND((t_a.a * 100)/ t_b.b ,2) as pourcentage
        FROM(SELECT COUNT(*) as a
        FROM orders
        WHERE orders.validity_date is NOT NULL) as t_a
        JOIN(SELECT COUNT(*) as b
        FROM orders) as t_b
    `)
}

exports.getPercentageAbandonedCart = async (req, res) => {
    res.send(
        JSON.stringify(
            await(abandonedCart())
        )
    )
}

exports.getPercentageConvertedCart = async (req, res) => {
    res.send(
        JSON.stringify(
            await(convertedCart())
        )
    )
}
