#!/bin/bash
#
echo "Checking for sample content"
# checking if sample content exists
if [ -f "./scholar_thesis_pdf_dc.zip" ]; then
  echo "Deleting previous data file."
  rm -f ./scholar_thesis_pdf_dc.zip
fi

# ingest sample content
echo "downloading sample content"
wget https://github.com/utkdigitalinitiatives/Islandora_manual/raw/master/modules/tests/test_files/scholar_thesis_pdf_dc.zip
if [ -d "scholar_thesis_pdf_dc"]; then
  echo "Deleteing previous data files and directory"
  rm -f /home/vagrant/scholar_thesis_pdf_dc/*
  rmdir ./scholar_thesis_pdf_dc
fi
echo "Unzipping sample files"
unzip scholar_thesis_pdf_dc.zip

# ingest into islandora:libraries sample collection in islandora
cd /home/vagrant
# set up ingest of ir:thesis objects into test collection
#drush -v -u 1 -r /var/www/drupal ibsp --uri=http://localhost --namespace=libraries --content_models=islandora:ir_thesisCModel --type=directory --target=/home/vagrant/scholar_thesis_pdf_dc --parent=islandora:libraries
# ingest from table into fedora
#drush -v -u 1 -r /var/www/drupal islandora_batch_ingest --uri=http://localhost

# start user tests
echo "Testing default users of roles"
