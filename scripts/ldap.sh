#!/usr/bin/env bash

## add the simple ldap module
## requires that php5-ldap be added to the base box previously.
cd "$DRUPAL_HOME"/sites/all/modules || exit
# check for simple ldap already being installed
drush dl simple_ldap
# enable parts of ldap
drush -y -u 1 pm-enable simple_ldap
drush -y -u 1 pm-enable simple_ldap_user
## set up ldap options

## ldap-server
drush eval "variable_set('simple_ldap_host', 'ldap://ldap.utk.edu')"
drush eval "variable_set('simple_ldap_port', '636')"
drush eval "variable_set('simple_ldap_readonly',1)"
drush eval "variable_set('simple_ldap_starttls',0)"
drush eval "variable_set('simple_ldap_basedn', 'dc=tennessee, dc=edu')"
## ldap-user
drush eval "variable_set('simple_ldap_user_basedn', 'dc=tennessee, dc=edu')"
drush eval "variable_set('simple_ldap_user_scope', 'sub')"
drush eval "variable_set('simple_ldap_user_filter', '')"
drush eval "variable_set('simple_ldap_user_objectclass', 'inetuser')"
drush eval "variable_set('simple_ldap_user_objectclass', 'inetorgperson')"
drush eval "variable_set('simple_ldap_user_attribute_name', 'uid')"
drush eval "variable_set('simple_ldap_user_attribute_mail', 'mail')"
#drush eval "variable_set('simple_ldap_user_source', 'ldap')"
