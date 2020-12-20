-- cost: refers to time it takes to execute part of query plan
-- sequential cost: baseline cost in postgres
-- random_page_cost: 4 times more than sequential

SELECT username, contents
FROM users
JOIN comments ON comments.user_id = users.user_id
WHERE username = 'Alyson14';

-- with explain
-- returns query plan

EXPLAIN SELECT username, contents
FROM users
JOIN comments ON comments.user_id = users.user_id
WHERE username = 'Alyson14'; 

-- with explain analyze
-- returns query plan, executes the query, and returns statistics about it

EXPLAIN SELECT username, contents
FROM users
JOIN comments ON comments.user_id = users.user_id
WHERE username = 'Alyson14';

