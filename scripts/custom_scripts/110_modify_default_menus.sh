#!/usr/bin/env bash

#Add to the block_role table, a module, delta and role_id that will restrict the default navigation menu to administrator.
#currently the values would be system | navigation | 3 ;
#The role Id should be queried from the role table for the name 'administrator'
cd "$DRUPAL_HOME"

drush sql-query "insert into block_role (rid, module, delta) select rid, 'system', 'navigation' from role where name like 'administrator'"

#Create simpler user navigation menu for any other authenticated user
#if drush extras does not exist then 
if [ ! -d $HOME/.drush/drush_extras ]; then
  drush dl drush_extras
fi

drush sql-query "update menu_custom set title='Admin Navigation' where menu_name like 'navigation'"

#confirm if drush exists
if drush menu-create menu-default-navigation --title="Navigation" --description="The Default Navigation for authenticated Users"; then
	drush add-menu-item menu-default-navigation --title="Trace Collections" --path="islandora"
	drush add-menu-item menu-default-navigation --title="My Bookmarks" --path="islandora-bookmark"
fi

drush sql-query "insert into block_role (rid, module, delta) select rid, 'menu', 'menu-default-navigation' from role where name in ( 'authUser-role', 'manager-role', 'privUser-role')"

drush block-configure --theme=UTKdrupal --module=menu --delta=menu-default-navigation --region=sidebar_first
drush block-configure --theme=bartik --module=menu --delta=menu-default-navigation --region=sidebar_first
#The user menu does not show up in any content area .
#update the block table such that any table row with a module and delta of 'system', 'user-menu' such that the region is 'content'

drush block-configure --theme=UTKdrupal --module=system --delta=user-menu --region=sidebar_first
drush block-configure --theme=bartik --module=system --delta=user-menu --region=sidebar_first
drush block-disable --module=system --delta=powered-by
