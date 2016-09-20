#!/usr/bin/env bash

echo "Installing all Islandora Foundation module's required libraries"

cd "$DRUPAL_HOME"/sites/all/modules || exit

sudo drush cache-clear drush
sudo drush -v videojs-plugin
sudo drush -v pdfjs-plugin
sudo drush -v iabookreader-plugin
sudo drush -v colorbox-plugin
sudo drush -v openseadragon-plugin
sudo drush -v -y en islandora_openseadragon

# After last drush call from root user, change cache permissions
sudo chown -R vagrant:vagrant "$HOME_DIR"/.drush
