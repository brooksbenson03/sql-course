-- post captions by user 200

SELECT
  users.id,
  users.username,
  posts.caption
FROM users
JOIN posts ON posts.user_id = users.id
WHERE users.id = 200;