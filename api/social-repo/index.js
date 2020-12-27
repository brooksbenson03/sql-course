const app = require('./src/app')
const pool = require('./src/pool')

pool.connect({
  host: 'localhost',
  port: 5432,
  database: 'social-network',
  user: 'postgres',
  pass: 'funwithpostgresql',
}).then(() => {
  app().listen(3005, () => {
    console.log('Listening on port 3005')
  })
}).catch(e => {
  console.error(e)
})

