#!/usr/bin/env bash

# run all shell scripts in scripts/custom_scripts/
for SCRIPT in /vagrant/scripts/custom_scripts/*.sh
do
	if [ -f "$SCRIPT" ]; then
		echo "Running custom scripts"
			#
			source "$SCRIPT"
	fi
done
