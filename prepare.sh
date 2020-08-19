#!/bin/bash
set -e 
echo "Creating Database Container..."
docker-compose up -d postgresql
sleep 5
echo "Create Database Container Completed"
echo "##################################################################"
echo "Creating Database KONG..."
docker-compose exec --user postgres postgresql psql -c "CREATE DATABASE KONG OWNER POSTGRES"
echo "Create Database KONG Completed"
echo "##################################################################"
echo "Creating Database KONGA..."
docker-compose exec --user postgres postgresql psql -c "CREATE DATABASE KONGA OWNER POSTGRES"
echo "Create Database KONGA Completed"
echo "##################################################################"


DB_HOST=$(cat konga.env | grep DB_HOST | awk -F "=" '{print $2}')
DB_USER=$(cat konga.env | grep DB_USER | awk -F "=" '{print $2}')
DB_PASSWORD=$(cat konga.env | grep DB_PASSWORD | awk -F "=" '{print $2}')
DB_DATABASE=$(cat konga.env | grep DB_DATABASE | awk -F "=" '{print $2}')
DB_PORT=$(cat konga.env | grep DB_PORT | awk -F "=" '{print $2}')

# Kong Migration
echo "Kong Migrating..."
# Konga Migration
docker-compose run kong kong migrations bootstrap
echo "Kong Migrate Completed"
echo "##################################################################"
# Konga Migration
echo "Konga Initializing..."
docker-compose run konga -c prepare -a postgres -u postgresql://$DB_USER:$DB_PASSWORD@$DB_HOST:$DB_PORT/$DB_DATABASE 
echo "Konga Init Completed"

# Down all containers
docker-compose down 

echo "##################################################################"
echo "##################################################################"
echo "All Steps Completed, Please Run 'docker-compose up -d' to Start the Service!"
