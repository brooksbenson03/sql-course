-- returns statistics about tables

SELECT *
FROM pg_stats
WHERE tablename = 'users';