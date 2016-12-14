#!/usr/bin/env bash

# cURL Repo
cd "$HOME_DIR" || exit
if [ ! -d "$HOME_DIR"/sample_articles ]; then
  echo "cURLing Sample Article Data"
  mkdir sample_articles || exit
  chown -hR vagrant:vagrant sample_articles
  cd sample_articles || exit
  curl -O http://dlwork.lib.utk.edu/trace_sample_data/trace_sample_articles.tar.gz
  tar -xvzf trace_sample_articles.tar.gz
else
  cd sample_articles || exit
  echo "Updating Example Article Records"
  chown -hR vagrant:vagrant sample_articles
  curl -O http://dlwork.lib.utk.edu/trace_sample_data/trace_sample_articles.tar.gz
  tar -xvzf trace_sample_articles.tar.gz
fi

# Ingest Sample Data

cd "$DRUPAL_HOME" || exit
echo "Ingesting Sample Article Objects"
drush -v --user=admin --uri=http://localhost ibsp --content_models=ir:citationCModel --type=directory --parent=utk.ir:fg --namespace=utk.ir.fg --target=/home/vagrant/sample_articles/sample_trace_articles
drush -v --user=admin --uri=http://localhost islandora_batch_ingest