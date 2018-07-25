#!/usr/bin/env bash

## this shell script clones a repository and updates the mods_to_dc stylesheets that are scattered around our $DRUPAL_HOME

echo "Checking for the utk-mods-to-dc repository"

cd "$HOME_DIR" || exit
if [ ! -d "$HOME_DIR"/utk-mods-to-dc ]; then
	echo "Cloning utk-mods-to-dc"
	git clone https://github.com/utkdigitalinitiatives/utk-mods-to-dc
	chown -hR vagrant:vagrant utk-mods-to-dc
else
	cd utk-mods-to-dc || exit
	echo "Updating the utk-mods-to-dc repository"
	git pull
fi

# update the modules
echo "Replacing the old mods_to_dc stylesheets"
sudo cp "$HOME_DIR"/utk-mods-to-dc/institutional-repository/mods_to_dc.xsl /var/www/drupal/sites/all/modules/islandora_xml_forms/builder/transforms/mods_to_dc.xsl
sudo chown -hR vagrant:vagrant /var/www/drupal/sites/all/modules/islandora_xml_forms

sudo cp "$HOME_DIR"/utk-mods-to-dc/institutional-repository/mods_to_dc.xsl /var/www/drupal/sites/all/modules/islandora_batch/transforms/mods_to_dc.xsl
sudo chown -hR vagrant:vagrant /var/www/drupal/sites/all/modules/islandora_batch

sudo cp "$HOME_DIR"/utk-mods-to-dc/institutional-repository/mods_to_dc.xsl /var/www/drupal/sites/all/modules/islandora_importer/xsl/mods_to_dc.xsl
sudo chown -hR vagrant:vagrant /var/www/drupal/sites/all/modules/islandora_importer