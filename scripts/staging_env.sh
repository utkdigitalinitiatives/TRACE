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

# install mutt to pull in basic email capabilities
if [ -f "/etc/centos-release" ]; then
  sudo yum -y install mutt
else
  sudo apt-get -y install  mutt
fi
# Log time when this script starts running
echo "Set settings.php Script Ran" >> ../time.log

# Sends base_url to settings.php
sudo bash -c 'cat /vagrant/files/change_base_url >> /var/www/drupal/sites/default/settings.php'

# CAS Setup
cd "$DRUPAL_HOME"/sites/all/libraries/ || exit
sudo curl https://developer.jasig.org/cas-clients/php/1.3.5/CAS-1.3.5.tgz | tar -xz
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
drush vset -y cas_login_drupal_invite 'Go back to Local Login without NetID'
drush vset -y cas_login_form '1'
drush vset -y cas_login_invite 'Login with UT NetID'
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
# This is for Staging Server Environment
drush vset -y cas_server 'casdev.tennessee.edu'
# This is for Production Environment
# drush vset -y cas_server 'cas.tennessee.edu'

drush vset -y cas_uri '/cas'
drush vset -y cas_user_register 1
drush vset -y cas_version '3.0'

# Automatically Issue authUser-role to CAS login Users
php -r "print json_encode(array ( 4 => '4', 2 => true, 3 => 0, 5 => 0, 6 => 0, 7 => 0,));" | drush vset --format=json cas_auto_assigned_role -

# Disable local Account Registrtion
drush vset user_register 0

# cas attributes brings NetID, email, staff or student status
drush en -y cas_attributes

drush vset -y cas_attributes_overwrite '1'
drush vset -y cas_attributes_sync_every_login '1'
drush eval "variable_set('cas_attributes_relations', array('name' => '[cas:attribute:uid]', 'mail' => '[cas:attribute:mail]'))"
drush vset -y realname_pattern '[user:cas:name]'

# Notify the user the current TRACE repo branch the when the last refresh
# happened. NOT FOR PRODUCTION
cd /vagrant || exit
branch_name="$(git symbolic-ref --short -q HEAD)"
# shellcheck disable=SC2027
# shellcheck disable=SC2046
# shellcheck disable=SC2116
# shellcheck disable=SC2086
echo "<br/><div><h3>> Git branch is "$(echo $branch_name)"</h3><br/><p>>> Last vagrant <?php echo exec('uptime -p'); ?></p></div><br/><p>>>"$(git -C /vagrant rev-parse HEAD)"</p><br/>" >> /var/www/drupal/sites/all/themes/UTKdrupal/templates/page--front.tpl.php

# Reset to original dirrectory just incase
# shellcheck disable=SC2086
cd $DRUPAL_HOME || exit
