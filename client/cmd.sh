#!/usr/bin/env bash

echo "Check if the postgres is ready to accept connections"
until pg_isready -h postgres -U postgres -d postgres -q
do
    echo "Waiting for postgres is running..."
    sleep 2
done
echo "Ready to connect to postgres"

psql \
    --host postgres  \
    --username postgres  \
    --dbname postgres  \
    --file wellpaids.sql \
    --output /output/$(date +%Y%m%d-%H%M%)-result.txt