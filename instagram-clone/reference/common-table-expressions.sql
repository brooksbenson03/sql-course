-- simple cte
-- makes things more readable with no performace impact

WITH tags AS (
    SELECT user_id, created_at FROM caption_tags
    UNION ALL
	SELECT user_id, created_at FROM photo_tags
)
 
SELECT users.username, tags.created_at
FROM users
JOIN tage ON tags.user_id = users.id
WHERE tags.created_at < '2010-01-07';

-- recursive cte
-- nice when working with a tree or graph as data structure
-- every recursive cte will include a union

WITH RECURSIVE countdown(val) AS (
  SELECT 3 as val
  UNION
  SELECT val - 1
  FROM countdown
  WHERE val > 1
)

SELECT * FROM countdown