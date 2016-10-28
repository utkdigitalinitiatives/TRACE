#!/usr/bin/env bash

/**
 * @file for string replacement
 * Concatenate to /var/www/drupal/sites/default/settings.php
 */

# Sends base_url to settings.php
sudo bash -c 'cat /vagrant/files/string_replacement >> /var/www/drupal/sites/default/settings.php'

# Log that is ran
echo "Set settings.php Script Ran" >> ../time.log
