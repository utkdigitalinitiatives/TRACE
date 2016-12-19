#!/usr/bin/env bash

# Switch to UTK Simple Workflow
# Overly complicated solution

cd "$DRUPAL_HOME"/sites/all/modules/islandora_simple_workflow || exit

git clone https://github.com/utkdigitalinitiatives/islandora_simple_workflow tmp

rm -rf .git
mv tmp/.git .git
rm -rf tmp
git fetch
git reset --hard HEAD
git pull
