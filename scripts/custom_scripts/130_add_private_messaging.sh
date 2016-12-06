#!/usr/bin/env bash

# This adds Private Messaging to TRACE
# Installs Privatemsg (https://www.drupal.org/project/privatemsg)
# & Real Name (https://www.drupal.org/project/realname)
cd "$DRUPAL_HOME"/ || exit

drush -y dl realname
drush -y en realname

drush -y dl privatemsg
drush -y en privatemsg
drush -y en pm_block_user pm_email_notify privatemsg_filter privatemsg_limits privatemsg_realname privatemsg_roles privatemsg_rules

drush cc theme-registry
# ---- add permissions for private messages to roles
## add authUser private message permissions
declare -a AUTH_USER_PERMS=(
  "read privatemsg"
  "write privatemsg"
)
# iterate over the list of permissions and verify that they're added
drush_authUser_role_perm_check() {
  echo "Verifying authUser-role private message permissions..."
  for i in "${AUTH_USER_PERMS[@]}"
  do
    drush -r "$DRUPAL_HOME" role-add-perm 'authUser-role' "$i"
  done
}
drush_authUser_role_perm_check

## add coll/thesis manager private message permissions
declare -a COLL_MANAGER_PERMS=(
  "read privatemsg"
  "write privatemsg"
  "read all private messages"
  "bypass recipient message limit"
)
## iterate over the list of permissions and verify that they're added
drush_thesis_manager_role_perm_check() {
  echo "Verifying thesis_manager_role private message permissions..."
  for i in "${COLL_MANAGER_PERMS[@]}"
  do
    drush -r "$DRUPAL_HOME" role-add-perm 'thesis_manager_role' "$i"
  done
}
drush_thesis_manager_role_perm_check

## add manager role private message permissions
declare -a MANAGER_PERMS=(
  "read privatemsg"
  "write privatemsg"
  "read all private messages"
  "bypass recipient message limit"
)

# iterate over the list of permissions and verify that they're added
drush_manager_role_perm_check() {
  echo "Verifying manager-role private message permissions..."
  for i in "${MANAGER_PERMS[@]}"
  do
    drush -r "$DRUPAL_HOME" role-add-perm 'manager-role' "$i"
  done
}
drush_manager_role_perm_check
