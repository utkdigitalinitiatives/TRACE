#!/usr/bin/env bash

# This script modifies the standard metadata display for islandora_scholar

echo "Updating islandora_scholar's default metadata display."

cd "$DRUPAL_HOME" || exit
drush vset islandora_scholar_use_standard_metadata_display 1

echo "Updating islandora_solr's 'limit results to fields listed above' setting."
drush vset islandora_solr_limit_result_fields 1

echo "Updating islandora_solr's 'default metadata viewer' setting."
drush vset islandora_metadata_display 'islandora_solr_metadata'