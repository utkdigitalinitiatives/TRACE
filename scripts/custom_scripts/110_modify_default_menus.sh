#!/usr/bin/env bash

#Add to the block_role table, a module, delta and role_id that will restrict the default navigation menu to administrator.
#currently the values would be system | navigation | 3 ;
#The role Id should be queried from the role table for the name 'administrator'
cd "$DRUPAL_HOME"
#cd "/var/www/drupal"

#display the title of the menu as 'Admin Menu' in instead of 'Navigation'
drush sql-query "update block set title='Admin Menu' where module = 'system' and delta = 'navigation'"

#limit to administators who can see the 'Admin Menu'
drush sql-query "insert into block_role (rid, module, delta) select rid, 'system', 'navigation' from role where name = 'administrator'"

#when in the administration menu screen, show the title of the menu as Admin Navigation
drush sql-query "update menu_custom set title = 'Admin Navigation' where menu_name = 'navigation'"

#Change the display name of 'Islandora Repository' to 'Trace Collections'
drush sql-query "update menu_links set link_title='Trace Collections' where menu_name = 'navigation' and link_path = 'islandora' and link_title = 'Islandora Repository'"

#The user-menu should only be shown to logged in users, but not administrator (or authenticated)
drush sql-query "insert into block_role (rid, module, delta) select rid, 'system', 'user-menu' from role where name in ( 'authUser-role', 'manager-role', 'privUser-role')"

#Change the display name of 'Islandora Repository' to 'Trace Collections'
drush sql-query "update menu_router set title = 'Trace Collections' where path= 'islandora'"


#if drush extras does not exist then 
if [ ! -d $HOME/.drush/drush_extras ]; then
  drush dl drush_extras
fi

# add in a new menu that will show a link for navigation to the Trace Collections
if drush menu-create menu-trace-navigation --title="Trace Navigation" --description="Navigation to the Trace Collections"; then
	drush add-menu-item menu-trace-navigation "Trace Collections" islandora
	drush block-configure --theme="UTKdrupal" --module="menu" --delta="menu-trace-navigation" --region="sidebar_first"
	# do not display the block title because it looks messy
	drush sql-query "update block set title='<none>' where module = 'menu' and delta = 'menu-trace-navigation'"
	# do not show this link to administrators since it is duplicate information and is messy
	drush sql-query "insert into block_role (rid, module, delta) select rid, 'menu', 'menu-trace-navigation' from role where name in ( 'anonymous user', 'authUser-role', 'manager-role', 'privUser-role')"
#	
fi


#update the block table such that any table row with a module and delta of 'system', 'user-menu' such that the region is 'content'

#The user menu should show up in the sidebar.
drush block-configure --theme="UTKdrupal" --module="system" --delta="user-menu" --region="sidebar_first"
drush add-menu-item user-menu "My Bookmarks" islandora-bookmark

#get rid of the powered by block
drush block-disable --module=system --delta=powered-by
