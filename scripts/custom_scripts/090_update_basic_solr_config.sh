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

# Determine target OS and related settings
if [ -f "/etc/centos-release" ]; then
	OS="centos"
	APACHE_GROUP="apache"
	TOMCAT_NAME="tomcat"
elif [ -f "/etc/redhat-release" ]; then
	OS="redhat"
	APACHE_GROUP="www-data"
	TOMCAT_NAME="tomcat"
elif [ $(grep -c 'Ubuntu' /etc/issue) -ne 0 ]; then
	OS="ubuntu"
	APACHE_GROUP="???"
	TOMCAT_NAME="tomcat7"
fi

# Use target OS to prepare file paths, etc.
case "$OS" in
	centos)
		echo "You're using Centos!"
		FGS_INDEX_TARGET="/var/lib/webapps/fedoragsearch/WEB-INF/classes/fgsconfigFinal/index/FgsIndex/"
		FGS_CONF_TARGET="/var/lib/webapps/fedoragsearch/WEB-INF/classes/fgsconfigFinal/"
		SOLR_TARGET="/usr/local/solr/collection1/conf/"
		echo "Updating Fedora GSearch"
		# fix file paths in the new files
		sed -i 's|/vhosts/fedora/solr|/vhosts/solr|g' utk-fedora-fedoragsearch-solr-config/fedoragsearch-transforms/index.properties
		sed -i 's|/vhosts/fedora/tomcat/webapps|/vhosts/webapps|g' utk-fedora-fedoragsearch-solr-config/fedoragsearch-transforms/foxmlToSolr.xslt
		sed -i 's|/vhosts/fedora/tomcat/webapps|/vhosts/webapps|g' utk-fedora-fedoragsearch-solr-config/fedoragsearch-transforms/islandora_transforms/*.xslt
		;;
	redhat)
		echo "You're using RedHat!"
		FGS_INDEX_TARGET="/vhosts/webapps/fedoragsearch/WEB-INF/classes/fgsconfigFinal/index/FgsIndex/"
		FGS_CONF_TARGET="/vhosts/webapps/fedoragsearch/WEB-INF/classes/fgsconfigFinal/"
		SOLR_TARGET="/vhosts/solr/collection1/conf/"
		echo "Updating Fedora GSearch"
		# fix file paths in the new files
		sed -i 's|/vhosts/fedora/solr|/vhosts/solr|g' utk-fedora-fedoragsearch-solr-config/fedoragsearch-transforms/index.properties
		sed -i 's|/vhosts/fedora/tomcat/webapps|/vhosts/webapps|g' utk-fedora-fedoragsearch-solr-config/fedoragsearch-transforms/foxmlToSolr.xslt
		sed -i 's|/vhosts/fedora/tomcat/webapps|/vhosts/webapps|g' utk-fedora-fedoragsearch-solr-config/fedoragsearch-transforms/islandora_transforms/*.xslt
		;;
	ubuntu)
		echo "You're using Ubuntu!"
		FGS_INDEX_TARGET="/var/lib/tomcat7/webapps/fedoragsearch/WEB-INF/classes/fgsconfigFinal/index/FgsIndex/"
		FGS_CONF_TARGET="/var/lib/tomcat7/webapps/fedoragsearch/WEB-INF/classes/fgsconfigFinal/"
		SOLR_TARGET="/usr/local/solr/collection1/conf/"
		echo "Updating Fedora GSearch"
		# fix file paths in the new files
		sed -i 's|/vhosts/fedora/solr|/usr/local/solr|g' utk-fedora-fedoragsearch-solr-config/fedoragsearch-transforms/index.properties
		sed -i 's|/vhosts/fedora/tomcat|/var/lib/tomcat7|g' utk-fedora-fedoragsearch-solr-config/fedoragsearch-transforms/foxmlToSolr.xslt
		sed -i 's|/vhosts/fedora/tomcat|/var/lib/tomcat7|g' utk-fedora-fedoragsearch-solr-config/fedoragsearch-transforms/islandora_transforms/*.xslt
		;;
esac

# copy the appropriate fedoragsearch files to fedoragsearch
sudo cp utk-fedora-fedoragsearch-solr-config/fedoragsearch-conf/fedoragsearch.properties "$FGS_CONF_TARGET"
sudo cp utk-fedora-fedoragsearch-solr-config/fedoragsearch-conf/fgsconfig-basic-configForIslandora.properties "$FGS_CONF_TARGET"
sudo cp -a utk-fedora-fedoragsearch-solr-config/fedoragsearch-conf/updater "$FGS_CONF_TARGET"
sudo cp utk-fedora-fedoragsearch-solr-config/fedoragsearch-transforms/index.properties "$FGS_INDEX_TARGET"
sudo cp utk-fedora-fedoragsearch-solr-config/fedoragsearch-transforms/foxmlToSolr.xslt "$FGS_INDEX_TARGET"
sudo cp -a utk-fedora-fedoragsearch-solr-config/fedoragsearch-transforms/islandora_transforms "$FGS_INDEX_TARGET"

# update file/directory ownership
sudo chown -hR "$TOMCAT_NAME":"$TOMCAT_NAME" "$FGS_INDEX_TARGET" "$FGS_CONF_TARGET"

echo "Updating Solr"
# copy the appropriate Solr config files to Solr
sudo cp utk-fedora-fedoragsearch-solr-config/solr-conf/* "$SOLR_TARGET"

# update file/directory ownership
sudo chown -hR "$TOMCAT_NAME":"$TOMCAT_NAME" "$SOLR_TARGET"
