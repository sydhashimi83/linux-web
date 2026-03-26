FROM mariadb:10.11

# Copy initial SQL to the special init directory
COPY db_setup.sql /docker-entrypoint-initdb.d/

# No need for CMD — base image handles startup
