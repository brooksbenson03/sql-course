const pool = require('../pool')
const toCamelCase = require('./utils/to-camel-case')

class UserRepo {
  static async find() {
    const { rows } = await pool.query('SELECT * FROM users;')
    return toCamelCase(rows)
  }

  static async findById(id) {
    const { rows } = await pool.query(` -- prepared statement example
      SELECT *
      FROM users
      WHERE id = $1
      LIMIT 1;
    `, [id]);
    const [user] = toCamelCase(rows)
    return user
  }

  static async insert(username, bio) {
    const { rows } = await pool.query(`
      INSERT INTO users (username, bio) VALUES ($1, $2) RETURNING *;
    `, [username, bio])
    const [user] = toCamelCase(rows)
    return user;
  }

  static async update(id, username, bio) {
    const { rows } = await pool.query(`
      UPDATE users 
      SET username = $2, bio = $3 
      WHERE id = $1
      RETURNING *
    `, [id, username, bio])
    const [user] = toCamelCase(rows)
    return user;
  }

  static async delete(id) {
    const { rows } = await pool.query(`
      DELETE FROM users
      WHERE id = $1
      RETURNING *;
    `, [id])
    const [user] = toCamelCase(rows)
    return user;
  }

  static async count() {
    const { rows } = await pool.query(`
      SELECT COUNT(*) FROM users;
    `)
    const { count } = rows[0]
    return +count
  }
}

module.exports = UserRepo