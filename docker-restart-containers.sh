#!/bin/bash
#
# docker-restart-containers.sh - Lab Environment Recovery
#

NETWORK_NAME="app-network"
DB_NAME="db-container"
WEB_NAME="webserver-multi"

echo "--- Resetting Docker Lab Environment ---"

if ! docker network ls | grep -q "$NETWORK_NAME"; then
    echo "Creating network: $NETWORK_NAME"
    docker network create "$NETWORK_NAME"
fi

echo "Cleaning up old containers..."
docker rm -f "$DB_NAME" "$WEB_NAME" 2>/dev/null

echo "Launching Database..."
docker run -d \
    --name "$DB_NAME" \
    --network "$NETWORK_NAME" \
    -e MYSQL_ROOT_PASSWORD=rootpassword \
    -e MYSQL_DATABASE=testdb \
    -e MYSQL_USER=labuser \
    -e MYSQL_PASSWORD=labpass \
    it135-mariadb:1.0

echo "Launching Webserver..."
docker run -d \
    --name "$WEB_NAME" \
    --network "$NETWORK_NAME" \
    -p 8080:80 \
    -v $PWD:/var/www/html \
    webserver-base:1.0

echo "Waiting 20 seconds for database initialization..."
sleep 20

echo "--- Lab Environment is LIVE ---"
docker ps
