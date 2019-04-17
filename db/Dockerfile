FROM postgres:11-alpine

#ENV POSTGRES_DB=archive

# Copy the SQL files to initialize the db
# The files in /docker-entrypoint-initdb.d are considered in:
# https://github.com/docker-library/postgres/blob/master/10/alpine/docker-entrypoint.sh
COPY 01_postgres_schema.sql            /docker-entrypoint-initdb.d/
COPY 02_postgres_partitioning.sql      /docker-entrypoint-initdb.d/
COPY 04_postgres_pg-hba-conf.sh        /docker-entrypoint-initdb.d/

COPY crontab /tmp/
RUN crontab /tmp/crontab && rm /tmp/crontab
# to run cron (in addition to the main postgres instance):
#docker exec CONTAINER_ID /usr/sbin/crond -f -d 0
# see https://gist.github.com/jdeathe/94d7b1681187a3a97c5cd4a7eee244f1#apline-linux-busybox-version
# for more ideas

# TODO:
# * pg_hba.conf
