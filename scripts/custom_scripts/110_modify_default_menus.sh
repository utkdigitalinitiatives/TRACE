#!/usr/bin/env bash

#Add to the block_role table, a module, delta and role_id that will restrict the default navigation menu to administrator.
#currently the values would be system | navigation | 3 ;
#The role Id should be queried from the role table for the name 'administrator'
cd "$DRUPAL_HOME"

#when in the administration menu screen, show the title of the menu as Admin Navigation
drush sql-query "update menu_custom set title = 'Admin Navigation' where menu_name = 'navigation'"

#Change the display name of 'Islandora Repository' to 'Trace Collections'
drush sql-query "update menu_links set link_title='Trace Collections' where menu_name = 'navigation' and link_path = 'islandora' and link_title = 'Islandora Repository'"

#drush sql-query "update menu_links set hidden = 1 where menu_name = 'navigation' and link_path = 'islandora' and link_title = 'Islandora Repository'"

#Change the display name of 'Islandora Repository' to 'Trace Collections'
drush sql-query "update menu_router set title = 'Trace Collections' where path= 'islandora'"

#Change Islandora Bookmarks to the user menu

drush sql-query "update menu_links set menu_name = 'user-menu' where menu_name='navigation' and link_title='My bookmarks'"

#if drush extras does not exist then
if [ ! -d $HOME/.drush/drush_extras ]; then
  drush dl drush_extras
fi

#Add the Submit link into the 'User Menu'
drush add-menu-item --weight='9' user-menu 'Submit' 'islandora/object/utk.ir:td/manage/overview/ingest'

#add in a manager menu with a link to the approve-inactive-objects list
if drush menu-create menu-manager-navigation --title="Manager Navigation" --description="Manager Links"; then
	drush add-menu-item menu-manager-navigation "Items Waiting for Approval" "admin/islandora/tools/simple_workflow/list"
	drush block-configure --theme="UTKdrupal" --module="menu" --delta="menu-manager-navigation" --region="sidebar_first"
	# do not display the block title because it looks messy
	drush sql-query "update block set title='<none>' where module = 'menu' and delta = 'menu-manager-navigation'"
	# do not show this link to administrators since it is duplicate information and is messy
	drush sql-query "insert into block_role (rid, module, delta) select rid, 'menu', 'menu-manager-navigation' from role where name LIKE '%manager%'"
fi

#drush sql-query "update menu_links set weight = 9 where menu_name = 'user-menu' and link_title = 'Submit'"
#, link_path, weight) select ('user-menu', 'Submit', 'http://localhost:8000/islandora/object/utk.ir%3Atd#overlay=islandora/object/utk.ir%253Atd/manage/overview/ingest','9')"


# add in a new menu that will show a link for navigation to the Trace Collections
#if drush menu-create menu-trace-navigation --title="Trace Navigation" --description="Navigation to the Trace Collections"; then
#	drush add-menu-item menu-trace-navigation "Collections" islandora
#	drush block-configure --theme="UTKdrupal" --module="menu" --delta="menu-trace-navigation" --region="sidebar_first"
#	# do not display the block title because it looks messy
#	drush sql-query "update block set title='<none>' where module = 'menu' and delta = 'menu-trace-navigation'"
#	drush sql-query "insert into block_role (rid, module, delta) select rid, 'menu', 'menu-trace-navigation' from role where name in ( 'anonymous user', 'authUser-role', 'manager-role', 'privUser-role')"

#fi

#drush add-menu-item user-menu "My Bookmarks" islandora-bookmark

#drush sql-query "delete from menu_links where menu_name='navigation' and module = 'system' and link_title='My bookmarks'"

