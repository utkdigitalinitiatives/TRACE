#!/bin/bash

# Setup a user for Tomcat Manager
grep -q 'user username="islandora"' /etc/tomcat7/tomcat-users.xml && echo "islandora tomcat user exists; not modifying tomcat-users" || sed -i '$i<role rolename="tomcat"/>\n<role rolename="admin-gui"/>\n<user username="islandora" password="islandora" roles="tomcat,manager-gui,admin-gui"/>' /etc/tomcat7/tomcat-users.xml
service tomcat7 restart

# Set correct permissions on sites/default/files
chmod -R 775 /var/www/drupal/sites/default/files
