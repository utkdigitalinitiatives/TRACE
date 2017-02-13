#!/usr/bin/env bash

# This series of scripts does wording replacements requested by Rachel.
# Trac-459
# Trac-536
# Trac-537
# TRAC-541
# Trac-543

# Files replaced by this script
# $DRUPAL_HOME/sites/all/modules/islandora/includes/ingest.form.inc
# $DRUPAL_HOME/sites/all/modules/islandora/includes/add_datastream.form.inc
# $DRUPAL_HOME/sites/all/modules/islandora/includes/datastream.version.inc
# $DRUPAL_HOME/sites/all/modules/islandora/includes/derivatives.inc
# $DRUPAL_HOME/sites/all/modules/islandora/islandora.module

# This script replaces the file: $DRUPAL_HOME/sites/all/modules/islandora/includes/ingest.form.inc
# with the file: /vagrant/files/ingest.form.inc

####################################################################
# Per Trac-537 : Text Replace "Successfully Added Datastream!" 
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
#also Trac-543 REQUEST ONE: 
# REPLACE: Add Datastream
# WITH: Add Supplemental File
# IN FILE: islandora/includes/add_datastream.form.inc
# cdeane  Jan 12, 2017

#also Trac-543 
# change per TRAC-543 REQUEST TWO-A Part 1:
#How about: 
#Datastream ID becomes instead: File Name (An ID for this file that is unique to this object. Must start with a letter and contain only alphanumeric characters, dashes and underscores.) 
# change per TRAC-543 REQUEST TWO-A Part 2:
#How about: 
#Datastream Label becomes instead: File Title (A descriptive, human-readable label for the file.)
#COMMENT (chd): File Title is confusing and unacceptable.  Chang to File Label.


# replace the file: add_datastream.form.inc
echo "Replacing the file: add_datastream.form.inc"
sudo cp /vagrant/files/add_datastream.form.inc "$DRUPAL_HOME"/sites/all/modules/islandora/includes/

# revise ownership
echo "Changing ownership of the file ingest.form.inc"
sudo chown -hR vagrant:vagrant "$DRUPAL_HOME"/sites/all/modules/islandora/includes/add_datastream.form.inc


#####################################################################
# Per TRAC-536 : change "Replace Datastream" to "Replace file."
# Per TRAC-543 Part 1.: looks same as TRAC-536 but different file.  See below.
# Per TRAC-543 Part 2.: 
# ON SUBMIT BUTTON
# REPLACE: "Add Content" 
# WITH:    "Update"
# IN FILE: islandora/includes/datastream.version.inc
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


#####################################################################
# Per TRAC-543 : change "Replace Datastream" to "Replace file."
# Per TRAC-543 Part 1.: (looks same as TRAC-536 but different file. 
# REPLACE: "Replace Datastream" 
# WITH:    "Replace File"
# IN FILE: islandora/islandora.module

# cdeane  Jan 12, 2017
# replace the file: islandora.module
echo "Replacing the file: islandora.module"
sudo cp /vagrant/files/islandora.module "$DRUPAL_HOME"/sites/all/modules/islandora/


# revise ownership
echo "Changing ownership of the file islandora.module"
sudo chown -hR vagrant:vagrant "$DRUPAL_HOME"/sites/all/modules/islandora/islandora.module

#####################################################################
# Test to see if the string_replacement script will take care of this one, since this is an islandora_scholar file
# cdeane  Jan 12, 2017
# TRAC-543 REQUEST FIVE: 
# REPLACE: Would you like to include supplemental files with this Electronic Thesis or Dissertation? 
# WITH:    Check the box to upload supplement file(s).
# IN FILE: islandora_scholar/includes/pdf_upload.form.inc
#
# FIXED BY /files/string_replacement

echo "End exectution of 162_replace_ingest_success_message.sh"

