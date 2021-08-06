# Plv8-build: the easiest way to install PLV8 extension to current PostgreSQL release version
## Build author
* Alexey Fadeev fadeevas@sibedge.com, sibedge, Tomsk, Russia
## Installation
This build of PLV8 extension for PostgreSQL requires Linux with PostgreSQL 13.<br />
Typical installation procedure may look like this:<br />

```
$ git clone https://github.com/sibedge-llc/plv8-build.git
$ cd plv8-build
$ sudo make install
```
## Test the installation
Create extension script should be executed at first. Please be aware that superuser or database owner privileges are needed
```sql
CREATE EXTENSION plv8;
```
Then you can perform SQL query (allowed to any user)
```sql
DO $$
  plv8.elog(NOTICE, 'Hello world!');
$$ LANGUAGE plv8;
```
