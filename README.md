# MaMpf Init Data

This repo holds a dump of a dummy MaMpf database alongside some dummy uploads (ca. 50 MB big). To preseed your local DB with this data, add the following env variables to your `docker/development/docker-compose.yml` file (in the `services -> mampf -> environment` section):

```sh
DB_SQL_PRESEED_URL: "https://github.com/MaMpf-HD/mampf-init-data/raw/main/data/20220923120841_mampf.sql"
UPLOADS_PRESEED_URL: "https://github.com/MaMpf-HD/mampf-init-data/raw/main/data/uploads.zip"
```
