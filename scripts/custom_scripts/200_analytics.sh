#!/usr/bin/env bash
cd "$DRUPAL_HOME"/sites/all/modules || exit

# Enabling Google analytics via Google Tag manager
yes | drush en google_tag

# Variables for Google Tag manager
# dlhost1 id: GTM-WPV9QH8
# TRACE.utk.edu id: GTM-WQMZW84
drush vset google_tag_compact_tag 1
drush vset google_tag_container_id 'GTM-WPV9QH8'

drush vset google_tag_path_toggle '0'
drush ev 'variable_set("google_tag_role_list", array(1 => 0,2 => 0,3 => 0,4 => 0,5 => 0,6 => 0,7 => 0));'
drush vset google_tag_role_toggle '0'
drush vset google_tag_status_toggle 0

# These are running on multiple lines deliberately
drush vset google_tag_status_list '403 Forbidden
404 Not Found'
drush vset google_tag_path_list 'admin*
batch*
node/add*
node/*/*
user/*/*'
