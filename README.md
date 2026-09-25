# MaMpf Init Data

This repo holds a dump of a dummy MaMpf database alongside some dummy uploads (ca. 70 MB big). To preseed your local DB with this data, add the following env variables to your `docker/development/docker-compose.yml` file (in the `services -> mampf -> environment` section):

```sh
DB_SQL_PRESEED_URL: "https://github.com/MaMpf-HD/mampf-init-data/raw/main/data/mampf.sql"
UPLOADS_PRESEED_URL: "https://github.com/MaMpf-HD/mampf-init-data/raw/main/data/uploads.zip"
```

## What is inside

The current term is **SS 2026**, and it is a term under way: registration for it
is over, its lecture has a finalized roster, students sit in tutorials with
tutors in front of them, and exercise sheets have been handed in and partly
corrected. Everything still being registered for lives in the term after it —
the ordinary registrations for a lecture and a seminar, and the solver, cohort
and two-stage scenarios.

Besides the lectures and their media, the dump carries announcements for
lectures and from the administration, forum discussions, comments, annotations
on every video (the teacher keeps their own notes) and watchlists for the
students and the teacher. Nothing greets you on the landing page.

Lecture 1 has vignettes switched on and carries six of them, one for every
state a vignette can be in: two drafts, one published without data collection,
one published with answers under three codes, one collecting but unanswered,
and one withdrawn while locked.

Every lecture home page carries a welcome text in the language of its lecture,
one of them with a program attached, and the term after the current one is
staged the way students meet it before it starts: the banner is on, with
lectures that are published with an open registration, published without one,
and not published yet.

## Accounts

Every account in the dump uses the password

```
lemon-floppy-curtain-42
```

The usual entry points are `admin@mampf.edu`, `teacher@mampf.edu`,
`student1@mampf.edu` … `student5@mampf.edu` and `tutor@mampf.edu`; the demo
scenarios add further students.

These accounts sign in without a detour: students have a name, a matriculation
number and a study program, and admins and teachers have declined to give them.
Four further accounts exist only for the questions MaMpf asks after sign-in,
because that is the only way to see them without editing the database:

| Account | Asked for |
|---|---|
| `ask-data@mampf.edu` | name, matriculation number and study program |
| `ask-teacher@mampf.edu` | the same, as the teacher of a lecture of its own |
| `ask-password@mampf.edu` | a new password (old password policy) |
| `ask-both@mampf.edu` | both, the password first |

## Rebuilding the dump

The data is rebuilt from the MaMpf repository, not edited by hand:

```sh
# Start from the dump that is published here, then:
rails db:migrate
rails seeds:build                  # one semester on, the usual next edition
rails seeds:build term="SS 2026"   # or: rebuild the edition where it stands
rails db:dump format=sql
rails seeds:package
```

`data/uploads.zip` holds exactly the files the dump refers to — the attachments
of its records, their derivatives and the Trix blobs — packed as an `uploads/`
tree. A local development store collects far more than that over time, so it is
not the whole directory.
