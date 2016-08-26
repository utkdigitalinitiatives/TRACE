#!/bin/bash

# run all shell scripts in scripts/custom_scripts/
for SCRIPT in ${SHARED_DIR}/scripts/custom_scripts/*.sh
do
	if [ -f "$SCRIPT" ]; then
		echo "Running custom scripts"
			# shellcheck source=/dev/null
			source "$SCRIPT"
	fi
done
