#!/usr/bin/env bash

# Sets string replacement
sudo cat /vagrant/files/string_replacement >> /var/www/drupal/sites/default/settings.php

cd /var/www/drupal || exit

drush vset site_mail dlcontact@utk.edu
php -r "print json_encode(array('dlcontact@utk.edu'));" | drush vset --format=json update_notify_emails -

drush vset site_default_country US
