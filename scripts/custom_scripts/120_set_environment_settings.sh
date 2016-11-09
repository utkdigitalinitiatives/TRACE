#!/usr/bin/env bash

# Change permissions to edit
sudo chmod 777 /var/www/drupal/sites/default/settings.php

# Sets string replacement
sudo bash -c 'cat /vagrant/files/string_replacement >> /var/www/drupal/sites/default/settings.php'

# Change permissions back
sudo chmod 555 /var/www/drupal/sites/default/settings.php

cd /var/www/drupal || exit

drush vset site_mail dlcontact@utk.edu
php -r "print json_encode(array('dlcontact@utk.edu'));" | drush vset --format=json update_notify_emails -
drush vset site_default_country US
drush vset site_frontpage 'home'
drush vset date_default_timezone 'America/New_York'
