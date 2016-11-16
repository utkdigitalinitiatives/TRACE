#!/usr/bin/env bash

# *** commented out until an advisor role is needed
# adds an advisor-role and appropriate permissions

## check for and create the role if it does not exist
## shellcheck disable=SC2015
#drush -r /var/www/drupal/ role-list | grep -o 'advisor-role' && echo "advisor-role exists" || drush -r /var/www/drupal/ role-create 'advisor-role'

## add advisor-role permissions
#declare -a ADVISOR_PERMS=(
#	"view fedora repository objects"
#	"search islandora solr"
#	"ingest fedora objects"
#	"use islandora_bookmark"
#	"share islandora bookmarks"
#	"export islandora bookmarks"
#	"can embargo owned objects"
#)

## iterate over the list of permissions and verify that they're added
#drush_advisor_role_perm_check() {
#	echo "Verifying advisor-role permissions..."
#	for i in "${ADVISOR_PERMS[@]}"
#	do
#		drush -r /var/www/drupal/ role-add-perm 'advisor-role' "$i"
#	done
#}

# execute!
#drush_advisor_role_perm_check

## we aren't automatically assigning this role to a given user right now
