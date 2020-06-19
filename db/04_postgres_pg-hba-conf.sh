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
 
host             all             all          all             md5
host             all             all          0.0.0.0/0       md5

#If you're running PostgreSQL >= 10 and also all clieants are cutting-edge:
#host             all             all          all             scram-sha-256
EOF
