# This project has been deprecated and is no longer updated.
## Suggested Alternatives
Use our Docker-images with postgres and plv8. It's free! Images based on Debian and Alpine are available.

```
docker pull sibedge/postgres-plv8
```

Pay attention, that BigInt is not serializable in v8 and [by default in plv8 v3.0.0 and higher BigInt numbers are converted into string(!)](https://github.com/plv8/plv8/issues/485). But if you need BigInt as numbers support, use this image with Postgres and specific version of plv8:

```
docker pull sibedge/postgres-plv8-bigint
```

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

## Docker
You can run PostgreSQL 13 with plv8 in Docker.<br />
```
$ git clone https://github.com/sibedge-llc/plv8-build.git
$ cd plv8-build/docker
$ git checkout pg13-2.3.15
$ docker build -t pg13-plv8-2
$ docker run -it -d --name pg13-plv8-2 -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=postgres -p 5432:5432/tcp pg13-plv8-2
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
