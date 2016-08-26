#!/bin/bash
#
echo "Checking for sample content"
# checking if sample content exists

# ingest sample content
echo "ingesting sample content"
sudo rm -f trace_objects_drush.zip
sudo rm -f /home/vagrant/trace_objects_drush/*
wget https://github.com/utkdigitalinitiatives/Islandora_manual/raw/master/modules/tests/test_files/trace_objects_drush.zip
sudo rm -f rmdir trace_objects_drush
unzip trace_objects_drush.zip

# before collections are available, ingest into pdf sample collection in islandora
cd /home/vagrant
# set up ingest of pdf objects into test collection
#drush -v -u 1 -r /var/www/drupal ibsp --uri=http://localhost --namespace=sp_pdf_collection --content_models=islandora:sp_pdf --type=directory --target=/home/vagrant/trace_objects_drush --parent=islandora:sp_pdf_collection
# ingest from table into fedora
#drush -v -u 1 -r /var/www/drupal islandora_batch_ingest --uri=http://localhost

# start user tests
echo "Testing default users of roles"
