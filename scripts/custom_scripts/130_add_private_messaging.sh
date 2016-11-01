#!/usr/bin/env bash
# This adds Private Messaging to TRACE
# Installs Privatemsg (https://www.drupal.org/project/privatemsg)
# & Real Name (https://www.drupal.org/project/realname)
cd "$DRUPAL_HOME"/ || exit

drush -y dl realname
drush -y en realname

drush -y dl privatemsg
drush -y en privatemsg
drush -y en pm_block_user pm_email_notify privatemsg_filter privatemsg_limits privatemsg_realname privatemsg_roles privatemsg_rules

# Set to "Secondary sidebar" blocks

# Set block to be viewable by only authenticated users
drush dl drush_extras
drush block-configure --module=privatemsg --delta=privatemsg-menu --region=sidebar_second

# Clean Up
sudo updatedb
druch cc all
