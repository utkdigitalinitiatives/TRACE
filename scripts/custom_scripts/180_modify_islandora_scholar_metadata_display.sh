#!/usr/bin/env bash

# This script modifies the standard metadata display for islandora_scholar

echo "Updating islandora_scholar's default metadata display."

cd "$DRUPAL_HOME" || exit
drush vset islandora_scholar_use_standard_metadata_display 1
