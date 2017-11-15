#!/usr/bin/env bash

echo "Checking for solr_metadata sql files"
if [ -f "$SHARED_DIR/configs/solr-tables/islandora_solr_metadata_cmodels.sql" ]; then
  echo "Loading islandora_solr_metadata_cmodels.sql"
  drush sql-cli < "$SHARED_DIR"/configs/solr-tables/islandora_solr_metadata_cmodels.sql
  drush cc all
fi
if [ -f "$SHARED_DIR/configs/solr-tables/islandora_solr_metadata_associations.sql" ]; then
  echo "Loading islandora_solr_metadata_associations.sql"
  drush sql-cli < "$SHARED_DIR"/configs/solr-tables/islandora_solr_metadata_associations.sql
  drush cc all
fi
if [ -f "$SHARED_DIR/configs/solr-tables/islandora_solr_metadata_fields.sql" ]; then
  echo "Loading islandora_solr_metadata_fields.sql"
  drush sql-cli < "$SHARED_DIR"/configs/solr-tables/islandora_solr_metadata_fields.sql
  drush cc all
fi
if [ -f "$SHARED_DIR/configs/solr-tables/islandora_solr_fields.sql" ]; then
  echo "Loading islandora_solr_fields.sql"
  drush sql-cli < "$SHARED_DIR"/configs/solr-tables/islandora_solr_fields.sql
  drush cc all
fi

# Set the islandora_solr_facet_min_limit to "1"
cd "$DRUPAL_HOME" || exit
drush vset islandora_solr_facet_min_limit 1
cd "$HOME_DIR" || exit

echo "Finished loading solr metadata config"

# Check for New Forms
echo "Checking for New XML Forms"
if [ -f "$SHARED_DIR/configs/form-tables/xml_forms.sql" ]; then
    echo "Loading xml_forms.sql"
    drush sql-cli < "$SHARED_DIR"/configs/form-tables/xml_forms.sql
    drush cc all
fi

# Associate Forms where Associations do not already Exist
echo "Checking for Form Builder Associations"
if [ -f "$SHARED_DIR/configs/form-tables/xml_form_builder_form_associations.sql" ]; then
    echo "Loading xml_form_builder_form_associations.sql"
    drush sql-cli < "$SHARED_DIR"/configs/form-tables/xml_form_builder_form_associations.sql
    drush cc all
fi
