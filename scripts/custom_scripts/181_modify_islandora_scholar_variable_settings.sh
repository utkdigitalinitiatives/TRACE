#!/usr/bin/env bash

# This script updates islandora_scholar's 'create_fulltext' variable setting.
echo "Modifying islandora_scholar variable settings."

cd "$DRUPAL_HOME" || exit

echo "Updating islandora_scholar's 'create_fulltext' setting."
drush vset islandora_scholar_create_fulltext 1
