#!/usr/bin/env bash

# Add any cleanup Commands here

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
