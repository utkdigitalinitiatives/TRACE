#!/usr/bin/env bash

# adds permissions to internal drupal "anonymous user" role


## add anonymous permissions
declare -a ANON_PERMS=(
    "view fedora repository objects"
    "search content"
    "search islandora solr"
)

## iterate over the list of permissions and verify that they're added
drush_anon_role_perm_check() {
    echo "Verifying anonymous user role permissions..."
    for i in "${ANON_PERMS[@]}"
    do
	drush -r /var/www/drupal/ role-add-perm 'anonymous user' "$i"
    done
}

# execute!
drush_anon_role_perm_check

## this role is automatically given to any user that is not logged in
