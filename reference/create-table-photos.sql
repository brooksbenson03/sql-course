CREATE TABLE photos (
  id SERIAL PRIMARY KEY, 
  url VARCHAR(200),
  user_id INTEGER REFERENCES users(id) -- rererences the id value in the users table
)