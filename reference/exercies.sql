-- You don't need to change these lines

CREATE TABLE movies (
    title VARCHAR(60),
    box_office INTEGER
);

INSERT INTO movies (title, box_office)
VALUES 
    ('The Avengers', 1500000000),
    ('Batman v Superman', 873000000);
    

-- Write a SELECT statement to tetrieve both rows inserted into the movies table.
-- select both the title and box_office column

-- WRITE YOUR SOLUTION BELOW THIS LINE!

SELECT title, box_office FROM movies;


-- Write a query that gets the phones sold over 5000 units

SELECT 
  name, 
  price 
FROM 
  phones 
WHERE 
  units_sold > 5000

-- Write a query that gets phones manufactured by Apple or Samsung

SELECT 
  name, 
  manufacturer 
FROM 
  phones 
WHERE 
  manufacturer IN ('Apple', 'Samsung')

-- Write a query that prints the name and total revenues of all phones whose total revenue is greater that a million

SELECT
  name,
  price * units_sold AS total_revenue
FROM
  phones
WHERE
  price * units_sold > 1000000

-- Write two queries:
--   1. update units_sold of phones with name 'N8' to 8543
--   2. select all rows and columns from phones table

UPDATE phones
SET units_sold = 8543
WHERE name = 'N8';

SELECT * FROM phones;

-- Write two queries:
--   1. delete all phones created by Samsung
--   2. select all info about phones

DELETE FROM phones
WHERE manufacturer = 'Samsung';

SELECT * FROM phones;
