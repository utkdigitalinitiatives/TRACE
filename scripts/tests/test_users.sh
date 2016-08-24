#!/bin/bash
#
echo "Checking for sample content"
# checking if sample content exists

# ingest sample content
echo "ingesting sample content"
wget https://github.com/utkdigitalinitiatives/Islandora_manual/raw/master/modules/tests/test_files/trace_objects_drush.zip
unzip trace_objects_drush.zip

# before collections are available, ingest test collection object
# make directory to hold ingtest object
mkdir tracetestcollection
cd tracetestcollection
#make small dc xml file for collection
echo "<oai_dc:dc xsi:schemaLocation=\"http://www.openarchives.org/OAI/2.0/oai_dc/ http://www.openarchives.org/OAI/2.0/oai_dc.xsd\">
<dc:title>trace</dc:title>
</oai_dc:dc>" > trace.xml
# set up drupal ingest table
drush -v -u 1 -r /var/www/drupal ibsp --uri=http://localhost --namespace=islandora --content_models=islandora:collectionCModel --type=directory --target=/home/vagrant/tracetestcollection --parent=islandora:islandora
# ingest from table into fedora
drush -v -u 1 -r /var/www/drupal islandora_batch_ingest --uri=http://localhost
cd /home/vagrant
# set up ingest of pdf objects into test collection
drush -v -u 1 -r /var/www/drupal ibsp --uri=http://localhost --namespace=trace --content_models=islandora:sp_pdf --type=directory --target=/home/vagrant/trace_objects_drush --parent=islandora:trace
# ingest from table into fedora
drush -v -u 1 -r /var/www/drupal islandora_batch_ingest --uri=http://localhost

# start user tests
echo "Testing default users of roles"
