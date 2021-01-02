const request = require('supertest')
const app = require('../../app')
const UserRepo = require('../../repos/user-repo')
const pool = require('../../pool')
const Context = require('../context')

let context
beforeAll(async () => {
  context = await Context.build()
})

beforeEach(async () => {
  await context.reset()
})

afterAll(() => {
  return context.close()
})

afterEach(() => {
  return pool.query(`
    DELETE FROM users
  `)
})

it('creates a user', async () => {
  expect(await UserRepo.count()).toBe(0)

  await request(app())
    .post('/users')
    .send({ username: 'test', bio: 'test'})
    .expect(200)
  
  expect(await UserRepo.count()).toBe(1)
})
