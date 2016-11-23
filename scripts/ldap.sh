#!/usr/bin/env bash
# set timezone
sudo rm /etc/localtime
sudo ln -s /usr/share/zoneinfo/America/New_York /etc/localtime
# slapd has to be not running for drupal ldap to work
# sudo service slapd stop
#
## add the simple ldap module
## requires that php5-ldap be added to the base box previously.
cd "$DRUPAL_HOME"/sites/all/modules || exit
# check for simple ldap already being installed
# drush dl simple_ldap
# enable parts of ldap
# drush -y -u 1 pm-enable simple_ldap
# this makes added test logins blocked if enabled
#drush -y -u 1 pm-enable simple_ldap_user
## set up ldap options

## ldap-server
# drush eval "variable_set('simple_ldap_host', 'ldap://ldap.utk.edu')"
# drush eval "variable_set('simple_ldap_port', '636')"
# drush eval "variable_set('simple_ldap_readonly',1)"
# drush eval "variable_set('simple_ldap_starttls',0)"
# drush eval "variable_set('simple_ldap_basedn', 'dc=tennessee, dc=edu')"
# ## ldap-user
# drush eval "variable_set('simple_ldap_user_basedn', 'dc=tennessee, dc=edu')"
# drush eval "variable_set('simple_ldap_user_scope', 'sub')"
# drush eval "variable_set('simple_ldap_user_filter', '')"
# #drush eval "variable_set('simple_ldap_user_objectclass', 'inetuser')"
# #drush eval "variable_set('simple_ldap_user_objectclass', 'inetorgperson')"
# # try defaulting to the above then set the below
# drush eval "variable_set('simple_ldap_user_attribute_name', 'uid')"
# drush eval "variable_set('simple_ldap_user_attribute_mail', 'mail')"
# #drush eval "variable_set('simple_ldap_user_source', 'ldap')"
