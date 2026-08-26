# MaMpf Init Data

This repo holds a dump of a dummy MaMpf database alongside some dummy uploads (ca. 50 MB big). To preseed your local DB with this data, add the following env variables to your `docker/development/docker-compose.yml` file (in the `services -> mampf -> environment` section):

```sh
DB_SQL_PRESEED_URL: "https://github.com/MaMpf-HD/mampf-init-data/raw/main/data/mampf.sql"
UPLOADS_PRESEED_URL: "https://github.com/MaMpf-HD/mampf-init-data/raw/main/data/uploads.zip"
```

## What is inside

The current term is **SS 2026**, with eight events in it. Besides the lectures
and their media, the dump carries registration campaigns that are open right
now (a lecture and a seminar in the current and in the next term, plus the
solver and cohort scenarios), finalized rosters, announcements for lectures and
from the administration, forum discussions, comments and annotations on media,
and a few watchlists. Nothing greets you on the landing page.

Every lecture home page carries a short welcome text, and the term after the
current one is staged the way students meet it before it starts: the banner is
on, with lectures that are published with an open registration, published
without one, and not published yet.

## Accounts

Every account in the dump uses the password

```
lemon-floppy-curtain-42
```

The usual entry points are `admin@mampf.edu`, `teacher@mampf.edu`,
`student1@mampf.edu` … `student5@mampf.edu` and `tutor@mampf.edu`; the demo
scenarios add further students.

## Rebuilding the dump

The data is rebuilt from the MaMpf repository, not edited by hand:

```sh
rails seeds:build   # moves the set one year on and bakes in the demo material
pg_dump -F p -O -w -U <user> -h <host> -d <db> -f data/mampf.sql
```
