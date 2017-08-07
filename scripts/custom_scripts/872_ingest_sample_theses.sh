#!/usr/bin/env bash

#172_ingest_sample_theses.sh
#Located at: /vagrant/scripts/custom_scripts/

# INCOMPLETE PLAGIARISM OF 170
# Attribute good stuff to author of 170_ingest_sample_theses.sh
# Attribute mistakes to cdeane.
cd /vagrant/files || exit
if [ ! -d /vagrant/files ]; then
  echo "Ingest UserA and UserB Thesis Data"
fi

cd "$DRUPAL_HOME" || exit

#islandora batch preprocess UserA
# centos7 uses drush 8 so have to detect and change old target parameter
if [ -f "/etc/centos-release" ]; then
  drush --user=userA --uri=http://localhost ibsp --content_models=ir:thesisCModel --type=directory --parent=utk.ir:td --namespace=utk.ir.td --scan_target=/vagrant/files/userA
else
  drush --user=userA --uri=http://localhost ibsp --content_models=ir:thesisCModel --type=directory --parent=utk.ir:td --namespace=utk.ir.td --target=/vagrant/files/userA
fi
# batch ingest userA's content as userA
drush --user=userA --uri=http://localhost islandora_batch_ingest

#islandora batch preprocess UserB
# centos7 uses drush 8 so have to detect and change old target parameter
if [ -f "/etc/centos-release" ]; then
  drush --user=userB --uri=http://localhost ibsp --content_models=ir:thesisCModel --type=directory --parent=utk.ir:td --namespace=utk.ir.td --scan_target=/vagrant/files/userB
else
  drush --user=userB --uri=http://localhost ibsp --content_models=ir:thesisCModel --type=directory --parent=utk.ir:td --namespace=utk.ir.td --target=/vagrant/files/userB
fi
# batch ingest userB's content as userB
drush --user=userB --uri=http://localhost islandora_batch_ingest
