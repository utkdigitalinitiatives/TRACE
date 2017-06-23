#!/usr/bin/env bash

# run all shell scripts in scripts/custom_scripts/
## shellcheck source=/dev/null
# shellcheck disable=SC1073
# shellcheck disable=SC1072
# shellcheck disable=SC1009
true

for SCRIPT in /vagrant/scripts/custom_scripts/*.sh
do
 if [ -f "$SCRIPT" ]; then
  echo "Running custom script $SCRIPT"
  # shellcheck source=/dev/null
  source "$SCRIPT"
 fi
done
