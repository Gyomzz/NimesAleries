const execQuery = require('../../server.js');

const abandonedCart = async () => {
    return await execQuery(`SELECT ROUND((t_a.a * 100)/ t_b.b ,2) as pourcentage
        FROM(SELECT COUNT(*) as a
        FROM order_ref
        WHERE order_ref.validity_date is NULL) as t_a
        JOIN(SELECT COUNT(*) as b
        FROM order_ref) as t_b
    `)
}

const convertedCart = async () => {
    return await execQuery(`SELECT ROUND((t_a.a * 100)/ t_b.b ,2) as pourcentage
        FROM(SELECT COUNT(*) as a
        FROM order_ref
        WHERE order_ref.validity_date is NOT NULL) as t_a
        JOIN(SELECT COUNT(*) as b
        FROM order_ref) as t_b
    `)
}
const numberOfOrders = async () => {
    return await execQuery(`SELECT COUNT(*) as numberOfOrders
    FROM order_ref
    WHERE validity_date is NOT NULL
    `)
}
const numberOfCarts = async () => {
    return await execQuery(`SELECT COUNT(*) as numberOfCarts
    FROM order_ref
    `)
}

const percentOfNewClient = async () => {
    return await execQuery(`SELECT round((t_a.a/t_b.b)*100, 2) as percentageOfNewClient
        FROM(SELECT COUNT(DISTINCT(user.id)) as a 
        FROM user
        JOIN order_ref on order_ref.user_id = user.id) as t_a
        JOIN(SELECT COUNT(user.id) as b FROM user) as t_b;
    `)
}

exports.getNumberOfOrders = async (req, res) => {
    res.send(
        JSON.stringify(
            await(numberOfOrders())
        )
    )
}
exports.getNumberOfCarts = async (req, res) => {
    res.send(
        JSON.stringify(
            await(numberOfCarts())
        )
    )
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

exports.getPercentageOfNewClient = async (req, res) => {
    res.send(
        JSON.stringify(
            await(percentOfNewClient())
        )
    )
}