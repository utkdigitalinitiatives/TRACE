#!/usr/bin/env bash

# Verify user
if [ "$HOMEUSER" = "" ]; then
	HOMEUSER="vagrant"
fi

# Clone utk-fedora-fedoragsearch-solr-config
echo "Cloning utk-fedora-fedoragsearch-solr-config"
if [ ! -d "$HOME_DIR"/utk-fedora-fedoragsearch-solr-config ]; then
  git clone https://github.com/utkdigitalinitiatives/utk-fedora-fedoragsearch-solr-config
  chown -hR $HOMEUSER:$HOMEUSER utk-fedora-fedoragsearch-solr-config
else
  git -C "$HOME_DIR"/utk-fedora-fedoragsearch-solr-config pull
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
		sed -i 's|/vhosts/fedora/solr|/usr/local/solr|g' utk-fedora-fedoragsearch-solr-config/fedoragsearch-transforms/index.properties
		sed -i 's|/vhosts/fedora/tomcat|/var/lib/tomcat7|g' utk-fedora-fedoragsearch-solr-config/fedoragsearch-transforms/foxmlToSolr.xslt
		sed -i 's|/vhosts/fedora/tomcat|/var/lib/tomcat7|g' utk-fedora-fedoragsearch-solr-config/fedoragsearch-transforms/islandora_transforms/*.xslt
		;;
	esb.lib.utk.edu)
		echo "You're on bare metal!"
		FGS_TARGET="/vhosts/webapps/fedoragsearch/WEB-INF/classes/fgsconfigFinal/index/FgsIndex/"
		SOLR_TARGET="/vhosts/solr/collection1/conf/"
		echo "Updating Fedora GSearch"
		# fix file paths in the new files
		sed -i 's|/vhosts/fedora/solr|/vhosts/solr|g' utk-fedora-fedoragsearch-solr-config/fedoragsearch-transforms/index.properties
		sed -i 's|/vhosts/fedora/tomcat/webapps|/vhosts/webapps|g' utk-fedora-fedoragsearch-solr-config/fedoragsearch-transforms/foxmlToSolr.xslt
		sed -i 's|/vhosts/fedora/tomcat/webapps|/vhosts/webapps|g' utk-fedora-fedoragsearch-solr-config/fedoragsearch-transforms/islandora_transforms/*.xslt
		;;
esac

# copy the appropriate fedoragsearch files to fedoragsearch
sudo cp utk-fedora-fedoragsearch-solr-config/fedoragsearch-transforms/index.properties "$FGS_TARGET"
sudo cp utk-fedora-fedoragsearch-solr-config/fedoragsearch-transforms/foxmlToSolr.xslt "$FGS_TARGET"
sudo cp -a utk-fedora-fedoragsearch-solr-config/fedoragsearch-transforms/islandora_transforms "$FGS_TARGET"

# update file/directory ownership
sudo chown -hR tomcat7:tomcat7 "$FGS_TARGET"

echo "Updating Solr"
# copy the appropriate Solr config files to Solr
sudo cp utk-fedora-fedoragsearch-solr-config/solr-conf/* "$SOLR_TARGET"

# update file/directory ownership
sudo chown -hR tomcat7:tomcat7 "$SOLR_TARGET"
