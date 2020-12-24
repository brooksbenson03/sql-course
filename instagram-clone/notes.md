# Notes

## Migrations

When making changes to the structure of a database, it's important to consider how it may affect the other parts of your application.

When working with other engineers, it's important to closely tie the structure of the database to the code itself. A *schema migration file* is a tool you can use to codify changes to a database structure, and can be written in almost any language. A migration file is structured in terms of *up* statements, which upgrade the database, and *down* statements, which rollback, or downgrade, the database.