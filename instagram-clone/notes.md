# Notes

## Schema Migrations

When making changes to the structure of a database, it's important to consider how it may affect the other parts of the application.

When working with other engineers, it's important to closely tie the structure of the database to the code itself. A *schema migration file* is a tool you can use to codify changes to a database structure, and can be written in almost any language. A migration file is structured in terms of *up* statements, which upgrade the database, and *down* statements, which rollback, or downgrade, the database.

## Data Migrations

Data Migrations are when you move values from one part of a database to another.

Data Migrations can be complicated, a set of step that can be used to accomplish one are as follows:

1. Write and execute a migration file that describes structural changes to the database
2. Modify and publish new server code that works with new structure
3. Run a transaction that executes the data migration
4. Make any additional changes to server code or database strucutre that fully completes migration

An interesting note about transactions: values that are modified during a transaction are *locked*. This means if a client tries to update the value from a connection that is not a transaction, that request will wait until the transaction modifying the row has been completed.