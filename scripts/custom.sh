#!/usr/bin/env bash

# run all shell scripts in scripts/custom_scripts/
for SCRIPT in /vagrant/scripts/custom_scripts/*.sh
do
 # shellcheck source=/dev/null
 if [ -f "$SCRIPT" ]; then
  echo "Running custom scripts"
  # shellcheck source=/dev/null
  source "$SCRIPT"
 fi
done
