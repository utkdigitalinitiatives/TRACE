#!/usr/bin/env bash


# ** add a userA and a userB to users in authuser role
# adds all of the pieces of the authUser user: user, role, and permissions

## check for and create the user, if the user doesn't exist
drush -r "$DRUPAL_HOME" user-information authUser 2>&1 | grep '\[error\]' && drush -r "$DRUPAL_HOME" user-create authUser --mail="vagrant+authUser@localhost.com" --password="authUser" && echo "Created authUser user" || echo "The authUser account already exists"

drush -r "$DRUPAL_HOME" user-information userA 2>&1 | grep '\[error\]' && drush -r "$DRUPAL_HOME" user-create userA --mail="vagrant+userA@localhost.com" --password="userA" && echo "Created userA user" || echo "The userA account already exists"
drush -r "$DRUPAL_HOME" user-information userB 2>&1 | grep '\[error\]' && drush -r "$DRUPAL_HOME" user-create userB --mail="vagrant+userB@localhost.com" --password="userB" && echo "Created userB user" || echo "The userB account already exists"

## check for and create role, if the role doesn't exist
# shellcheck disable=SC2015
drush -r "$DRUPAL_HOME" role-list | grep -o 'authUser-role' && echo "authUser-role exists" || drush -r "$DRUPAL_HOME" role-create 'authUser-role'

## add authUser permissions
declare -a AUTH_USER_PERMS=(
  "view fedora repository objects"
  "ingest fedora objects"
  "add fedora datastreams"
  "replace a datastream with new content, preserving version history"
  "edit fedora metadata"
  "view old datastream versions"
  "search islandora solr"
)


# iterate over the list of permissions and verify that they're added
drush_authUser_role_perm_check() {
  echo "Verifying authUser-role permissions..."
  for i in "${AUTH_USER_PERMS[@]}"
  do
    drush -r "$DRUPAL_HOME" role-add-perm 'authUser-role' "$i"
  done
}

drush_authUser_role_perm_check

## assign authUser-role to users
drush -r "$DRUPAL_HOME" user-add-role 'authUser-role' authUser,userA,userB

## add utk_reflector module for user perm separation
cd "$DRUPAL_HOME"/sites/all/modules || exit
git clone https://github.com/pc37utn/utk_reflector
#---------------------------------------
# change to branch TRAC-849
#---------------------------------------
cd utk_reflector
git fetch
git pull --all
git checkout TRAC-849
cd ..
echo "change branch to utk_reflector(TRAC-849)"
#---------------------------------------

drush en -y flvc_policy_reflector
