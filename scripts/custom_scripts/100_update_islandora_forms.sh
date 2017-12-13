#!/usr/bin/env bash
if [ "$HOMEUSER" = "" ]; then
   HOMEUSER="vagrant"
fi
# If utk_isl_xml_forms doesn't exist, clone it.  Otherwise, pull changes to from origin remote.
echo "Clone UTK Islandora XML Forms."
cd "$HOME_DIR" || exit

if [ ! -d "$HOME_DIR"/utk_isl_xml_forms ]; then
  echo "Clone utkdigitalinitiatives/utk_isl_xml_forms."
  git clone https://github.com/utkdigitalinitiatives/utk_isl_xml_forms
  chown -hR "$HOMEUSER":"$HOMEUSER" utk_isl_xml_forms
else
  cd utk_isl_xml_forms || exit
  echo "Grab form updates from utkdigitalinitiatives/utk_isl_xml_forms."
  git pull origin master
fi

# Replace default thesis form.
echo "Replace Default Islandora Thesis CModel XML Form."
sudo cp "$HOME_DIR"/utk_isl_xml_forms/xml_forms/UTK_ir_etds.xml "$DRUPAL_HOME"/sites/all/modules/islandora_scholar/xml/thesis_form.xml

# Replace default binary form.
echo "Replace Default Islandora Binary CModel XML Form."
sudo cp "$HOME_DIR"/utk_isl_xml_forms/xml_forms/UTK_ir_datasets.xml "$DRUPAL_HOME"/sites/all/modules/islandora_binary_object/xml/islandora_binary_object_form_mods.xml

# Add post-process transforms
echo "Add post-process XSL transforms."
sudo cp "$HOME_DIR"/utk_isl_xml_forms/post_process_transforms/*.xsl "$DRUPAL_HOME"/sites/all/modules/islandora_xml_forms/builder/self_transforms
sudo cp "$HOME_DIR"/utk_isl_xml_forms/post_process_transforms/trace-disciplines-list-comp.xml "$DRUPAL_HOME"/sites/all/modules/islandora_xml_forms/builder/self_transforms

# Fix ownership on the copied post-process transforms
echo "Correct ownership on the post-process XSL transforms."
sudo chown -R vagrant:vagrant "$DRUPAL_HOME"/sites/all/modules/islandora_xml_forms/builder/self_transforms
