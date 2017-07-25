#!/usr/bin/env bash
## set timezone
#sudo rm /etc/localtime
#sudo ln -s /usr/share/zoneinfo/America/New_York /etc/localtime
# Set correct permissions on sites/default/files
chmod -R 775 /var/www/drupal/sites/default/files
