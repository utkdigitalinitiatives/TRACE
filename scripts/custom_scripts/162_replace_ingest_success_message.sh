#!/usr/bin/env bash

# This script replaces the file: $DRUPAL_HOME/sites/all/modules/islandora/includes/ingest.form.inc
# with the file: /vagrant/files/ingest.form.inc

# Purpose:
#  - modify the function:  islandora_ingest_form_submit
#  - replace the message: t('"@label" (ID: @pid) has been ingested.', array('@label' => $object->label, '@pid' => $object->id)), 'status')
#  - with the new message: t('Success!')

# Per Trac-459 : Successful submission message
# cdeane Dec 12, 2016


# replace the file: ingest.form.inc
echo "Replacing the file: ingest.form.inc per TRAC-459"
sudo cp /vagrant/files/ingest.form.inc "$DRUPAL_HOME"/sites/all/modules/islandora/includes/


echo "Changing ownership of the file ingest.form.inc"
sudo chown -hR vagrant:vagrant "$DRUPAL_HOME"/sites/all/modules/islandora/includes/ingest.form.inc

echo "End exectution of 162_replace_ingest_success_message.sh"
