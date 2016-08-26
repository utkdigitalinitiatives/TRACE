#!/bin/bash

echo "drush add collections  ${DRUPAL_HOME}" > /tmp/junk_out
echo "drush add collections  ${SHARED_DIR}" >> /tmp/junk_out
#DRUPAL_HOME="/var/www/drupal"
cd "$DRUPAL_HOME"/sites/all/modules/islandora_ingest_collections || exit
drush --user=admin cicfd --input="${SHARED_DIR}/configs/trace_collections.csv" --create_node

