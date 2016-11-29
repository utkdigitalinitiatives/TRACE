#!/usr/bin/env bash
if ["$HOMEUSER"=""]; then
   HOMEUSER="vagrant"
fi
# If utk_isl_xml_forms doesn't exist, clone it.  Otherwise, pull changes to from origin remote.
echo "Clone UTK Islandora XML Forms."
cd "$HOME_DIR" || exit

if [ ! -d "$HOME_DIR"/utk_isl_xml_forms ]; then
  echo "Clone utkdigitalinitiatives/utk_isl_xml_forms."
  git clone https://github.com/utkdigitalinitiatives/utk_isl_xml_forms
  chown -hR $HOMEUSER:$HOMEUSER utk_isl_xml_forms
else
  cd utk_isl_xml_forms || exit
  echo "Grab form updates from utkdigitalinitiatives/utk_isl_xml_forms."
  git pull origin master
fi

# Replace default form.
echo "Replace Default Islandora Thesis CModel XML Form."
sudo cp "$HOME_DIR"/utk_isl_xml_forms/xml_forms/UTK_ir_etds.xml /var/www/drupal/sites/all/modules/islandora_scholar/xml/thesis_form.xml
