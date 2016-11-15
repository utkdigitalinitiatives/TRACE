#!/usr/bin/env bash

# Setup with Composer to avoid the enable loop
cd /home/vagrant/.drush || exit

curl https://ftp.drupal.org/files/projects/drush_extras-7.x-3.x-dev.tar.gz  | tar xvz drush_extras && rm drush_extras-7.x-3.x-dev.tar.gz

drush cc drush
