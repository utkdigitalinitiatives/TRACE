#!/usr/bin/env bash

# This script replaces the file: $DRUPAL_HOME/sites/all/modules/islandora/includes/ingest.form.inc
# with the file: /vagrant/files/ingest.form.inc

# Purpose:
#  - modify the function:  islandora_ingest_form_submit
#  - replace the message: t('"@label" (ID: @pid) has been ingested.', array('@label' => $object->label, '@pid' => $object->id)), 'status')
#  - with the new message: t('Success!')

####################################################################
# Per Trac-459 : Successful submission message
# cdeane Dec 12, 2016
# replace the file: ingest.form.inc
echo "Replacing the file: ingest.form.inc per TRAC-459"
sudo cp /vagrant/files/ingest.form.inc "$DRUPAL_HOME"/sites/all/modules/islandora/includes/


# revise ownership
echo "Changing ownership of the file ingest.form.inc"
sudo chown -hR vagrant:vagrant "$DRUPAL_HOME"/sites/all/modules/islandora/includes/ingest.form.inc


#####################################################################
#Per Trac-537 : change "Successfully Added Datastreams!" to "Successfully added files!"
# cdeane  Jan 12, 2017
# replace the file: add_datastream.form.inc
echo "Replacing the file: add_datastream.form.inc"
sudo cp /vagrant/files/add_datastream.form.inc "$DRUPAL_HOME"/sites/all/modules/islandora/includes/

# revise ownership
echo "Changing ownership of the file ingest.form.inc"
sudo chown -hR vagrant:vagrant "$DRUPAL_HOME"/sites/all/modules/islandora/includes/add_datastream.form.inc


#####################################################################
# Per TRAC-536 : change "Replace Datastream" to "Replace file."
# cdeane  Jan 12, 2017
# replace the file: datastream.version.inc
echo "Replacing the file: datastream.version.inc"
sudo cp /vagrant/files/datastream.version.inc "$DRUPAL_HOME"/sites/all/modules/islandora/includes/


# revise ownership
echo "Changing ownership of the file datastream.version.inc"
sudo chown -hR vagrant:vagrant "$DRUPAL_HOME"/sites/all/modules/islandora/includes/datastream.version.inc



#####################################################################
#Per TRAC-541 change sucess message for adding derivatives
# cdeane  Jan 12, 2017

# replace the file: derivatives.inc
echo "Replacing the file: derivatives.inc"
sudo cp /vagrant/files/derivatives.inc "$DRUPAL_HOME"/sites/all/modules/islandora/includes/


# revise ownership
echo "Changing ownership of the file derivatives.inc"
sudo chown -hR vagrant:vagrant "$DRUPAL_HOME"/sites/all/modules/islandora/includes/derivatives.inc


echo "End exectution of 162_replace_ingest_success_message.sh"
