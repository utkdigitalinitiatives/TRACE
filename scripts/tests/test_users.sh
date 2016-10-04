#!/usr/bin/env bash
#
echo "Checking for sample content"
# create testing log
touch /home/vagrant/testing.log
cd /home/vagrant || exit
echo -e "====Initilize log for pass/fail testing===\n" > ./testing.log
# checking if sample content exists
if [ ! -f "./scholar_thesis_pdf_dc.zip" ]; then
  # ingest sample content
  echo -e "downloading sample content.....\n"
  #wget -q https://github.com/utkdigitalinitiatives/Islandora_manual/raw/master/modules/tests/test_files/scholar_thesis_pdf_dc.zip
  #wget -q http://dlwork.lib.utk.edu/vboxes/trace_samples/set001/alt_170.zip
  # download pass/fail
  if [ -f "./alt_170.zip" ]; then
    echo -e "Pass: Download of alt_170.zip\n" >> ./testing.log
  else
    echo -e "Fail: Download of alt_170.zip\n" >> ./testing.log
  fi
  echo "Unzipping sample files"
  unzip alt_170.zip
  # ingest into islandora:libraries sample collection in islandora
  cd /home/vagrant || exit
  # set up ingest of ir:thesis objects into gradthes collection
  drush -v -u 1 -r /var/www/drupal ibsp --uri=http://localhost --namespace=gradthes --content_models=ir:thesisCModel --type=directory --target=/home/vagrant/170 --parent=islandora:gradthes
  # ingest from table into fedora
  drush -v -u 1 -r /var/www/drupal islandora_batch_ingest --uri=http://localhost
fi
# test if ingest was successful
curl -s -o libraries_3.pdf http://localhost:8000/islandora/object/libraries%3A3/datastream/OBJ/view#overlay-context=islandora/object/gradthes%253A1
if [ -f ./170.pdf ]; then
  echo -e "Pass: ingest of sample data\n" >> ./testing.log
  rm -f ./170.pdf
else
  echo -e "Fail: ingest of sample data\n" >> ./testing.log
fi

# start user tests
echo -e "\nTesting default users of roles\n"
echo -e "Logging to /home/vagrant/testing.log\n"
# url of an obj: http://localhost:8000/islandora/object/libraries%3A3/datastream/OBJ/view#overlay-context=islandora/object/gradthes%253A1
#
#test anonymous
curl -s -o 170.pdf  http://localhost:8000/islandora/object/libraries%3A3/datastream/OBJ/view#overlay-context=islandora/object/gradthes%253A1
if [ -f ./170.pdf ]; then
  echo -e "Pass: anonymous can download content\n" >> ./testing.log
  rm -f ./170.pdf
else
  echo -e "Fail: anonymous can download content\n" >> ./testing.log
fi
#test authuser
curl -s -o 170.pdf -u authUser:authUser http://localhost:8000/islandora/object/libraries%3A3/datastream/OBJ/view#overlay-context=islandora/object/gradthes%253A1
if [ -f ./170.pdf ]; then
  echo -e "Pass: authuser can download content\n" >> ./testing.log
  rm -f ./170.pdf
else
  echo -e "Fail: authUser can download content\n" >> ./testing.log
fi
# test manager
curl -s -o 170.pdf -u manager:manager http://localhost:8000/islandora/object/libraries%3A3/datastream/OBJ/view#overlay-context=islandora/object/gradthes%253A1
if [ -f ./170.pdf ]; then
  echo -e "Pass: manager can download content\n" >> ./testing.log
  rm -f ./170.pdf
else
  echo -e "Fail: manager can download content\n" >> ./testing.log
fi
if [ -f /home/vagrant/usertest.sh ]; then
  rm -f /home/vagrant/usertest.sh
fi
cp /vagrant/scripts/tests/usertest.sh /home/vagrant/usertest.sh
echo -e "Run the usertest.sh for the current state of users\n"
