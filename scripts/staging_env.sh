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
sudo a2enmod ssl
sudo service apache2 restart

sudo mkdir /etc/apache2/ssl
cp /vagrant/dlhost1.key /etc/apache2/ssl/dlhost1.key

# Configure Apache to Use SSL
yes | cp /vagrant/files/default-ssl.conf /etc/apache2/sites-available/default-ssl.conf

# Activate the SSL Virtual Host
cd /etc/apache2/sites-available/ || exit
# sudo a2ensite default-ssl.conf
sudo service apache2 restart
