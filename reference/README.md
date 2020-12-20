# SQL

## Keywords

Tell the database what to do, always written in uppercase.

## Identifiers

Identify the things we want to operate on in the database, always written in lowercase.

## Operators

Tell the database to operate on some data.

There are math, string, and comparison operators.

## Database Design Process

1. What thing are we storing? [table]
2. What properties does this thing have? [columns][types]

- When the solution being created is common a google search is a good way to find a schema
- When the solution being created is not so straight forward identify the different resources in the app
- Relationships between resources need to be reflected in table design

## Relationships

- One-to-Many: where one record in a table is tied to many other records in another table
- Many-to-One: where multiple records in a table are tied to one record in another table
- One-to-One: where one record in one table is tied to one record in another table
- Many-to-Many: where multiple records in one table are tied to multiple records in another table
- Primary Key: uniquely identifies a record in a table
- Foreign Key: associates a record to another record

## Data consistency

Refers to the relationships in a database being handled in a consistent manner.

Using a value for a foreign key that doesn't refer to a record in a foreign table causes an error.

Using null for a value as a foreign key doesn't cause an error because it indicates no relations.

The default behavior for trying to delete a record that has foreign relationships is for the database to throw an error. This is called the delete option of ON DELETE RESTRICT.

ON DELETE CASCADE is the delete option that denotes when a record with foreign relations is deleted that the record related be deleted as well. Hence the term "CASCADE".

ON DELETE SET NULL is similar to ON DELETE CASCADE except the records with foreign relations foreign key values are set to NULL.

ON DELETE SET DEFAULT is similar to ON DELETE SET NULL except the records with foreign relations foreign key values are set to their default values.

## Joins

Joins produce values by merging together rows from different related tables.

The order in which you join tables *frequently* matters. 

If two tables have the same column names, the it is up to us to provide the query context.

Tables and columns can be renamed using the AS keyword.

There are a few types of joins.

When joining with normal joins if the matching statement does not match then the source row is left out of the result.

Inner Joins are the default type of join in SQL. The result of the join are only those rows that directly match with each other from each of the tables.

Left Outer Join is the type of join where every row from the *source* table is preserved regardless of whether they match on the target table.

Right Outer Join is the type of join where every row from the *target* table is preserved regardless of whether they match on the source table.

Full Join is the type of join that preserves rows from both tables regardless of whether they match. The unmatched rows on the target table are preserved as well as the unmatched rows on the source table.

## Aggregation & Grouping

Grouping is used to reduce many rows down to a few.

Aggregates reduce many values down to one.

Using both groups and aggregates together is useful because aggregates can operate on groups.

Using the `COUNT` aggregate on a null value does not include it in the final count. Using `COUNT(*)` will count all rows regardless. 

`HAVING` is a keyword for filtering out groups.

You cannot nest function calls.

## Ordering

You can sort using the ORDER BY keyword.

The ORDER BY by default sorts from least to greatest.

By using the DESC keyword, it will sort from greatest to least.

By using the ASC keyword, it will sort from least to greated, the default behavior.

Ordering with multiple columns will sort in the order that the columns are listed.

## Offset & Limit

The OFFSET keyword is used to skip records in a result set.

The LIMIT keyword constains the number of records in the result set.

By convention, LIMIT comes first, OFFSET comes second in queries.

## Set operators

A set is an operator that joins together two different sets of data.

UNION is a keyword that appends the results of two different queries together while performing some special behavior.

When the two queries used in a UNION return matching records, the union will only include that record once in the result set.

By using UNION ALL, each query will return every matched record, even if the queries contain matching rows.

A union can only be used when each query contains the same columns.

The INTERSECT keyword finds the rows common in the results of two queries.

The EXCEPT keyword finds the rows that are present in the first query but not the second.

## Subqueries

A subquery is a query that exists within another query. It's results can be used to determine the results of the larger query.

Subqueries can generate different structures:

  - one row and one column (scalar)
  - many rows and one column
  - many rows, many columns

A subquery in a select statement must result in a scalar.

A subquery in a FROM statement must return a result set compatible with the greater query.

A subquery in a FROM clause must have an alias applied to it.

A subquery in a JOIN clause will work when the returned data is compatible with the on clause.

When using subqueries in a WHERE clause the allowed structure of data is dependant on the type of operator.

The ALL & SOME operators can be used to compare against a subquery that returns a single column.

A correlated subquery is one that references a value from the query it is nested in.

A SELECT with a subquery, without a FROM, will only work when the subquery returns one value.