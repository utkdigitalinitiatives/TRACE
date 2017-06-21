#!/usr/bin/env bash

# This script modifies the standard metadata display for islandora_scholar
echo "Updating islandora_scholar's default metadata display."

cd "$DRUPAL_HOME" || exit
drush vset islandora_scholar_use_standard_metadata_display 1

echo "Updating islandora_solr's 'limit results to fields listed above' setting."
drush vset islandora_solr_limit_result_fields 1

echo "Updating islandora_solr's 'default metadata viewer' setting."
drush vset islandora_metadata_display 'islandora_solr_metadata'

# cat the list of filters into the islandora_solr_base_filter variable
# shellcheck disable=SC2105
# shellcheck disable=SC2002
if [ ! -f "$SHARED_DIR"/configs/islandora_solr_base_filter_list ]; then
  echo "Missing the islandora_solr_base_filter_list file!"
  break
else
  cat "$SHARED_DIR"/configs/islandora_solr_base_filter_list | drush vset islandora_solr_base_filter -
fi
