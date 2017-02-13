#!/usr/bin/env bash

# Change permissions to edit
sudo chmod 777 "$DRUPAL_HOME"/sites/default/settings.php

# Sets string replacement
sudo bash -c 'cat /vagrant/files/string_replacement >> /var/www/drupal/sites/default/settings.php'

# Change permissions back
sudo chmod 555 "$DRUPAL_HOME"/sites/default/settings.php

cd "$DRUPAL_HOME" || exit

drush -y vset site_mail dlcontact@utk.edu
php -r "print json_encode(array('dlcontact@utk.edu'));" | drush vset --format=json update_notify_emails -
drush -y vset site_default_country US
#drush -y vset site_frontpage 'home'
drush -y vset date_default_timezone 'America/New_York'
drush -y vset site_slogan "TRACE: Tennessee Research and Creative Exchange"
drush -y vset site_name "TRACE"

# Set Default Drush Root
cd "$HOME_DIR"/.drush || exit
touch drushrc.php
echo '<?php' >> drushrc.php
echo '$options["uri"] = "localhost";' >> drushrc.php
echo '$options["root"] = "'"$DRUPAL_HOME"'";' >> drushrc.php
