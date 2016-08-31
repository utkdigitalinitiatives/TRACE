#!/bin/bash
#
echo "Checking for sample content"
# checking if sample content exists
if [ ! -f "./scholar_thesis_pdf_dc.zip" ]; then
  # ingest sample content
  echo "downloading sample content"
  wget https://github.com/utkdigitalinitiatives/Islandora_manual/raw/master/modules/tests/test_files/scholar_thesis_pdf_dc.zip
  echo "Unzipping sample files"
  unzip scholar_thesis_pdf_dc.zip
  # ingest into islandora:libraries sample collection in islandora
  cd /home/vagrant
  # set up ingest of ir:thesis objects into test collection
  drush -v -u 1 -r /var/www/drupal ibsp --uri=http://localhost --namespace=libraries --content_models=islandora:sp_pdf --type=directory --target=/home/vagrant/scholar_thesis_pdf_dc --parent=islandora:libraries
  # ingest from table into fedora
  drush -v -u 1 -r /var/www/drupal islandora_batch_ingest --uri=http://localhost
fi
# start user tests
echo -e "\nTesting default users of roles\n"
# url of an obj: http://localhost:8000/islandora/object/libraries%3A3/datastream/OBJ/view#overlay-context=islandora/object/libraries%253A3
#
#test curl of obj with authUser
curl -s -o libraries_3.pdf -u authUser:authUser http://localhost:8000/islandora/object/libraries%3A3/datastream/OBJ/view#overlay-context=islandora/object/libraries%253A3
if [ -f ./libraries_3.pdf ]; then
  echo "authuser can download content"
  rm -f ./libraries_3.pdf
fi
if [! -f /home/vagrant/user-curl.sh ]; then
  cp /vagrant/scripts/tests/user-curl.sh /home/vagrant/
fi
 echo -e "\nRun the user-curl.sh for the current state of users."
