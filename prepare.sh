#!/bin/bash
set -e 
DB_HOST=$(cat konga.env | grep DB_HOST | awk -F "=" '{print $2}')
DB_USER=$(cat konga.env | grep DB_USER | awk -F "=" '{print $2}')
DB_PASSWORD=$(cat konga.env | grep DB_PASSWORD | awk -F "=" '{print $2}')
DB_DATABASE=$(cat konga.env | grep DB_DATABASE | awk -F "=" '{print $2}')
DB_PORT=$(cat konga.env | grep DB_PORT | awk -F "=" '{print $2}')

# Kong Migration
echo "Kong Migrating..."
docker run --rm --env-file kong.env kong:2.0.1 kong migrations bootstrap
echo "#################"
sleep 2
# Konga Migration
docker run --rm pantsel/konga:0.14.7 -c prepare -a postgres -u postgresql://$DB_USER:$DB_PASSWORD@$DB_HOST:$DB_PORT/$DB_DATABASE
