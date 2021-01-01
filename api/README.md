# Notes

## Pools

The `pg` module is what the API uses to communicate with the database.

The `pg` module exposes a `pool`, and pool simply manages a list of clients for executing queries.

## Repos

A repo is a tool that essentially wraps up the logic associated with interacting with a particular table inside our database.

## SQL Injection Attacks

It's possible for API clients to inject SQL into their API requests. If an API creator is not aware of this, then it is possible for client users to completely mess up the database through SQL injection attacks. There are multiple ways to protect against this, but one way is through what are called *prepared statements.*