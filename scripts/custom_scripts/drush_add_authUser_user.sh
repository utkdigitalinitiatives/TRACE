#!/usr/bin/env bash

# adds all of the pieces of the authUser user: user, role, and permissions

## check for and create the user, if the user doesn't exist
drush -r /var/www/drupal/ user-information authUser 2>&1 | grep '\[error\]' && drush -r /var/www/drupal/ user-create authUser --mail="authenticated-person@example.com" --password="authUser" && echo "Created authUser user" || echo "The authUser account already exists"

## check for and create role, if the role doesn't exist
drush -r /var/www/drupal/ role-list | grep -o 'authUser-role' && echo "authUser-role exists" || drush -r /var/www/drupal/ role-create 'authUser-role'

## add authUser permissions
declare -a AUTH_USER_PERMS=(
	"view fedora repository objects" #islandora
	"view old datastream versions" #islandora
	"add fedora datastreams" #islandora
	"ingest fedora objects" #islandora
	"replace a datastream with new content, preserving version history" #islandora
	"search islandora solr"
	"export islandora bookmarks"
	"share islandora bookmarks"
	"use islandora_bookmark"
	"can embargo owned objects"
)

# iterate over the list of permissions and verify that they're added
drush_authUser_role_perm_check() {
	echo "Verifying authUser-role permissions..."
	for i in "${AUTH_USER_PERMS[@]}"
	do
		drush -r /var/www/drupal/ role-add-perm 'authUser-role' "$i"
	done
}

drush_authUser_role_perm_check

## assign authUser-role to authUser user
drush -r /var/www/drupal/ user-add-role 'authUser-role' authUser
