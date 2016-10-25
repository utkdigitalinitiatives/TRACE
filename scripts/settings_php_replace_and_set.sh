#!/usr/bin/env bash

/**
 * @file for string replacement
 * Concatenate to /var/www/drupal/sites/default/settings.php
 */

# Setup SSH keys manually so the next step is possible
# ssh -p 2222 vagrant@localhost 'cat >> ~/.ssh/authorized_keys' < ~/.ssh/id_*.pub

# Runs this script ssh command from the cron job
# ssh -p 2222 vagrant@localhost 'bash -s' < scripts/settings_php_replace_and_set.sh

# Sends base_url to settings.php
echo "\$base_url='http://dlhost1.lib.utk.edu'; " | sudo bash -c "cat >> /var/www/drupal/sites/default/settings.php"

# For security reasons this is set to read and execute
sudo chmod 555 /var/www/drupal/sites/default/settings.php
