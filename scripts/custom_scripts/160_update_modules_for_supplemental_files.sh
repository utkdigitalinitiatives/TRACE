#!/usr/bin/env bash

# This script clones and and replaces the islandora_scholar's pdf_upload.form
echo "Checking for an islandora_scholar repository"

cd "$HOME_DIR" || exit

# Committing this with CoB/islandora_scholar as a temporary starting point, until
# changes are incorporated into utkdigitalinitiatives
if [ ! -d "$HOME_DIR"/islandora_scholar ]; then
	echo "Cloning utkdigitalinitiatives/islandora_scholar"
	git clone https://github.com/utkdigitalinitiatives/islandora_scholar
	chown -hR vagrant:vagrant islandora_scholar
else
	cd islandora_scholar || exit
	echo "Updating the islandora_scholar repository"
	git pull origin 7.x
fi

# update the pdf_upload.form.inc
echo "Replacing the pdf_upload.form.inc"
sudo cp "$HOME_DIR"/islandora_scholar/includes/pdf_upload.form.inc /var/www/drupal/sites/all/modules/islandora_scholar/includes/

echo "Changing ownership of the pdf_upload.form"
sudo chown -hR vagrant:vagrant /var/www/drupal/sites/all/modules/islandora_scholar/includes

# Address Php Strict Warning Message with Google MetaTags
echo "Grabbing Code to Address Islandora Google Meta Tags Strict Warning Message"
sudo cp "$HOME_DIR"/islandora_scholar/modules/islandora_google_scholar/islandora_google_scholar.module /var/www/drupal/sites/all/modules/islandora_scholar/islandora_google_scholar/
sudo chown -hR vagrant:vagrant /var/www/drupal/sites/all/modules/islandora_scholar/islandora_google_scholar/

# This script clones and and replaces the islandora_binary object
echo "Checking for an islandora binary object repository"

cd "$HOME_DIR" || exit

if [ ! -d "$HOME_DIR"/islandora_binary_object ]; then
	#echo "Cloning utkdigitalinitiatives/islandora_scholar"
	echo "Cloning utkdigitalinitiatives/islandora_binary_object"
	#git clone https://github.com/utkdigitalinitiatives/islandora_scholar
	git clone https://github.com/utkdigitalinitiatives/islandora_binary_object
	chown -hR vagrant:vagrant islandora_binary_object
else
	cd islandora_binary_object || exit
	echo "Updating the islandora_binary_object repository"
	git pull origin 7.x
fi

# update default files
echo "Replacing the Default Discovery Garden Binary Object Files"
sudo cp "$HOME_DIR"/islandora_binary_object/includes/binary_object_upload.form.inc /var/www/drupal/sites/all/modules/islandora_binary_object/includes/
sudo cp "$HOME_DIR"/islandora_binary_object/theme/theme.inc /var/www/drupal/sites/all/modules/islandora_binary_object/theme/
sudo cp "$HOME_DIR"/islandora_binary_object/theme/islandora-binary-object.tpl.php /var/www/drupal/sites/all/modules/islandora_binary_object/theme/


echo "Changing ownership of the pdf_upload.form"
sudo chown -hR vagrant:vagrant /var/www/drupal/sites/all/modules/islandora_binary_object