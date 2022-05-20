#! /bin/bash

set -m

export KEYCLOAK_USER="$KEYCLOAK_ADMIN_USER"
export KEYCLOAK_PASSWORD="$KEYCLOAK_ADMIN_PASSWORD"

KEYCLOAK_DATABASE_CONFIGDIR="/keycloak/database/config"

# Wait until Keycloak configuration is present
while [ -z "$(ls -A $KEYCLOAK_DATABASE_CONFIGDIR)" ]; do
  echo "Keycloak database config file(s) in $KEYCLOAK_DATABASE_CONFIGDIR missing -> sleeping"
  sleep 3
done

export DB_PASSWORD=$(cat "$KEYCLOAK_DATABASE_CONFIGDIR/database_password")

bash /opt/jboss/tools/docker-entrypoint.sh -b "0.0.0.0"

fg %1
