SQL Script Migrate
=================

Author: Efren Bautista Jr.

Usage
--------------

NOTE: CREATE YOUR DATABASE FIRST

```bash
bash migratesql.sh <username> <password> <migrate-sql / init-only / sqlcommand-only> <databasename>
```

- parameter 1 username of your database

- parameter 2 password of your database

- parameter 3 type of migration

<migrate-sql / init-only / sqlcommand-only>

migrate-sql - executes init.sql and all sql files

init-only - executes ini.sql only (initial database creation)

sql-commands-only - executes sql files except init.sql

if no parameter 2 means database has already been setup

