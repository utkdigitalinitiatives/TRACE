#!/usr/bin/env bash

# adds all of the pieces of the collection manager role and user: user, role, and permissions
# this one is for the "thesis_manager" user and the "thesis_manager_role"

## check for and create user, if the user doesn't exist
drush -r /var/www/drupal user-information thesis_manager 2>&1 | grep '\[error\]' && drush -r /var/www/drupal user-create thesis_manager --mail="thesismanager-person@example.com" --password="thesis_manager" && echo "Created thesis_manager user" || echo "The thesis_manager user already exists"

## check for and create role, if the role doesn't exist
# shellcheck disable=SC2015
drush -r /var/www/drupal/ role-list | grep -o 'thesis_manager_role' && echo "thesis_manager_role exists" || drush -r /var/www/drupal/ role-create 'thesis_manager_role'

## add coll manager permissions
declare -a COLL_MANAGER_PERMS=(
	"view fedora repository objects" #islandora
	"add fedora datastreams" #islandora
	"ingest fedora objects" #islandora
	"export islandora bookmarks"
	"share islandora bookmarks"
	"use islandora_bookmark"
	"search islandora solr"
	"bypass inactive object state" #simple_workflow
	"manage inactive objects"  #simple_workflow
	"can embargo owned objects"
	"can embargo any object"
	"access user profiles" #user
	"access toolbar"
	"view the administration theme"
	"access administration pages" #system
	"view islandora usage stats reports"
	"view islandora usage stats collection overview stats"
)

## iterate over the list of permissions and verify that they're added
drush_thesis_manager_role_perm_check() {
	echo "Verifying thesis_manager_role permissions..."
	for i in "${COLL_MANAGER_PERMS[@]}"
	do
		drush -r /var/www/drupal/ role-add-perm 'thesis_manager_role' "$i"
	done
}

drush_thesis_manager_role_perm_check

## assign graduate_thesis_manager_role to graduate_thesis_manager_user user
drush -r /var/www/drupal/ user-add-role 'thesis_manager_role' thesis_manager
