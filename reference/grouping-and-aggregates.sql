-- number of comments per user

SELECT user_id, COUNT(*) -- avoids possible null values
FROM comments
GROUP BY user_id;

-- number of books per author

SELECT name, COUNT(*)
FROM books
JOIN authors ON authors.id = books.author_id
GROUP BY name;

-- number of comment per photo
-- photos should have photo_id less than 3
-- groups should have more than 2 comments

SELECT photo_id, COUNT(*) as number_of_comments
FROM comments
WHERE photo_id < 3 -- filters individual rows
GROUP BY photo_id
HAVING COUNT(*) > 2; -- filters out groups

-- find users that have
-- commented on the first fifty photos and
-- added more than 20 comments on those photos

SELECT user_id, COUNT(*)
FROM comments
WHERE comments.photo_id BETWEEN 1 AND 50
GROUP BY user_id
HAVING COUNT(*) > 20

-- find phone manufacturers
-- who have a revenue greater than two million

SELECT manufacturer, SUM(price * units_sold)
FROM phones
GROUP BY manufacturer
HAVING SUM(price * units_sold) > 2000000;