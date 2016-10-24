#!/usr/bin/env bash

#Add to the block_role table, a module, delta and role_id that will restrict the default navigation menu to administrator.
#currently the values would be system | navigation | 3 ;
#The role Id should be queried from the role table for the name 'administrator'
cd "$DRUPAL_HOME"

drush sql-query <<SQL_INSERT_BLOCK_ROLE_ADMIN_NAVIGATION
insert into block_role (rid, module, delta)
select rid, 'system', 'navigation'
from role where name like 'administrator';
SQL_INSERT_BLOCK_ROLE_ADMIN_NAVIGATION

#Create simpler user navigation menu for any other authenticated user
#if drush extras does not exist then 
drush dl drush_extras
#confirm if drush exists
drush en -y drush_extras
drush menu-create menu-default-navigation "Navigation" "The Default Navigation for authenticated Users"
drush add-menu-item menu-default-navigation "Trace Collections" "islandora"
drush add-menu-item menu-default-navigation "My Bookmarks" islandora-bookmark

drush sql-query <<SQL_INSERT_BLOCK_ROLE
insert into block_role (rid, module, delta)
select rid, 'menu', 'menu-default-navigation'
from role where name in ( 'authUser-role', 'manager-role', 'privUser-role');
SQL_INSERT_BLOCK_ROLE

drush sql-query <<SQL_UPPDATE_DEFAULT_MENU_REGION
update block set region = 'sidebar_first' where module = 'menu' and delta = 'menu-default-navigation' and theme = 'UTKdrupal';
SQL_UPPDATE_DEFAULT_MENU_REGION

#The user menu does not show up in any content area .
#update the block table such that any table row with a module and delta of 'system', 'user-menu' such that the region is 'content'

drush sql-query <<SQL_UPDATE_USER_MENU_REGION
update block set region = 'sidebar_first' where module = 'system' and delta = 'user-menu' and theme = 'UTKdrupal';
SQL_UPDATE_USER_MENU_REGION

drush block-disable --module=system --delta=powered-by
