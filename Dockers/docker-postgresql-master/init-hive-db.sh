#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
  CREATE USER hue WITH PASSWORD 'hue';
  CREATE USER hive WITH PASSWORD 'hive';
  CREATE DATABASE hue;
  GRANT ALL PRIVILEGES ON DATABASE hue TO hue;
  GRANT ALL PRIVILEGES ON DATABASE hue TO hive;

SELECT 'GRANT SELECT,INSERT,UPDATE,DELETE ON "' || schemaname || '"."' || tablename || '" TO hue ;'
FROM pg_tables
WHERE tableowner = CURRENT_USER and schemaname = 'public';

SELECT 'GRANT SELECT,INSERT,UPDATE,DELETE ON "' || schemaname || '"."' || tablename || '" TO hive ;'
FROM pg_tables
WHERE tableowner = CURRENT_USER and schemaname = 'public';

EOSQL
