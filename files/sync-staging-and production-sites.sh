#!/usr/bin/env bash
# This is an example of one simple way to keep dev and production alligned

# Backup development database
drush @mysite-dev en backup_migrate -y
drush @mysite-dev bb

# Save file system settings
private_path=$(drush @mysite-dev vget --format=string file_private_path)
public_path=$(drush @mysite-dev vget --format=string file_public_path)
temp_path=$(drush @mysite-dev vget --format=string file_temporary_path)

# Synch Database
drush sql-sync @mysite-live @mysite-dev

# Restore File system settings
drush @mysite-dev vset file_private_path "$private_path"
drush @mysite-dev vset file_public_path "$public_path"
drush @mysite-dev vset file_temporary_path "$temp_path"

# Optional: Disable sending Emails in development
drush @mysite-dev en maillog -y
drush @mysite-dev en devel -y
drush @mysite-dev vset --format=integer maillog_send 0
drush @mysite-dev vset --format=integer maillog_devel 1
drush @mysite-dev vset --format=integer maillog_log 1

# Optional: Sync Files
drush rsync @mysite-live:%files/ @mysite-dev:%files

# Clear All Caches on Development
drush @mysite-dev cc all
