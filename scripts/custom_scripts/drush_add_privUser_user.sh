#!/bin/bash

# adds all of the pieces of the privilegedUser user: user, role, and permissions

## check for and create user, if the user doesn't exist
drush -r /var/www/drupal user-information privUser 2>&1 | grep '\[error\]' && drush -r /var/www/drupal user-create privUser --mail="privileged-person@example.com" --password="privUser" && echo "Created privUser user" || echo "The privUser already exists"

## check for and create role, if the role doesn't exist
drush -r /var/www/drupal/ role-list | grep -o 'privUser-role' && echo "privUser-role exists" || drush -r /var/www/drupal/ role-create 'privUser-role'


