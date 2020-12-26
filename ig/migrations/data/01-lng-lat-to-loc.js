const pg = require('pg')

const pool = new pg.Pool({
  host: 'localhost',
  port: 5432,
  database: 'social-network',
  user: 'postgres',
  password: 'funwithpostgresql'
})

pool.query(`
  UPDATE posts
  SET loc = POINT(lng, lat)
  WHERE loc IS NULL;
`).then(res => {
  console.log('Migration successful')
  pool.end()
}).catch(e => {
  console.log(err.message)
})