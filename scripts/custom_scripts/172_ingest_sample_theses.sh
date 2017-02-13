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
drush -v --user=userA --uri=http://localhost ibsp --content_models=ir:thesisCModel --type=directory --parent=utk.ir:td --namespace=utk.ir.td --target=/vagrant/files/userA

# batch ingest userA's content as userA
drush -v --user=userA --uri=http://localhost islandora_batch_ingest

#islandora batch preprocess UserB
drush -v --user=userB --uri=http://localhost ibsp --content_models=ir:thesisCModel --type=directory --parent=utk.ir:td --namespace=utk.ir.td --target=/vagrant/files/userB

# batch ingest userB's content as userB
drush -v --user=userB --uri=http://localhost islandora_batch_ingest
