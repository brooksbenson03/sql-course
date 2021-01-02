const { randomBytes } = require('crypto')
const { default: migrate } = require('node-pg-migrate')
const { Pool } = require('pg')
const format = require('pg-format')
const pool = require('../pool')

const DEFAULT_OPTS = {
  host: 'localhost',
  port: 5432,
  database: 'social-network-test',
  user: 'postgres',
  password: 'funwithpostgresql'
}

class Context {
  static async build() {
    const roleName = 'a' + randomBytes(4).toString('hex')

    await pool.connect(DEFAULT_OPTS)
  
    await pool.query(`
      CREATE ROLE ${roleName}
      WITH LOGIN PASSWORD '${roleName}'
    `)
  
    await pool.query(`
      CREATE SCHEMA ${roleName}
      AUTHORIZATION ${roleName}
    `)
  
    await pool.close()
  
    await migrate({
      schema: roleName,
      direction: 'up',
      log: () => {},
      noLock: true, // allow multiple migrations to run in parallel
      dir: 'migrations',
      databaseUrl: {
        host: 'localhost',
        port: 5432,
        database: 'social-network-test',
        user: roleName,
        password: roleName
      }
    });
  
    await pool.connect({
      host: 'localhost',
      port: 5432,
      database: 'social-network-test',
      user: roleName,
      password: roleName
    })

    return new Context(roleName)
  }
  
  constructor(roleName) {
    this.roleName = roleName
  }

  async close() {
    await pool.close()

    await pool.connect(DEFAULT_OPTS);

    await pool.query(
      format('DROP SCHEMA %I CASCADE;', this.roleName)
    )

    await pool.query(
      format('DROP ROLE %I;', this.roleName)
    )
  
    await pool.close();
  }

  async reset() {
    return pool.query(`
      DELETE FROM users;
    `)
  }
}

module.exports = Context