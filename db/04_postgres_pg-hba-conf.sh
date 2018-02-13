#!/bin/sh

# We need to replace the default pg_hba.conf to allow
# the connections we need (with or without password):

cat << "EOF" > "$PGDATA/pg_hba.conf"
# TYPE           DATABASE        USER         ADDRESS         METHOD

local            all             all                          trust
host             all             all          127.0.0.1/32    trust
host             all             all          ::1/128         trust

hostnossl        all             archive      samenet         trust
hostnossl        all             report       samenet         trust
 
#host             all             all          0.0.0.0/0       md5
host             all             all          all             md5
EOF
