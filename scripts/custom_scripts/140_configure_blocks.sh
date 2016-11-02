#!/usr/bin/env bash

#include Islandora Bookmarks to the user menu
drush add-menu-item user-menu "My Bookmarks" islandora-bookmark

# use solr simple search as the search text on the left side bar
drush block-configure --theme="UTKdrupal" --module="islandora_solr" --delta="simple" --region="sidebar_first"
# do not display the block title because it looks messy
drush sql-query "update block set title='<none>' where module = 'islandora_solr' and delta = 'simple' and theme = 'UTKdrupal'"

drush block-configure --theme="UTKdrupal" --module="system" --delta="user-menu" --region="sidebar_first"
#get rid of the powered by block
drush block-disable --module=system --delta=powered-by
drush block-disable --module=search --delta=form

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