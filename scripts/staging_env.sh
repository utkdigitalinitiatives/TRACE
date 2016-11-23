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

# CAS Setup
cd "$DRUPAL_HOME"/sites/all/libraries/ || exit
sudo curl https://developer.jasig.org/cas-clients/php/current/CAS-1.3.4.tgz | tar -xz
mv CAS-* CAS

cd "$DRUPAL_HOME"/sites/all/modules/ || exit
sudo curl https://ftp.drupal.org/files/projects/cas-7.x-1.5.tar.gz | tar -xz
# Alert! This is an recurring issue and is corrected in previous scripts
sudo chmod -R 777 /home/vagrant/.drush/

drush -y en cas

# Drush vsets
drush vset -y cas_debugfile ''
drush vset -y cas_domain ''
drush vset -y cas_exclude 'services/*'
drush vset -y cas_first_login_destination 'user'
drush vset -y cas_hide_email 1
drush vset -y cas_hide_password 1
drush vset -y cas_login_drupal_invite 'Cancel UTK login'
drush vset -y cas_login_form '0'
drush vset -y cas_login_invite 'Deposit & Manage Submissions'
drush vset -y cas_login_message ''
drush vset -y cas_login_redir_message ''
drush vset -y cas_logout_destination '/user'
drush vset -y cas_pages ''
drush vset -y cas_pgtformat 'plain'
drush vset -y cas_pgtpath ''
drush vset -y cas_port '443'
drush vset -y cas_proxy 0
drush vset -y cas_proxy_list ''
drush vset -y cas_registerURL ''
drush vset -y cas_server 'casdev.tennessee.edu'
drush vset -y cas_uri '/cas'
drush vset -y cas_user_register 1
drush vset -y cas_version '3.0'
