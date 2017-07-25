#!/usr/bin/env bash

# Temp Fix for TRAC-750
cd "$DRUPAL_HOME" || exit
drush sql-query "update block set title='<none>' where module = 'menu' and delta = 'trace-navigation'"

# add themes.inc to islandora/themes directory
sudo cp "$SHARED_DIR"/configs/theme.inc "$DRUPAL_HOME"/sites/all/modules/islandora/theme/
# add symlink to enable phpmyadmin
sudo ln -s /etc/phpmyadmin/apache.conf /etc/apache2/conf-enabled/phpmyadmin.conf
sudo service apache2 reload

# Add any cleanup Commands here
sudo chmod -R 777 /home/vagrant/.drush

# For root developers to use locate commands
sudo updatedb

# Drupal into maintenance mode
drush -y vset --exact maintenance_mode 1
drush cc all

# Update Drupal
yes | drush pm-update drupal

# Drupal out of maintenance mode
drush -y vset --exact maintenance_mode 0
drush cc all
