-- create view

CREATE VIEW recent_posts AS (
  SELECT *
  FROM posts
  ORDER BY created_at DESC
  LIMIT 10
);

-- adjust view for 15 instead of 10

CREATE OR REPLACE VIEW recent_posts AS (
  SELECT * FROM posts
  ORDER BY created_at DESC
  LIMIT 15
); -- replace the old view

-- drop the view

DROP VIEW recent_posts;