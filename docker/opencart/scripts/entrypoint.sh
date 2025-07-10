#!/bin/bash

set -e

if [ ! -d "/web/upload" ]; then
  bash /scripts/download_oc_store.sh
fi

if [ -d "/web/upload/install" ]; then
  bash /scripts/install_opencart.sh
fi

if [ $# -eq 0 ]; then
  exec /opt/docker/bin/entrypoint.sh supervisord
else
  exec /opt/docker/bin/entrypoint.sh "$@"
fi
