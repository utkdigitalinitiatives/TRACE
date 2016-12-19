#!/usr/bin/env bash

# Verify user
if [ "$HOMEUSER" = "" ]; then
	HOMEUSER="vagrant"
fi

# Clone basic-solr-config
echo "Cloning basic-solr-config"
if [ ! -d "$HOME_DIR"/4-x-utk ]; then
  git clone -b 4.x --single-branch https://github.com/utkdigitalinitiatives/basic-solr-config/ 4-x-utk
  chown -hR $HOMEUSER:$HOMEUSER 4-x-utk
else
  git -C "$HOME_DIR"/4-x-utk pull
fi

# Try to figure out which box we're running in
HOST_NAME="$(hostname)";
case "$HOST_NAME" in
	trace)
		echo "You're on a VM!"
		FGS_TARGET="/var/lib/tomcat7/webapps/fedoragsearch/WEB-INF/classes/fgsconfigFinal/index/FgsIndex/"
		SOLR_TARGET="/usr/local/solr/collection1/conf/"
		echo "Updating Fedora GSearch"
		# fix file paths in the new files
		sed -i 's|/vhosts/fedora/solr|/usr/local/solr|g' 4-x-utk/index.properties
		sed -i 's|/vhosts/fedora/tomcat|/var/lib/tomcat7|g' 4-x-utk/foxmlToSolr.xslt
		sed -i 's|/vhosts/fedora/tomcat|/var/lib/tomcat7|g' 4-x-utk/islandora_transforms/*.xslt
		;;
	esb.lib.utk.edu)
		echo "You're on bare metal!"
		FGS_TARGET="/vhosts/webapps/fedoragsearch/WEB-INF/classes/fgsconfigFinal/index/FgsIndex/"
		SOLR_TARGET="/vhosts/solr/collection1/conf/"
		echo "Updating Fedora GSearch"
		# fix file paths in the new files
		sed -i 's|/vhosts/fedora/solr|/vhosts/solr|g' 4-x-utk/index.properties
		sed -i 's|/vhosts/fedora/tomcat/webapps|/vhosts/webapps|g' 4-x-utk/foxmlToSolr.xslt
		sed -i 's|/vhosts/fedora/tomcat/webapps|/vhosts/webapps|g' 4-x-utk/islandora_transforms/*.xslt
		;;
esac

# copy the appropriate fedoragsearch files to fedoragsearch
sudo cp 4-x-utk/index.properties "$FGS_TARGET"
sudo cp 4-x-utk/foxmlToSolr.xslt "$FGS_TARGET"
sudo cp -a 4-x-utk/islandora_transforms "$FGS_TARGET"

# update file/directory ownership
sudo chown -hR tomcat7:tomcat7 "$FGS_TARGET"

echo "Updating Solr"
# copy the appropriate Solr config files to Solr
sudo cp 4-x-utk/solr-conf/* "$SOLR_TARGET"

# update file/directory ownership
sudo chown -hR tomcat7:tomcat7 "$SOLR_TARGET"
