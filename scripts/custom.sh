#!/bin/bash

SHARED_DIR=$1

if [ -f "$SHARED_DIR/configs/variables" ]; then
	# shellcheck source=/dev/null
	. "$SHARED_DIR"/configs/variables
fi

# run all shell scripts in scripts/custom_scripts/
for SCRIPT in ${SHARED_DIR}/scripts/custom_scripts/*.sh
do
	if [ -f "$SCRIPT" ]; then
		echo "Running custom scripts"
			# shellcheck source=/dev/null
			source "$SCRIPT"
	fi
done
