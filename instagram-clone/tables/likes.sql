CREATE TABLE likes (
  id SERIAL PRIMARY KEY,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  post_id INTEGER REFERENCES posts(id) ON DELETE CASCADE,
  comment_id INTEGER REFERENCES comments(id) ON DELETE CASCADE,
  CHECK(
    COALESCE((post_id)::BOOLEAN::INTEGER, 0) + 
    COALESCE((comment_id)::BOOLEAN::INTEGER, 0) = 1
  ), -- makes sure one or the other
  UNIQUE(user_id, post_id, comment_id) -- makes sure one user to one comment or post
);