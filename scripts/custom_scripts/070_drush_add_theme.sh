#!/usr/bin/env bash
# this makes the HOMEUSER equal to vagrant on devel and staging and
# equal to islandora on the server
if [ "$HOMEUSER" = "" ]; then
   HOMEUSER="vagrant"
fi
echo "drush enable theme"
# Set permissions /sites/all/themes
sudo chown -hR $HOMEUSER:www-data "$DRUPAL_HOME"/sites/all/themes
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
sudo chown -hR $HOMEUSER:www-data UTKdrupal

# Enable UTKdrupal and set as default
drush -y en UTKdrupal
drush -y vset theme_default UTKdrupal
# uncomment below to set as default
drush eval "variable_set('theme_default', 'UTKdrupal')"

# Admin Theme Adminimal https://www.drupal.org/project/adminimal_theme
cd "$DRUPAL_HOME"/sites/all/modules/ || exit
drush dl adminimal_theme adminimal_admin_menu module_filter
drush en -y adminimal adminimal_admin_menu module_filter

drush -y vset admin_theme adminimal
drush -y vset admin_menu_margin_top 0
drush -y vset adminimal_admin_menu_render "hidden"

# drush dis -y comment contextual dashboard overlay

# Disable Unneeded Themes
drush -y dis bartik
drush -y dis seven

drush -y vset theme_debug 1
drush -y dis devel
drush -y dl devel
#sudo apt-get -y update
sudo apt-get -y install subversion
drush -y en devel

# Change Login
# betterlogin
