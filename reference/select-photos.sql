SELECT * FROM photos
WHERE user_id = 4;

SELECT * FROM photos
JOIN users ON users.id = photos.user_id; -- joins two tables together