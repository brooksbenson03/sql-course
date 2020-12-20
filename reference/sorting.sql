-- sort by price ascending & weight descending

SELECT * FROM products
ORDER BY price, weight DESC;

-- skip first 40 records in users result set.

SELECT *
FROM users
OFFSET 40;

-- limit result set to ten users

SELECT *
FROM users
LIMIT 10;

-- order products by price retrieve 5 cheapest products

SELECT *
FROM products
ORDER BY price
LIMIT 5;

-- get the names of second and third most expensive phones

SELECT name
FROM phones
ORDER BY price DESC
OFFSET 1
LIMIT 2;

-- find 4 products with highest price and
-- 4 products with highest price/weight ratio
