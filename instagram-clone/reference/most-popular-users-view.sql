SELECT username, COUNT(*)
FROM users
JOIN (
  SELECT user_id FROM photo_tags
  UNION ALL
  SELECT user_id FROM caption_tags
) AS tags ON tags.user_id = users.id
GROUP BY username
ORDER BY COUNT(*) DESC;

/*
  The ackward thing in this scenario is that we've found ourselves
  having to merge the photo_tags and caption_tags often, meaning
  that it may have been a bad design decision to separate these
  two tables. There are two solutions to solving this:

  1. Creating a new tags table and inserting all the values from
  the other tables into it.

  2. Create a view. A view essentially is fake table with references
  other tables. Unlike CTEs, views are persistent, meaning they can
  be referred to by different queries in the future.
*/

-- 1: Creating new tabls

CREATE TABLE tags (
  id SERIAL PRIMARY KEY,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  post_id INTEGER NOT NULL REFERENCES posts(id) ON DELETE CASCADE,
  x INTEGER,
  y INTEGER
);

INSERT INTO tags(created_at, updated_at, user_id, post_id, x, y)
SELECT created_at, updated_at, user_id, post_id, x, y
FROM photo_tags;

INSERT INTO tags(created_at, updated_at, user_id, post_id)
SELECT created_at, updated_at, user_id, post_id
FROM caption_tags;

-- 2: Creating a view

CREATE VIEW tags AS (
  SELECT id, created_at, user_id, post_id, 'photo_tag' AS type FROM photo_tags
  UNION ALL
  SELECT id, created_at, user_id, post_id, 'caption_tag' AS type FROM caption_tag
);