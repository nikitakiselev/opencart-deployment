#!/bin/bash

# The script install ocStore.
# Should be executed from the project root folder.

echo "Setup ocStore..."

set -e

echo "Install composer dependencies..."
cd /web; composer update

cd /web/upload/install

php cli_install.php install \
  --db_hostname "$DB_HOST" \
  --db_username "$DB_USERNAME" \
  --db_password "$DB_PASSWORD" \
  --db_database "$DB_DATABASE" \
  --db_driver "$DB_DRIVER" \
  --db_port "$DB_PORT" \
  --username "$ADMIN_USERNAME" \
  --password "$ADMIN_PASSWORD" \
  --email "$ADMIN_EMAIL" \
  --http_server "$ADMIN_PASSWORD";

echo "Moving storage folder outside the system."
cp -r /web/upload/system/storage/* /web/storage/
rm -rf /web/upload/system/storage

sed -i "s#DIR_SYSTEM \. 'storage/#'/web/storage/#g" /web/upload/config.php
sed -i "s#DIR_SYSTEM \. 'storage/#'/web/storage/#g" /web/upload/admin/config.php

rm -rf /web/upload/install

chown -R www-data:www-data /web/storage

echo "OcStore successfully installed."
