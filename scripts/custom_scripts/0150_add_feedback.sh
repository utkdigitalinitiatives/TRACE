#!/usr/bin/env bash

# requires sites/all/libraries/ua_parser/src/ua-parser.js
cd /var/www/drupal/sites/all/libraries || exit

git clone https://github.com/faisalman/ua-parser-js

cd /var/www/drupal/sites/all/modules || exit

# Download and install with dependencies
# https://www.drupal.org/project/feedback_collect
drush -y dl feedback_collect
drush -y en feedback_collect

# Set the permissions for feedback to display.
# Used this 'drush role-list 'anonymous user' --format=variables'
drush role-add-perm 'anonymous user' 'create feedback_collect content'
drush role-add-perm 'authenticated user' 'create feedback_collect content'

# Configure Module settings
drush -y vset feedback_collect_settings_anonymous 1
drush -y vset feedback_collect_settings_bootstrap_support false
drush -y vset feedback_collect_settings_button_text 'Add feedback'
drush -y vset feedback_collect_settings_custom_css 1
drush -y vset feedback_collect_settings_email 'DonRichards@utk.edu'
drush -y vset feedback_collect_settings_exclude 'admin/*'
drush -y vset feedback_collect_settings_hide_text false
drush -y vset feedback_collect_settings_icon_classes false
drush -y vset feedback_collect_settings_margin 50px
drush -y vset feedback_collect_settings_placement 2

# Content permissions need to be rebuilt at this stage
drush php-eval 'node_access_rebuild();'
