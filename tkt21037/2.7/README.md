
# DevOps with Docker
## Part 2 | Exercise 2.7

Postgres image uses a volume by default. Define manually a volume for the database in a convenient location such as in `./database` so you should use now a [bind mount](https://docs.docker.com/storage/bind-mounts/). The image [documentation](https://github.com/docker-library/docs/blob/master/postgres/README.md#where-to-store-data) may help you with the task. The benefit of a bind mount is that since you know exactly where the data is in your file system, it is easy to create backups. If the Docker managed volumes are used, the location of the data in the file system can not be controlled and that makes backups a bit less trivial...

After you have configured the bind mount volume:

- Save a few messages through the frontend
- Run `docker compose down`
- Run `docker compose up` and see that the messages are available after refreshing browser
- Run `docker compose down` and delete the volume folder manually
- Run `docker compose up` and the data should be gone

> [!TIP]
> To save you the trouble of testing all of those steps, just look into the folder before trying the steps. If it's empty after `docker compose up` then something is wrong.

Submit the docker-compose.yml

---

```shell
[root@arch-01 ~]# ls database/        
[root@arch-01 ~]# docker compose up -d
[+] Running 5/5
 ✔ Network root_default  Created                                                                                                                                                                                         0.1s 
 ✔ Container redis       Started                                                                                                                                                                                         1.3s 
 ✔ Container postgres    Started                                                                                                                                                                                         1.3s 
 ✔ Container backend     Started                                                                                                                                                                                         1.9s 
 ✔ Container frontend    Started                                                                                                                                                                                         2.5s 
[root@arch-01 ~]# ls database/
PG_VERSION  global        pg_dynshmem  pg_ident.conf  pg_multixact  pg_replslot  pg_snapshots  pg_stat_tmp  pg_tblspc    pg_wal   postgresql.auto.conf  postmaster.opts
base        pg_commit_ts  pg_hba.conf  pg_logical     pg_notify     pg_serial    pg_stat       pg_subtrans  pg_twophase  pg_xact  postgresql.conf       postmaster.pid
```

![persistent-db-volume](assets/persistent-db-volume.png)

```shell
[root@arch-01 ~]# docker compose logs postgres | tail
postgres  | 2024-05-15 23:26:24.307 UTC [1] LOG:  starting PostgreSQL 16.3 on x86_64-pc-linux-musl, compiled by gcc (Alpine 13.2.1_git20231014) 13.2.1 20231014, 64-bit
postgres  | 2024-05-15 23:26:24.312 UTC [1] LOG:  listening on IPv4 address "0.0.0.0", port 5432
postgres  | 2024-05-15 23:26:24.313 UTC [1] LOG:  listening on IPv6 address "::", port 5432
postgres  | 2024-05-15 23:26:24.334 UTC [1] LOG:  listening on Unix socket "/var/run/postgresql/.s.PGSQL.5432"
postgres  | 2024-05-15 23:26:24.368 UTC [23] LOG:  database system was shut down at 2024-05-15 23:25:58 UTC
postgres  | 2024-05-15 23:26:24.385 UTC [1] LOG:  database system is ready to accept connections
postgres  | 2024-05-15 23:26:24.789 UTC [27] ERROR:  relation "messages" already exists
postgres  | 2024-05-15 23:26:24.789 UTC [27] STATEMENT:  CREATE TABLE "messages" ("id" bigserial, "body" text, PRIMARY KEY ("id"))
postgres  | 2024-05-15 23:31:24.455 UTC [21] LOG:  checkpoint starting: time
postgres  | 2024-05-15 23:31:26.222 UTC [21] LOG:  checkpoint complete: wrote 20 buffers (0.1%); 0 WAL file(s) added, 0 removed, 0 recycled; write=1.717 s, sync=0.014 s, total=1.767 s; sync files=20, longest=0.013 s, average=0.001 s; distance=51 kB, estimate=51 kB; lsn=0/1556E40, redo lsn=0/1556E08
```
