#! /bin/bash

set -m

MYSQL_DATABASE_CONFIGDIR="/keycloak/database/config"
MYSQL_ROOT_PASSWORD_FILE="$MYSQL_DATABASE_CONFIGDIR/database_root_password"
MYSQL_PASSWORD_FILE="$MYSQL_DATABASE_CONFIGDIR/database_password"

if [ -f "$MYSQL_ROOT_PASSWORD_FILE" ]; then
  echo "Passwords already generated"
  export MYSQL_ROOT_PASSWORD=$(cat "$MYSQL_ROOT_PASSWORD_FILE")
  export MYSQL_PASSWORD=$(cat "$MYSQL_PASSWORD_FILE")
else
  mkdir -p "$MYSQL_DATABASE_CONFIGDIR"

  export MYSQL_ROOT_PASSWORD=$(pwgen -s -1 24)
  echo "$MYSQL_ROOT_PASSWORD" > $MYSQL_ROOT_PASSWORD_FILE

  export MYSQL_PASSWORD=$(pwgen -s -1 24)
  echo "$MYSQL_PASSWORD" > $MYSQL_PASSWORD_FILE
fi

bash docker-entrypoint.sh mysqld

fg %1
