#!/usr/bin/env bash

# install xmlstarlet
echo "Checking for XMLStarlet"
if [ -e "/usr/bin/xmlstarlet" ]; then
	echo "XMLStarlet already installed. Exiting..."
	exit
else
	echo "Installing XMLStarlet"
  if [ -f "/etc/centos-release" ]; then
	sudo yum -y install xmlstarlet
  else
	sudo apt-get install xmlstarlet
  fi
fi
