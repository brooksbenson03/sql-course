/*
  When you connect to a database through some mechanism,
  you are creating what is called a "connection". These
  connections are stored and managed by the database.
*/

BEGIN; -- creates a "workspace" or "transaction" for a particular connection

-- operations that happen in this connection happen in their own environment

UPDATE accounts
SET balance = balance - 50
WHERE name = 'Alyson';

UPDATE accounts
SET balance = balance + 50
WHERE name = 'Gia';

COMMIT; -- merges changes into main datapool

-- ROLLBACK; -- aborts changes made during transaction