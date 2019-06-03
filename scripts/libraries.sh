#!/usr/bin/env bash

echo "Installing all Islandora Foundation module's required libraries"

cd "$DRUPAL_HOME"/sites/all/libraries || exit

sudo git clone http://sebarmeli.github.com/JAIL

sudo drush cache-clear drush
 drush -v pdfjs-plugin
 drush -v iabookreader-plugin
 drush -v colorbox-plugin
 drush -v openseadragon-plugin
 drush -v -y en islandora_openseadragon
 drush -v -y en redirect
# After last drush call from root user, change cache permissions
# sudo chown -R $USER "$HOME_DIR"/.drush
