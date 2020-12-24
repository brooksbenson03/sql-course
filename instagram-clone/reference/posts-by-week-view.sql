-- first iteration: standard query

SELECT
  date_trunc('week', COALESCE(posts.created_at, comments.created_at)) AS week, -- rounds down the date to the nearest week
  COUNT(posts.id) AS num_posts,
  COUNT(comments.id) AS num_comments
FROM likes
LEFT JOIN posts ON posts.id = likes.post_id
LEFT JOIN comments ON comments.id = likes.comment_id
GROUP BY week
ORDER BY week;

-- second iteration: materialized view -- with data

CREATE MATERIALIZED VIEW weekly_likes AS (
  SELECT
    date_trunc('week', COALESCE(posts.created_at, comments.created_at)) AS week, -- rounds down the date to the nearest week
    COUNT(posts.id) AS num_posts,
    COUNT(comments.id) AS num_comments
  FROM likes
  LEFT JOIN posts ON posts.id = likes.post_id
  LEFT JOIN comments ON comments.id = likes.comment_id
  GROUP BY week
  ORDER BY week
) WITH DATA; -- tells postgres that when the view is created, to run the query and populate it with data

-- how to refresh a view

REFRESH MATERIALIZED VIEW weekly_likes;