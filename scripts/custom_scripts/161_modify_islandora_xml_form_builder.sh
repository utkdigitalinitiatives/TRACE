#!/usr/bin/env bash

# This script clones and and replaces the islandora_xml_forms's TabPanel include
echo "Checking for an islandora_xml_forms repository"

cd "$HOME_DIR" || exit
if [ ! -d "$HOME_DIR"/islandora_xml_forms ]; then
  echo "Cloning utkdigitalinitiatives/islandora_xml_forms"
  git clone https://github.com/utkdigitalinitiatives/islandora_xml_forms
  chown -hR vagrant:vagrant islandora_xml_forms
else
  cd islandora_xml_forms || exit
  echo "Updating the UTK islandora_xml_forms repository"
  git pull origin 7.x
fi

# update the TabPanel.inc
echo "Replacing the TabPanel.inc"
sudo cp "$HOME_DIR"/islandora_xml_forms/elements/includes/TabPanel.inc /var/www/drupal/sites/all/modules/islandora_xml_forms/elements/includes
sudo chown -hR vagrant:vagrant /var/www/drupal/sites/all/modules/islandora_xml_forms
