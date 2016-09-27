#!/usr/bin/env bash

# adds all of the pieces of the manager user: user, role, and permissions

## check for and create the user, if the user doesn't exist
drush -r /var/www/drupal/ user-information manager 2>&1 | grep '\[error\]' && drush -r /var/www/drupal/ user-create manager --mail="manager-person@example.com" --password="manager" && echo "Created manager user" || echo "The manager user already exists"

## check for role and create role, if the role doesn't exist
drush -r /var/www/drupal/ role-list | grep -o 'manager-role' && echo "manager-role exists" || drush -r /var/www/drupal/ role-create 'manager-role'

## add islandora module permissions
declare -a MANAGER_PERMS=(
	"access toolbar"
	"access user profiles" #user
	"ingest fedora objects" #islandora
	"add fedora datastreams" #islandora
	"administer users" #user
	"create child collection" #islandora_collection
	"edit fedora metadata" #islandora
	"manage collection policy" #islandora_collection
	"manage object properties" #islandora
	"migrate collection members" #islandora_collection
	"regenerate derivatives for an object" #islandora
	"replace a datastream with new content, preserving version history" #islandora
	"view old datastream versions" #islandora
	"view fedora repository objects" #islandora
	"search islandora solr"
	"bypass inactive object state"
	"manage inactive objects"
	"export islandora bookmarks"
	"share islandora bookmarks"
	"use islandora_bookmark"
	"can embargo any object"
)

# iterate over the list of permissions and verify that they're added
drush_manager_role_perm_check() {
	echo "Verifying manager-role permissions..."
	for i in "${MANAGER_PERMS[@]}"
	do
		drush -r /var/www/drupal/ role-add-perm 'manager-role' "$i"
	done
}

drush_manager_role_perm_check

## assign manager-role to manager user; no need for a check as
## you can assign the same role to the same user as many times
## as your heart desires. <3
drush -r /var/www/drupal/ user-add-role 'manager-role' manager
