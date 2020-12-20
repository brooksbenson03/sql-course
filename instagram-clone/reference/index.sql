EXPLAIN SELECT *
FROM likes
WHERE created_at < '2013-01-01';

CREATE INDEX likes_created_at_idx ON likes(created_at);

-- indexes are only good at getting specific data
-- postgres creates indexes automatically

CREATE INDEX ON users (username);

DROP INDEX users_username_idx; -- removes index

-- postgres stores a reference to all the indexes
-- it is possible to create and drop indexes in postgres