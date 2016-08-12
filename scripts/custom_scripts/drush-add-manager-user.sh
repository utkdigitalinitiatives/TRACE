#!/bin/bash

# adds all of the pieces of the manager user: user, role, and permissions

## check for and create the user, if the user doesn't exist
drush -r /var/www/drupal/ user-information manager 2>&1 | grep '\[error\]' && drush -r /var/www/drupal/ user-create manager --mail="manager-person@example.com" --password="manager" && echo "Created manager user" || echo "The manager user already exists"

## check for role and create role, if the role doesn't exist
#drush role-create 'manager-role'
### add islandora module permissions
#drush role-add-perm 'manager-role' 'add fedora datastreams'
#drush role-add-perm 'manager-role' 'ingest fedora objects'
#drush role-add-perm 'manager-role' 'edit fedora metadata'
#drush role-add-perm 'manager-role' 'manage object properties'
#drush role-add-perm 'manager-role' 'regenerate datastreams for an object'
#drush role-add-perm 'manager-role' 'replace a datastream with new content, preserving version history'
#drush role-add-perm 'manager-role' 'view old datastream versions'
#drush role-add-perm 'manager-role' 'view fedora repository objects'
### add islandora_collection module permissions
#drush role-add-perm 'manager-role' 'create child collection'
#drush role-add-perm 'manager-role' 'manage collection policy'
#drush role-add-perm 'manager-role' 'migrate collection members'
### add user module permissions
#drush role-add-perm 'manager-role' 'access user profiles'
#drush role-add-perm 'manager-role' 'administer users'
#
## assign manager-role to manager user
#drush user-add-role 'manager-role' manager