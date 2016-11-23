#!/usr/bin/env bash

# adds all of the pieces of the privilegedUser user: user, role, and permissions

## check for and create user, if the user doesn't exist
drush -r $DRUPAL_HOME user-information privUser 2>&1 | grep '\[error\]' && drush -r $DRUPAL_HOME user-create privUser --mail="privileged-person@example.com" --password="privUser" && echo "Created privUser user" || echo "The privUser already exists"

## check for and create role, if the role doesn't exist
# shellcheck disable=SC2015
drush -r $DRUPAL_HOME role-list | grep -o 'privUser-role' && echo "privUser-role exists" || drush -r $DRUPAL_HOME role-create 'privUser-role'

## add privUser permissions
declare -a PRIV_USER_PERMS=(
	"view fedora repository objects" #islandora
	"add fedora datastreams" #islandora
	"ingest fedora objects" #islandora
	"export islandora bookmarks"
	"share islandora bookmarks"
	"use islandora_bookmark"
	"search islandora solr"
	"can embargo owned objects"
)

## iterate over the list of permissions and verify that they're added
drush_privUser_role_perm_check() {
	echo "Verifying privUser-role permissions..."
	for i in "${PRIV_USER_PERMS[@]}"
	do
		drush -r $DRUPAL_HOME role-add-perm 'privUser-role' "$i"
	done
}

drush_privUser_role_perm_check

## assign privUser-role to privUser user
drush -r $DRUPAL_HOME user-add-role 'privUser-role' privUser
