#!/usr/bin/env bash

# install xmlstarlet
echo "Checking for XMLStarlet"
if [ -e "/usr/bin/xmlstarlet" ]; then
	echo "XMLStarlet already installed. Exiting..."
	exit
else
	echo "Installing XMLStarlet"
	sudo apt-get install xmlstarlet
fi
