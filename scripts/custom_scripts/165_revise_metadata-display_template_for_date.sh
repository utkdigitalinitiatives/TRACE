#!/usr/bin/env bash

#165_revise_metadata-display_template_for_date.sh
#all changes needed to revise search-by-date facet


####################################################################
# Per Trac-1022 : Support Google Scholar Request for Inclusion Form: Create the Year-Index.htm page for trace.utk.edu
# cdeane April 11, 2018
#
# adding a block of date search queries to the UTKdrupal/template
# islandora-solr-facet.tpl.php

echo "164_revise_facet_template_for islandora-solr-facet.tpl.php_date."
echo "165_revise_metadata-display_template_for islanodora-solr-metadata-display.tpl.php. "

echo "165 Replacing the file: islandora-solr-metadata-display.tpl.php"
echo "per TRAC-1022"


sudo cp /vagrant/files/islandora-solr-metadata-display.tpl.php  "$DRUPAL_HOME"/sites/all/themes/UTKdrupal/templates/


echo "164_revise_facet_template_for_date.sh complete"

####################################################################

