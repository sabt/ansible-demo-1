#!/usr/bin/env bash

service ssh start

DATABASE="$1" ; shift
DATADIR="$1" ; shift
USER="$1" ; shift
PASSWORD="$1" ; shift

if [[ -z "$DATABASE" ]] ; then DATABASE="$POSTGRES_DB" ; fi
if [[ -z "$DATABASE" ]] ; then DATABASE='postgres' ; fi

if [[ -z "$USER" ]] ; then USER="$POSTGRES_USER" ; fi
if [[ -z "$USER" ]] ; then USER="$DATABASE" ; fi

if [[ -z "$PASSWORD" ]] ; then PASSWORD="$POSTGRES_PASSWORD" ; fi
if [[ -z "$PASSWORD" ]] ; then PASSWORD="$DATABASE" ; fi

if [[ -z "$DATADIR" ]] ; then DATADIR="$PGDATA" ; fi
if [[ -z "$DATADIR" ]] ; then DATADIR="/data" ; fi

export POSTGRES_DB="$DATABASE"
export POSTGRES_USER="$USER"
export POSTGRES_PASSWORD="$PASSWORD"
export PGDATA="$DATADIR"

echo "Using db '$POSTGRES_DB' at '$PGDATA', user '$POSTGRES_USER', passwd '$POSTGRES_PASSWORD'."

/usr/local/bin/docker-entrypoint.sh postgres
sleep 1
#exec tail -f /var/log/postgresql/postgresql-16-postgres.log
sleep 999999999