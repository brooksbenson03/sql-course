SELECT name || ', ' || country AS location FROM cities -- || is used to concatenate strings
SELECT CONCAT(name, ', ', country) AS location FROM cities -- CONCAT same as above
SELECT CONCAT(UPPER(name), ', ', UPPER(country)) AS location FROM cities -- UPPER transform strings to uppercase
SELECT UPPER(CONCAT(name, ', ', country)) AS location FROM cities -- same as above