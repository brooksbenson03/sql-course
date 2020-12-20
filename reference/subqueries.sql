-- list the name and price of all products
-- that are more expensive than all products
-- in the 'Toys' department

SELECT name, price
FROM products
WHERE price > (
  SELECT MAX(price) FROM products WHERE department = 'Toys'
);

-- produce a scalar

SELECT MAX(price) FROM products;

-- insert scalar into select

SELECT 
  name, 
  price,
 (SELECT MAX(price) FROM products)
FROM products
WHERE price > 867;

-- write query that prints name, price,
-- and the ratio of price to greatest price
-- of phones

SELECT name, price, price / (
  SELECT MAX(price) FROM phones
) as price_ratio
FROM phones;

-- use subquery in from

SELECT name, price_weight_ratio
FROM (SELECT name, price / weight AS price_weight_ratio FROM products) AS p
ORDER BY price_weight_ratio;

-- average number of orders
-- for all users

SELECT AVG(orders_per_user)
FROM (
  SELECT COUNT(*) AS orders_per_user
  FROM orders
  GROUP BY user_id
)

-- average phone price
-- per manufacturer
-- then highest average

SELECT MAX(avg_price) AS max_average_price
FROM (
  SELECT AVG(price) AS avg_price
  FROM phones
  GROUP BY manufacturer
) AS p;

-- subquery in join

SELECT first_name
FROM users
JOIN (
  SELECT user_id FROM orders WHERE product_id = 3
) AS o
ON o.user_id = users.id;

-- orders for products whose
-- price weight ratio is greater
-- than 50

SELECT id
FROM orders
WHERE product_id IN (
  SELECT id
  FROM products
  WHERE price / weight > 50
);

-- list products whose price
-- is greater than the average

SELECT name
FROM products
WHERE price > (
  SELECT AVG(price)
  FROM products
);

-- list phones with a price
-- greater than the 'Samsung
-- S5620 Monte'

SELECT name, price
FROM phones
WHERE price > (
  SELECT price
  FROM phones
  WHERE name = 'S5620 Monte'
);

-- list products that are not
-- in the same department as
-- products with a price less
-- than 100

SELECT name
FROM products
WHERE department NOT IN (
  SELECT department
  FROM products
  WHERE price < 100
);

-- list products that are
-- more expensive than all
-- products in the 'industrial'
-- department

SELECT name, department, price
FROM products
WHERE price > ALL (
  SELECT price
  FROM products
  WHERE department = 'Industrial'
)

-- list products that are
-- more expensive than all
-- products in the 'industrial'
-- department

SELECT name, department, price
FROM products
WHERE price > SOME (
  SELECT price
  FROM products
  WHERE department = 'Industrial'
)

-- show the most expensive
-- products in each department

SELECT name, department, price
FROM products AS p1
WHERE (
    SELECT MAX(price)
    FROM products AS p2
    WHERE p1.department = p2.department
)
ORDER BY department;

-- without using a join or group,
-- print the number of orders for
-- each product

SELECT id, name, (
  SELECT COUNT(*)
  FROM orders AS o
  WHERE o.product_id = p.id
)
FROM products AS p;

-- get the highest price of a
-- product

SELECT (
  SELECT MAX(price) FROM products
);

-- get the highest price of a
-- product divided buy the average
-- price of a product

SELECT (
  SELECT MAX(price) FROM products
) / (
  SELECT AVG(price) FROM products
);

-- print the max, min, and avg
-- price of all phones using
-- subqueries

SELECT (
  SELECT MAX(price)  FROM phones
) AS max_price, (
  SELECT MIN(price)  FROM phones
) AS min_price, (
  SELECT AVG(price)  FROM phones
) AS avg_price;