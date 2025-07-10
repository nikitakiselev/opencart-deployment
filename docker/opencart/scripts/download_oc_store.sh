#!/bin/bash

# The script downloads and unzip ocStore.
# Should be executed from the project root folder.

set -e

echo "👽 Downloading ocStore ${OCSTORE_VERSION}..."

DOWNLOAD_URL="https://github.com/ocStore/ocStore/archive/refs/tags/$OCSTORE_VERSION.zip"
TMP_DIR="/tmp"
FILE_PATH="$TMP_DIR/$OCSTORE_VERSION.zip"

wget -P "$TMP_DIR" "$DOWNLOAD_URL"

echo "🗃 Unzipping..."
mkdir -p /web
unzip -q "$FILE_PATH" -d /web

SOURCE_DIR=/web/ocStore-${OCSTORE_VERSION//v/}
rsync -a $SOURCE_DIR/* /web
rm -rf "$SOURCE_DIR"

# chmod -R 775 /web

echo "✅ Completed."
