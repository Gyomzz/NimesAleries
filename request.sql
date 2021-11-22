Produit les plus vendues 

SELECT DISTINCT COUNT(product_id) AS bestProduct, product_id 
FROM `product_orders` 
GROUP BY product_id  
ORDER BY `bestProduct`  DESC LIMIT 10

$sql = "SELECT DISTINCT COUNT(product_id) AS bestProduct, product_id \n"

    . "FROM `product_orders` \n"

    . "GROUP BY product_id  \n"

    . "ORDER BY `bestProduct`  DESC LIMIT 10";

10 produit random 

SELECT * FROM `product`
ORDER BY RAND()
LIMIT 10

$sql = "SELECT * FROM `product`\n"

    . "ORDER BY RAND()\n"

    . "LIMIT 10";
