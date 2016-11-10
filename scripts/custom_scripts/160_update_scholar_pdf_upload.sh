#!/usr/bin/env bash

# This script clones and and replaces the islandora_scholar's pdf_upload.form
echo "Checking for an islandora_scholar repository"

cd "$HOME_DIR" || exit

if [ ! -d "$HOME_DIR"/islandora_scholar ]; then
	echo "Cloning utkdigitalinitiatives/islandora_scholar"
	git clone https://github.com/utkdigitalinitiatives/islandora_scholar
	chown -hR vagrant:vagrant islandora_scholar
else
	cd islandora_scholar || exit
	echo "Updating the islandora_scholar repository"
	git pull origin master
fi

# update the pdf_upload.form.inc
echo "Replacing the pdf_upload.form.inc"
sudo cp "$HOME_DIR"/islandora_scholar/includes/pdf_upload.form.inc /var/www/drupal/sites/all/modules/islandora_scholar/includes/

echo "Changing ownership of the pdf_upload.form"
sudo chown -hR vagrant:vagrant /var/www/drupal/sites/all/modules/islandora_scholar/includes
