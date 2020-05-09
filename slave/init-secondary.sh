#!/bin/bash

echo "Removing Default Directory"
rm -rf ${PGDATA}/*

# i introduced this because slave was initializing faster than master
# even when the depends on argument was used
# this forces a delay till master is ready
until ping -c 1 -W 1 master-db
do
    sleep 2s
done

until pg_basebackup -h master-db -D ${PGDATA} -U ${PG_REP_USER} -vP -R -X stream -C -S pgstandby1 -W
do
    sleep 2s
done

set -e
chown postgres. ${PGDATA} -R
chmod 700 ${PGDATA} -R

exec "$@"