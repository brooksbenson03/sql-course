
(
  SELECT *
  FROM products
  ORDER BY price DESC
  LIMIT 4
)
UNION ALL - will display all records from both result sets
(
  SELECT *
  FROM products
  ORDER BY price / weight DESC
  LIMIT 4
);

-- find 4 products with highest price and
-- 4 products with highest price/weight ratio and
-- only return the result common in each

(
  SELECT *
  FROM products
  ORDER BY price DESC
  LIMIT 4
)
INTERSECT
(
  SELECT *
  FROM products
  ORDER BY price / weight DESC
  LIMIT 4
);

-- find 4 products with highest price and
-- 4 products with highest price/weight ratio and
-- only return the results from the first query
-- that are not found in the second

(
  SELECT *
  FROM products
  ORDER BY price DESC
  LIMIT 4
)
EXCEPT
(
  SELECT *
  FROM products
  ORDER BY price / weight DESC
  LIMIT 4
);

-- print the manufacturers of phones whose price is less than 170 and
-- print the manufacturers who have created more than two phones

SELECT manufacturer
FROM phones
WHERE price < 170
UNION
SELECT manufacturer
FROM phones
GROUP BY manufacturer
HAVING COUNT(*) > 2;
