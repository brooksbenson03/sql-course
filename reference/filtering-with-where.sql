SELECT name, area FROM cities WHERE area > 4000; -- WHERE filters rows whose area is less than 4000

SELECT 
  name, 
  area 
FROM 
  cities 
WHERE 
  area = 4000; -- gets rows with 4000 area

SELECT 
  name, 
  area 
FROM 
  cities 
WHERE 
  area != 4000; -- gets rows without 4000 area

SELECT 
  name, 
  area 
FROM 
  cities 
WHERE 
  area <> 4000; -- gets rows without 4000 area

-- compound WHERE clause

SELECT 
  name, 
  area 
FROM 
  cities 
WHERE 
  area BETWEEN 2000 AND 4000; -- gets rows between 2000 - 4000

SELECT 
  name, 
  area 
FROM 
  cities 
WHERE 
  name IN ('Delhi', 'Shanghai'); -- gets rows whose names are in the given list

SELECT 
  name, 
  area 
FROM 
  cities 
WHERE 
  name NOT IN ('Delhi', 'Shanghai'); -- gets rows whose names are not in the given list

SELECT 
  name, 
  area 
FROM 
  cities 
WHERE 
  name IN ('Delhi', 'Shanghai') AND name = 'Delhi'; -- compound checks on name

SELECT 
  name, 
  area 
FROM 
  cities 
WHERE 
  name = 'Delhi' OR name = 'Shanghai'; -- double check on name

-- Calculations in WHERE

SELECT
  name,
  population / area AS population_density
FROM
  cities
WHERE
  population / area > 6000