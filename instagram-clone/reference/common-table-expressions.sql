-- no cte

SELECT username, tags.created_at
FROM users
JOIN (
  SELECT user_id, created_at FROM caption_tags
  UNION ALL
  SELECT user_id, created_at FROM photo_tags
) AS tags ON tags.user_id = users.id
WHERE tags.created_at > '2010-01-07';

-- with cte
-- defined by the WITH keyword

WITH tags AS (
  SELECT user_id, created_at FROM caption_tags
  UNION ALL
  SELECT user_id, created_at FROM photo_tags
)

SELECT username, tags.created_at
FROM users
JOIN tags ON tags.user_id = users.id
WHERE tags.created_at > '2010-01-07';

-- two forms of cte:

-- 1) for readability (above is for readability)
-- 2) for recursion

WITH RECURSIVE countdown(val) AS ( -- 'countdown' is the name of cte
  SELECT 3 AS val -- initial, non-recursive
  UNION
  SELECT val - 1 FROM countdown WHERE var > 1 -- recursive
);

-- recursive is good from graphs or trees

-- following query is for follow suggestions

WITH RECURSIVE suggestions(leader_id, follower_id, depth) AS (
  SELECT leader_id, follower_id, 1 AS depth
  FROM followers
  WHERE follower_id = 1000
  UNION
  SELECT followers.leader_id, followers.follower_id, depth + 1
  FROM followers
  JOIN suggestions ON suggestions.leader_id = followers.follower_id
  WHERE depth < 3
);