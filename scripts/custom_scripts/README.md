# Custom Scripts

```shell
.
├── 001_drush_revise_CModel_labels.sh
├── 010_drush_add_advisor_role.sh
├── 020_drush_add_anon_perms.sh
├── 030_drush_add_authUser_user.sh
├── 040_drush_add_collections.sh
├── 050_drush_add_manager_user.sh
├── 055_drush_add_coll_manager_user.sh
├── 060_drush_add_privUser_user.sh
├── 070_drush_add_theme.sh
├── 090_update_basic_solr_config.sh
├── 095_load_solr_metadata_config_data.sh
├── 100_update_islandora_forms.sh
├── 110_modify_default_menus.sh
├── 120_set_environment_settings.sh
├── 130_add_private_messaging.sh
├── 140_configure_blocks.sh
├── 150_redirect_breadcrumbs.sh
├── 161_modify_islandora_xml_form_builder.sh
├── 162_replace_ingest_success_message.sh
├── 170_ingest_sample_theses.sh
├── 171_ingest_sample_articles.sh
├── 172_ingest_sample_theses.sh
├── 180_modify_islandora_scholar_metadata_display.sh
├── 190_security.sh
├── 200_analytics.sh
├── 210_switch_module_repos.sh
├── 220_create_workflow_entries.sh
├── 999_cleanup_and_finish.sh
├── README.md
└── create_pages.php
```

## drush_add_advisor_role.sh
* adds an advisor-role and appropriate permissions
* check for and create the role if it does not exist
* add advisor-role permissions
* iterate over the list of permissions and verify that they're added
* we aren't automatically assigning this role to a given user right now

## drush_add_anon_perms.sh
* adds permissions to internal drupal "anonymous user" role
* add anonymous permissions
* iterate over the list of permissions and verify that they're added
* this role is automatically given to any user that is not logged in

## drush_add_authUser_user.sh
* adds all of the pieces of the authUser user: user, role, and permissions
* check for and create the user, if the user doesn't exist
* check for and create role, if the role doesn't exist
* add authUser permissions
* iterate over the list of permissions and verify that they're added
* assign authUser-role to authUser user

## drush_add_collections.sh
* Echos "drush add collections DRUPAL_HOME SHARED_DIR to /tmp/junk_out
* DRUPAL_HOME="/var/www/drupal"
* Creates collections from /configs/trace_collections.csv

## drush_add_manager_user.sh
* adds all of the pieces of the manager user: user, role, and permissions
* check for and create the user, if the user doesn't exist
* check for role and create role, if the role doesn't exist
* add islandora module permissions
* iterate over the list of permissions and verify that they're added
* assign manager-role to manager user; no need for a check as you can assign the same role to the same user as many times as your heart desires.

## drush_add_privUser_user.sh
* adds all of the pieces of the privilegedUser user: user, role, and permissions
* check for and create user, if the user doesn't exist
* check for and create role, if the role doesn't exist
* add privUser permissions
* iterate over the list of permissions and verify that they're added
* assign privUser-role to privUser user

## drush_add_theme.sh
* Set permissions /sites/all/themes
* Clone UTKdrupal Theme and set permissions UTKdrupal
* Enable UTKdrupal and set as default
* uncomment below to set as default

## drush_revise_CModel_labels.sh
* islandora:sp_basic_image
* islandora:sp_pdf
* islandora:sp_large_image_cmodel
* ir:thesisCModel
* islandora:binaryObjectCmodel

|Original Label                         |Content Model Type|
|---|---|
|Islandora Basic Image Content Model    |islandora:sp_basic_image|
|Islandora PDF Content Model            |islandora:sp_pdf|
|Islandora Large Image Content Model    |islandora:sp_large_image_cmodel|
|Thesis Content Model                   |ir:thesisCModel|
|Islandora Binary Object Content Model  |ir:binaryObjectCmodel|

## update_basic_solr_config.sh
* fix file paths in the new files
* copy the appropriate fedoragsearch files to fedoragsearch
* update file/directory ownership
* copy the appropriate Solr config files to Solr
* update file/directory ownership
