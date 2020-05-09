#!/bin/bash

echo "Writing PG hba file"
echo "host replication $PG_REP_USER 0.0.0.0/0 trust" >> "$PGDATA/pg_hba.conf"
set -e

echo "Creating Replication User"
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER $PG_REP_USER REPLICATION LOGIN CONNECTION LIMIT 100;
EOSQL



