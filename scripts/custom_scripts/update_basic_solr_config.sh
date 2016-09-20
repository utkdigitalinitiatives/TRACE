#!/bin/bash

FGS_TARGET="/var/lib/tomcat7/webapps/fedoragsearch/WEB-INF/classes/fgsconfigFinal/index/FgsIndex/"

echo "Cloning basic-solr-config"
if [ ! -d "$HOME_DIR"/4-x-utk ]; then
	git clone -b 4.x --single-branch https://github.com/utkdigitalinitiatives/basic-solr-config/ 4-x-utk
	chown -hR vagrant:vagrant 4-x-utk
else
	git -C "$HOME_DIR"/4-x-utk pull
fi

echo "Updating Fedora GSearch"
# fix file paths in the new files
sed -i 's|/vhosts/fedora/solr|/usr/local/solr|g' 4-x-utk/index.properties
sed -i 's|/vhosts/fedora/tomcat|/var/lib/tomcat7|g' 4-x-utk/foxmlToSolr.xslt
sed -i 's|/vhosts/fedora/tomcat|/var/lib/tomcat7|g' 4-x-utk/islandora_transforms/*.xslt

# copy the appropriate fedoragsearch files to fedoragsearch
sudo cp 4-x-utk/index.properties "$FGS_TARGET"
sudo cp 4-x-utk/foxmlToSolr.xslt "$FGS_TARGET"
sudo cp -a 4-x-utk/islandora_transforms "$FGS_TARGET"

# update file/directory ownership
sudo chown -hR tomcat7:tomcat7 "$FGS_TARGET"

echo "Updating Solr"
# copy the appropriate Solr config files to Solr
sudo cp 4-x-utk/solr-conf/* /usr/local/solr/collection1/conf/

# update file/directory ownership
sudo chown -hR tomcat7:tomcat7 /usr/local/solr/collection1/conf
