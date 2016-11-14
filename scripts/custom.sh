#!/usr/bin/env bash

# run all shell scripts in scripts/custom_scripts/
# shellcheck source=/dev/null
for SCRIPT in /vagrant/scripts/custom_scripts/*.sh
do
 if [ -f "$SCRIPT" ]; then
  echo "Running custom script $SCRIPT"
  # shellcheck source=/dev/null
  source "$SCRIPT"
 fi
done
