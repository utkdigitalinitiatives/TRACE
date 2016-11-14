#!/usr/bin/env bash

# change the default breadcrumb
if [ ! -d  $DRUPAL_HOME/sites/all/modules/match_redirect/ ]; then
	drush dl match_redirect
	drush -y -u 1 en match_redirect
	drush sql-query "insert into match_redirect(source_pattern, target, status_code, override, weight) values ('islandora','browse',302,1,0)"
fi


