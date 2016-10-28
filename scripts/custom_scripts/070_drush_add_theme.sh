#!/usr/bin/env bash

echo "drush enable theme"
# Set permissions /sites/all/themes
sudo chown -hR vagrant:www-data "$DRUPAL_HOME"/sites/all/themes
sudo chmod -R 755 "$DRUPAL_HOME"/sites/all/themes
cd "$DRUPAL_HOME"/sites/all/themes || exit

# Clone UTKdrupal Theme
git clone https://github.com/utkdigitalinitiatives/UTKdrupal
cd "$DRUPAL_HOME"/sites/all/themes/UTKdrupal || exit
git fetch
git branch -r
git checkout -b october origin/october
git pull
cd "$DRUPAL_HOME"/sites/all/themes || exit

# Set permissions UTKdrupal
sudo chown -hR vagrant:www-data UTKdrupal

# Enable UTKdrupal and set as default
drush -y en UTKdrupal
drush -y vset theme_default UTKdrupal
# uncomment below to set as default
drush eval "variable_set('theme_default', 'UTKdrupal')"

# Admin Theme Adminimal https://www.drupal.org/project/adminimal_theme
# drush dl adminimal
# drush -y en adminimal
# drush vset admin_theme adminimal
# drush -y dis seven

# Disable Unneeded Themes
drush -y dis bartik

# Change Site name to TRACE
drush variable-set site_name "TRACE"

drush vset theme_debug 1
drush -y dis devel
sudo apt-get -y update
sudo apt-get -y install subversion
drush -y en devel
