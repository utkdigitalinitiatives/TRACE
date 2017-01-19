#!/usr/bin/env bash

echo "Installing all Islandora Foundation modules"

# Permissions and ownership
echo "Setting permissions and ownership for Drupal directories"
sudo chown -hR vagrant:www-data "$DRUPAL_HOME"/sites/all/libraries
sudo chown -hR vagrant:www-data "$DRUPAL_HOME"/sites/all/modules
sudo chown -hR vagrant:www-data "$DRUPAL_HOME"/sites/default/files
sudo chmod -R 755 "$DRUPAL_HOME"/sites/all/libraries
sudo chmod -R 755 "$DRUPAL_HOME"/sites/all/modules
sudo chmod -R 755 "$DRUPAL_HOME"/sites/default/files

# for some reason /home/vagrant/.drush/cache/ && /home/vagrant/.drush/cache/default become
# owned by root. It causes failures in various scripts.
if [ -d /home/vagrant/.drush/cache/default ]; then
  sudo chown -R vagrant /home/vagrant/.drush
  sudo chmod -R 777 /home/vagrant/.drush
else
  sudo mkdir -p /home/vagrant/.drush/cache/default
  sudo chown -R vagrant /home/vagrant/.drush
  sudo chmod -R 777 /home/vagrant/.drush
fi

# Clone all Islandora Foundation modules
echo "Cloning Islandora modules"
cd "$DRUPAL_HOME"/sites/all/modules || exit
while read -r LINE; do
  git clone https://github.com/Islandora/"$LINE"
done < "$SHARED_DIR"/configs/islandora-module-list-sans-tuque.txt

# Set git filemode false for git
cd "$DRUPAL_HOME"/sites/all/modules || exit
while read -r LINE; do
  cd "$LINE" || exit
  git config core.filemode false
  cd "$DRUPAL_HOME"/sites/all/modules || exit
done < "$SHARED_DIR"/configs/islandora-module-list-sans-tuque.txt

# clone binary_object from IslandoraLabs
git clone git://github.com/Islandora-Labs/islandora_binary_object

# clone the Digital initiatives module to ingest collections
git clone https://github.com/utkdigitalinitiatives/islandora_ingest_collections.git

cd "$DRUPAL_HOME"/sites/all/modules/islandora_ingest_collections || exit
git config core.filemode false

cd "$DRUPAL_HOME"/sites/all/modules || exit

# clone the Digital initiatives module to create nested collections
git clone https://github.com/utkdigitalinitiatives/islandora_nested_collections.git
cd "$DRUPAL_HOME"/sites/all/modules/islandora_nested_collections || exit
git config core.filemode false
cd "$DRUPAL_HOME"/sites/all/modules || exit

# Clone Tuque, BagItPHP, and Cite-Proc
cd "$DRUPAL_HOME"/sites/all || exit
if [ ! -d libraries ]; then
  mkdir libraries || echo failure
fi

cd "$DRUPAL_HOME"/sites/all/libraries || exit
git clone https://github.com/Islandora/tuque.git
git clone git://github.com/scholarslab/BagItPHP.git
git clone https://github.com/Islandora/citeproc-php.git

cd "$DRUPAL_HOME"/sites/all/libraries/tuque || exit
git config core.filemode false

cd "$DRUPAL_HOME"/sites/all/libraries/BagItPHP || exit
git config core.filemode false

# Check for a user's .drush folder, create if it doesn't exist
if [ ! -d "$HOME_DIR/.drush" ]; then
  mkdir /home/vagrant/.drush || echo failure
  sudo chown -hR vagrant:www-data /home/vagrant/.drush
fi

# Move OpenSeadragon drush file to user's .drush folder
if [ -d "$HOME_DIR/.drush" ] && [ -f "$DRUPAL_HOME/sites/all/modules/islandora_openseadragon/islandora_openseadragon.drush.inc" ]; then
  mv "$DRUPAL_HOME/sites/all/modules/islandora_openseadragon/islandora_openseadragon.drush.inc" "$HOME_DIR/.drush"
fi

# Move pdf.js drush file to user's .drush folder
if [ -d "$HOME_DIR/.drush" ] && [ -f "$DRUPAL_HOME/sites/all/modules/islandora_pdfjs/islandora_pdfjs.drush.inc" ]; then
  mv "$DRUPAL_HOME/sites/all/modules/islandora_pdfjs/islandora_pdfjs.drush.inc" "$HOME_DIR/.drush"
fi

# Move IA Bookreader drush file to user's .drush folder
if [ -d "$HOME_DIR/.drush" ] && [ -f "$DRUPAL_HOME/sites/all/modules/islandora_internet_archive_bookreader/islandora_internet_archive_bookreader.drush.inc" ]; then
  mv "$DRUPAL_HOME/sites/all/modules/islandora_internet_archive_bookreader/islandora_internet_archive_bookreader.drush.inc" "$HOME_DIR/.drush"
fi

cd "$DRUPAL_HOME"/sites/all/modules || exit

drush -y -u 1 en php_lib islandora objective_forms
drush -y -u 1 en islandora_solr islandora_solr_metadata islandora_solr_views
drush -y -u 1 en islandora_basic_collection islandora_pdf islandora_book
drush -y -u 1 en islandora_basic_image islandora_large_image
drush -y -u 1 en islandora_checksum islandora_checksum_checker
drush -y -u 1 en islandora_book_batch islandora_pathauto islandora_pdfjs
drush -y -u 1 en islandora_openseadragon
drush -y -u 1 en xml_forms xml_form_builder xml_schema_api xml_form_elements xml_form_api jquery_update
drush -y -u 1 en zip_importer
drush -y -u 1 en islandora_bibliography islandora_compound_object
drush -y -u 1 en islandora_google_scholar islandora_scholar_embargo islandora_solr_config citation_exporter
drush -y -u 1 en doi_importer endnotexml_importer pmid_importer ris_importer
drush -y -u 1 en islandora_fits islandora_ocr islandora_oai islandora_simple_workflow
drush -y -u 1 en islandora_xacml_api islandora_xacml_editor islandora_xmlsitemap colorbox
drush -y -u 1 en islandora_internet_archive_bookreader islandora_bagit
drush -y -u 1 en islandora_batch_report
drush -y -u 1 en islandora_usage_stats islandora_populator
drush -y -u 1 en islandora_binary_object
drush -y -u 1 en islandora_ingest_collections islandora_nested_collections

cd "$DRUPAL_HOME"/sites/all/modules || exit

# Login Module
drush dl betterlogin
drush -y en betterlogin

# Enable Triggers
drush -y en trigger

# Set variables for Islandora modules
echo " Set variables for Islandora modules"
drush eval "variable_set('islandora_fits_executable_path', '$FITS_HOME/fits-$FITS_VERSION/fits.sh')"
drush eval "variable_set('islandora_lame_url', '/usr/bin/lame')"
drush eval "variable_set('islandora_book_viewers', array('name' => array('none' => 'none', 'islandora_internet_archive_bookreader' => 'islandora_internet_archive_bookreader'), 'default' => 'islandora_internet_archive_bookreader'))"
drush eval "variable_set('islandora_book_page_viewers', array('name' => array('none' => 'none', 'islandora_openseadragon' => 'islandora_openseadragon'), 'default' => 'islandora_openseadragon'))"
drush eval "variable_set('islandora_large_image_viewers', array('name' => array('none' => 'none', 'islandora_openseadragon' => 'islandora_openseadragon'), 'default' => 'islandora_openseadragon'))"
drush eval "variable_set('islandora_use_kakadu', TRUE)"
drush eval "variable_set('islandora_pdf_create_fulltext', 1)"
drush eval "variable_set('islandora_pdf_create_pdfa', 1)"
drush eval "variable_set('islandora_checksum_enable_checksum', TRUE)"
drush eval "variable_set('islandora_checksum_checksum_type', 'SHA-256')"
# comment out dsids to check to set a default of all dsids
#drush eval "variable_set('islandora_checksum_dsids_to_check', 'MODS,OBJ,PDF,DIGITAL_COMMONS_MD')"
drush eval "variable_set('islandora_ocr_tesseract', '/usr/bin/tesseract')"
drush eval "variable_set('islandora_batch_java', '/usr/bin/java')"
drush eval "variable_set('image_toolkit', 'imagemagick')"
drush eval "variable_set('imagemagick_convert', '/usr/bin/convert')"
drush eval "variable_set('islandora_embargo_content_models', array('ir:citationCModel', 'ir:thesisCModel', 'islandora:sp_pdf', 'islandora:binaryObjectCModel'))"
drush eval "variable_set('islandora_scholar_create_fulltext', 0)"
drush eval "variable_set('islandora_scholar_google_scholar_search_enabled', 0)"
drush eval "variable_set('islandora_scholar_path_to_pdftotext', '/usr/bin/pdftotext')"
drush eval "variable_set('islandora_scholar_preview_density', 72)"
drush eval "variable_set('islandora_scholar_preview_height', 700)"
drush eval "variable_set('islandora_scholar_preview_width', 500)"
drush eval "variable_set('islandora_repository_pid', 'utk:ir')"
