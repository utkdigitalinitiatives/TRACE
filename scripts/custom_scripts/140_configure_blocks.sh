#!/usr/bin/env bash

#display the title of the menu as 'Admin Menu' in instead of 'Navigation'
drush sql-query "update block set title='<none>' where module = 'system' and delta = 'navigation'"
drush sql-query "update block set title='<none>' where module = 'system' and delta = 'user-menu'"
drush sql-query "update block set title='<none>' where module = 'system' and delta = 'user-menu'"
drush sql-query "update block set title='<none>' where module = 'user' and delta = 'login'"
drush sql-query "update block set title='<none>' where module = 'privatemsg' and delta = 'privatemsg-menu'"
drush sql-query "update block set title='<none>' where module = 'menu' and delta = 'trace-navigation'"

#limit to administators who can see the 'Admin Menu'
drush sql-query "insert into block_role (rid, module, delta) select rid, 'system', 'navigation' from role where name = 'administrator'"

# use solr simple search as the search text on the left side bar
drush block-configure --theme="UTKdrupal" --module="islandora_solr" --delta="simple" --region="sidebar_first"
#set the home page to display nested collections
drush block-configure --theme="UTKdrupal" --module="islandora_nested_collections" --delta="nested_collections_list" --region="content"
# do not display the block title because it looks messy
drush sql-query "update block set title='<none>' where module = 'islandora_solr' and delta = 'simple' and theme = 'UTKdrupal'"

#The user-menu should only be shown to logged in users, but not administrator (or authenticated)
drush sql-query "insert into block_role (rid, module, delta) select rid, 'system', 'user-menu' from role where name = 'authenticated user'"

drush sql-query "insert into block_role (rid, module, delta) select rid, 'privatemsg', 'privatemsg-menu' from role where name = 'authenticated user'"

drush block-configure --weight=2 --theme="UTKdrupal" --module="system" --delta="user-menu" --region="sidebar_first"
drush block-configure --weight=4 --theme="UTKdrupal" --module="menu" --delta="trace-navigation" --region="sidebar_first"

#get rid of the powered by block
drush block-disable --module=system --delta=powered-by
drush block-disable --module=search --delta=form
drush block-disable --module=user --delta=login
#drush php-script example --script-path=${SHARED_DIR}/path/to/scripts

# bootstrap themes and block enough to succesfully build and submit block
# settings form.
# drupal_theme_initialize();
# $my_theme = 'UTKdrupal'
# module_load_include('inc', 'block', 'block.admin');
# $blocks = _block_rehash($my_theme);
##Enable Solr Search block
# $form_state['values']['blocks']['islandora_solr_simple'] =
    # array(
	  # 'region' => 'sidebar_first',
	  # 'theme'  => $my_theme,
	  # 'weight' => 0,
	  # 'title' => '<none>',
	  # );
##Disable default search block
# $form_state['values']['blocks']['search_form'] =
    # array(
	  # 'region' => BLOCK_REGION_NONE,
	  # 'theme'  => $my_theme,
	  # 'weight' => 0,
	  # );
##Apply new settings
# drupal_form_submit('block_admin_display_form', $form_state, $blocks, $my_theme);
# drupal_flush_all_caches();
