#!/usr/bin/env bash

echo "Checking for solr_metadata sql files"
if [ -f "$SHARED_DIR/configs/solr-tables/islandora_solr_metadata_cmodels.sql" ]; then
  echo "Loading islandora_solr_metadata_cmodels.sql"
  drush sql-cli < $SHARED_DIR/configs/solr-tables/islandora_solr_metadata_cmodels.sql
  drush cc all
fi
if [ -f "$SHARED_DIR/configs/solr-tables/islandora_solr_metadata_associations.sql" ]; then
  echo "Loading islandora_solr_metadata_associations.sql"
  drush sql-cli < $SHARED_DIR/configs/solr-tables/islandora_solr_metadata_associations.sql
  drush cc all
fi
if [ -f "$SHARED_DIR/configs/solr-tables/islandora_solr_metadata_fields.sql" ]; then
  echo "Loading islandora_solr_metadata_fields.sql"
  drush sql-cli < $SHARED_DIR/configs/solr-tables/islandora_solr_metadata_fields.sql
  drush cc all
fi
if [ -f "$SHARED_DIR/configs/solr-tables/islandora_solr_fields.sql" ]; then
  echo "Loading islandora_solr_fields.sql"
  drush sql-cli < $SHARED_DIR/configs/solr-tables/islandora_solr_fields.sql
  drush cc all
fi

echo "Finished loading solr metadata config"
