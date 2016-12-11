#!/usr/bin/env bash

# This script replaces the file: /var/www/drupal/sites/all/modules/islandora/includes/ingest.form.inc 
# to modify the function:  islandora_ingest_form_submit
# to replace the message: t('"@label" (ID: @pid) has been ingested.', array('@label' => $object->label, '@pid' => $object->id)), 'status')
# to the new message: :wqt('Success!')
# Per Trac-459 : Successful submission message
# cdeane Dec 11, 2016


# replace the file: ingest.form.inc"
echo "Replacing the file: ingest.form.inc"
sudo cp /vagrant/files/ingest.form.inc /var/www/drupal/sites/all/modules/islandora_scholar/includes/




