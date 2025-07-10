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
  --http_server "$SERVER_URL";

echo "Moving storage folder outside the system."
mkdir -p /web/storage
cp -r /web/upload/system/storage/* /web/storage/
rm -rf /web/upload/system/storage

sed -i "s#DIR_SYSTEM \. 'storage/#'/web/storage/#g" /web/upload/config.php
sed -i "s#DIR_SYSTEM \. 'storage/#'/web/storage/#g" /web/upload/admin/config.php

rm -rf /web/upload/install

echo "Set permissions"
chown -R 1000:1000 /web/storage
chmod -R 755 /web/storage
chown -R 1000:1000 /web/upload
chmod -R 755 /web/upload

echo "OcStore successfully installed."
