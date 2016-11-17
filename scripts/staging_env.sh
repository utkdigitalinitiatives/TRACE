#!/usr/bin/env bash

#/**
# * @file for string replacement
# * Concatenate to /var/www/drupal/sites/default/settings.php
# * Set ENV variable first on the server hosting the VM.
# * $ export ENV=staging
# * Or in ~/.bashrc add vagrant='ENV='\''staging'\'' vagrant'
# *
# */

# Log time when this script starts running
echo "Set settings.php Script Ran" >> ../time.log

# Sends base_url to settings.php
sudo bash -c 'cat /vagrant/files/change_base_url >> /var/www/drupal/sites/default/settings.php'

# Activate the SSL Module
# sudo a2enmod ssl
# sudo service apache2 restart
# sudo aptitude install ssl-cert

# Place the CERTS in a folder and set permissions
# sudo mkdir /etc/apache2/ssl
# sudo mkdir /etc/apache2/ssl/private
# cp /vagrant/dlhost1.key /etc/apache2/ssl/private/dlhost1.key
# chmod 600 /etc/apache2/ssl/private/dlhost1.key

# Configure Apache to Use SSL
# yes | cp /vagrant/files/default-ssl.conf /etc/apache2/sites-available/default-ssl.conf

# Required Patch
# cd /vagrant || exit
# curl -O https://www.drupal.org/files/issues/drupal7-fix-simpletest-https-471970-140-7.x.patch
# git apply -v /vagrant/drupal7-fix-simpletest-https-471970-140-7.x.patch


# Activate/Reset the SSL Virtual Host
# cd /etc/apache2/sites-available/ || exit
# sudo a2dissite default-ssl
# sudo a2ensite default-ssl.conf
# sudo service apache2 restart
