#!/bin/bash
MYSQL_HOST="${DB_HOST}"
MYSQL_USER="${DB_USER}"
# Ensure required environment variables are passed
if [ -z "$MYSQL_HOST" ] || [ -z "$MYSQL_USER" ] || [ -z "$MYSQL_PASSWORD" ]; then
    echo "ERROR: MYSQL_HOST, MYSQL_USER, and MYSQL_PASSWORD must be set."
    exit 1
fi



echo "Connecting to MySQL host: ${MYSQL_HOST}..."

# 1. Initialize schema and database using root/admin privileges
# Note: If your structural ConfigMap uses an app-specific user, 
# make sure this Job overrides it with a user that has permission to CREATE databases/users.
mysql -h "${MYSQL_HOST}" -uroot -p"${MYSQL_PASSWORD}" < /schema/schema.sql
if [ $? -ne 0 ]; then echo "Failed to load schema.sql"; exit 1; fi

mysql -h "${MYSQL_HOST}" -uroot -p"${MYSQL_PASSWORD}" < /schema/app-user.sql
if [ $? -ne 0 ]; then echo "Failed to load app-user.sql"; exit 1; fi


echo "Database schema and master data successfully loaded!"