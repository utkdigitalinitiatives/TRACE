#!/usr/bin/env bash

# cURL Repo
cd "$HOME_DIR" || exit
if [ ! -d "$HOME_DIR"/sample_data ]; then
    echo "cURLing Sample Thesis Data"
  mkdir sample_data || exit
  chown -hR vagrant:vagrant sample_data
  cd sample_data || exit
  curl -s -O http://dlwork.lib.utk.edu/vboxes/trace_sample_data.tar.gz
  tar -xvzf trace_sample_data.tar.gz
else
  cd sample_data || exit
  echo "Updating Example Thesis Records"
  chown -hR vagrant:vagrant sample_data
  curl -s -O http://dlwork.lib.utk.edu/vboxes/trace_sample_data.tar.gz
  tar -xvzf trace_sample_data.tar.gz
fi

# Ingest Sample Data

cd "$DRUPAL_HOME" || exit
echo "Ingesting Sample Thesis Objects"
# centos7 uses drush 8 so have to detect and change old target parameter
if [ -f "/etc/centos-release" ]; then
drush --user=admin --uri=http://localhost ibsp --content_models=ir:thesisCModel --type=directory --parent=utk.ir:td --namespace=utk.ir.td --scan_target=/home/vagrant/sample_data/trace_sample_data
else
drush --user=admin --uri=http://localhost ibsp --content_models=ir:thesisCModel --type=directory --parent=utk.ir:td --namespace=utk.ir.td --target=/home/vagrant/sample_data/trace_sample_data
fi
drush --user=admin --uri=http://localhost islandora_batch_ingest
