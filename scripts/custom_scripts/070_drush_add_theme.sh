#!/usr/bin/env bash

echo "drush enable theme"
# Set permissions /sites/all/themes
sudo chown -hR vagrant:www-data "$DRUPAL_HOME"/sites/all/themes
sudo chmod -R 755 "$DRUPAL_HOME"/sites/all/themes
cd "$DRUPAL_HOME"/sites/all/themes || exit

# Clone UTKdrupal Theme and set permissions UTKdrupal
git clone https://github.com/utkdigitalinitiatives/UTKdrupal
git fetch
git branch -r
git checkout -b october origin/october
git pull
sudo chown -hR vagrant:www-data UTKdrupal
# Enable UTKdrupal and set as default
drush -y -u 1 en pm-enable UTKdrupal
drush -y -u 1 en vset theme_default UTKdrupal
# uncomment below to set as default
drush eval "variable_set('theme_default', 'UTKdrupal')"

# Change Site name to TRACE
drush variable-set site_name "TRACE"

drush vset theme_debug 1
drush -y dis devel
sudo apt-get -y update
sudo apt-get -y install subversion
drush -y en devel
