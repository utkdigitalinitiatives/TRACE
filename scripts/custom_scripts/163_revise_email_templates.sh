#!/usr/bin/env bash

#163_revise_email_templates.sh
#all changes needed to revise email templates

####################################################################
# Per Trac-618 : revise display for email messaging with templates 
# cdeane July 27, 2017


####################################################################

# replace the file: $DRUPAL_HOME/sites/all/themes/UTKdrupal/templates/page--front.tpl.php
# with the new file: /vagrant/files/page--front.tpl.php

echo "163_revise_email_templates: Replacing the file: islandora-solr-metadata-display.tpl.php"

echo "per TRAC-815"

sudo cp /vagrant/files/islandora-solr-metadata-display.tpl.php "$DRUPAL_HOME"/sites/all/themes/UTKdrupal/templates/

echo "163_revise_email_templates.sh complete"
