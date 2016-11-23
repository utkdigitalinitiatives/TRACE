#!/usr/bin/env bash

# adds all of the pieces of the manager user: user, role, and permissions

## check for and create the user, if the user doesn't exist
drush -r $DRUPAL_HOME user-information manager 2>&1 | grep '\[error\]' && drush -r $DRUPAL_HOME user-create manager --mail="manager-person@example.com" --password="manager" && echo "Created manager user" || echo "The manager user already exists"

## check for role and create role, if the role doesn't exist
# shellcheck disable=SC2015
drush -r $DRUPAL_HOME role-list | grep -o 'manager-role' && echo "manager-role exists" || drush -r $DRUPAL_HOME role-create 'manager-role'

## add islandora module permissions
declare -a MANAGER_PERMS=(
	"view fedora repository objects" #islandora
	"search islandora solr"
	"ingest fedora objects" #islandora
	"add fedora datastreams" #islandora
	"replace a datastream with new content, preserving version history" #islandora
	"view old datastream versions" #islandora
	"revert to old datastream"
	"use islandora_bookmark"
	"share islandora bookmarks"
	"export islandora bookmarks"
	"edit fedora metadata" #islandora
	"view technical metadata"
	"administer users" #user
	"create child collection" #islandora_collection
	"manage collection policy" #islandora_collection
	"manage object properties" #islandora
	"migrate collection members" #islandora_collection
	"regenerate derivatives for an object" #islandora
	"bypass inactive object state" #simple_workflow
	"manage inactive objects"  #simple_workflow
	"can embargo any object"
	"access user profiles" #user
	"administer users"  #user
	"access toolbar"
	"view the administration theme"
	"access administration pages" #system
	"view islandora usage stats reports"
	"view islandora usage stats collection overview stats"
)

# iterate over the list of permissions and verify that they're added
drush_manager_role_perm_check() {
	echo "Verifying manager-role permissions..."
	for i in "${MANAGER_PERMS[@]}"
	do
		drush -r $DRUPAL_HOME role-add-perm 'manager-role' "$i"
	done
}

drush_manager_role_perm_check

## assign manager-role to manager user; no need for a check as
## you can assign the same role to the same user as many times
## as your heart desires. <3
drush -r $DRUPAL_HOME user-add-role 'manager-role' manager
