#!/usr/bin/env bash

#Add to the block_role table, a module, delta and role_id that will restrict the default navigation menu to administrator.
#currently the values would be system | navigation | 3 ;
#The role Id should be queried from the role table for the name 'administrator'
cd "$DRUPAL_HOME" || exit

#when in the administration menu screen, show the title of the menu as Admin Navigation
drush sql-query "update menu_custom set title = 'Admin Navigation' where menu_name = 'navigation'"

#Change the display name of 'Islandora Repository' to 'Trace Collections'

drush sql-query "update menu_links set weight=10 where menu_name = 'navigation' and link_path = 'islandora'"

#Change the display name of 'Islandora Repository' to 'Trace Collections'
drush sql-query "update menu_router set title = 'Trace Collections' where path= 'islandora'"

#Change Islandora Bookmarks to the user menu

drush sql-query "update menu_links set menu_name = 'user-menu' where menu_name='navigation' and link_title='My bookmarks'"

#if drush extras does not exist then
# if [ ! -d $HOME/.drush/drush_extras ]; then
#   drush dl drush_extras
# fi

#Add the Submit link into the 'User Menu'

#drush add-menu-item --weight='9' user-menu 'Submit' 'islandora/object/utk.ir:td/manage/overview/ingest'
drush add-menu-item --weight='-1' navigation 'Trace Root Collection' "islandora/object/utk:ir"

#add in a manager menu with a link to the approve-inactive-objects list
if drush menu-create menu-manager-navigation --title="Manager Navigation" --description="Manager Links"; then
	drush add-menu-item menu-manager-navigation "Items Waiting for Approval" "admin/islandora/tools/simple_workflow/list"
	drush add-menu-item menu-manager-navigation 'Trace Root Collection' "islandora/object/utk:ir"
	drush block-configure --theme="UTKdrupal" --module="menu" --delta="menu-manager-navigation" --region="sidebar_first"
	# do not display the block title because it looks messy
	drush sql-query "update block set title='<none>' where module = 'menu' and delta = 'menu-manager-navigation'"
	# do not show this link to administrators since it is duplicate information and is messy
	drush sql-query "insert into block_role (rid, module, delta) select rid, 'menu', 'menu-manager-navigation' from role where name LIKE '%manager%'"
fi

#add in a manager menu with a link to the approve-inactive-objects list
if drush menu-create menu-default-login --title="Trace Login" --description="The default login link for TRACE"; then
	drush add-menu-item menu-default-login 'Login' "user/login"
	drush block-configure --theme="UTKdrupal" --module="menu" --delta="menu-default-login" --region="sidebar_first" --weight=2
	# do not display the block title because it looks messy
	drush sql-query "update block set title='<none>' where module = 'menu' and delta = 'menu-default-login'"
	# do not show this link to administrators since it is duplicate information and is messy
	drush sql-query "insert into block_role (rid, module, delta) select rid, 'menu', 'menu-default-login' from role where name LIKE '%anonymous%'"
fi

# add in a new menu that will show links for navigation at the top of the left bar
if drush menu-create trace-navigation --title="Trace Navigation" --description="Trace Links"; then
	drush  php-script "/vagrant/scripts/custom_scripts/create_pages.php"

fi
