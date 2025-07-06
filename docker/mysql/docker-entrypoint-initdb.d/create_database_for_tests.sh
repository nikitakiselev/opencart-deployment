#!/bin/bash

mysql_note "Creating database for tests: ${MYSQL_DATABASE}"
docker_process_sql --database=mysql <<<"CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}_tests\` ;"
