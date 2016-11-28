#!/usr/bin/env bash

#/**
# * @file for string replacement
# * Concatenate to /var/www/drupal/sites/default/settings.php
# * Set ENV variable first on the server hosting the VM.
# * $ export ENV=staging
# * Or in ~/.bashrc add vagrant='ENV='\''staging'\'' vagrant'
# *
# */

# Alert! This is an recurring issue and is corrected in previous scripts
sudo chmod -R 777 /home/vagrant/.drush/
cd "$DRUPAL_HOME" || exit
drush dl drush_extras

# Log time when this script starts running
echo "Set settings.php Script Ran" >> ../time.log

# Sends base_url to settings.php
sudo bash -c 'cat /vagrant/files/change_base_url >> /var/www/drupal/sites/default/settings.php'

# CAS Setup
cd "$DRUPAL_HOME"/sites/all/libraries/ || exit
sudo curl https://developer.jasig.org/cas-clients/php/current/CAS-1.3.4.tgz | tar -xz
mv CAS-* CAS

cd "$DRUPAL_HOME"/sites/all/modules/ || exit
sudo curl https://ftp.drupal.org/files/projects/cas-7.x-1.5.tar.gz | tar -xz

drush -y en cas

# Drush vsets
drush vset -y cas_debugfile ''
drush vset -y cas_domain ''
drush vset -y cas_exclude 'services/*'
drush vset -y cas_first_login_destination 'user'
drush vset -y cas_hide_email 1
drush vset -y cas_hide_password 1
drush vset -y cas_login_drupal_invite 'Go back to Local Login without NID'
drush vset -y cas_login_form '1'
drush vset -y cas_login_invite 'Login with UT NID'
drush vset -y cas_login_message ''
drush vset -y cas_login_redir_message ''
drush vset -y cas_logout_destination '<front>'
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

# Automatically Issue authUser-role to CAS login Users
php -r "print json_encode(array ( 4 => '4', 2 => true, 3 => 0, 5 => 0, 6 => 0, 7 => 0,));" | drush vset --format=json cas_auto_assigned_role -

# Disable local Account Registrtion
drush vset user_register 0
