# Scripts Folder information
```shell
./
├── README.md
├── custom.sh
├── custom_scripts
│   ├── 001_drush_revise_CModel_labels.sh
│   ├── 010_drush_add_advisor_role.sh
│   ├── 020_drush_add_anon_perms.sh
│   ├── 030_drush_add_authUser_user.sh
│   ├── 040_drush_add_collections.sh
│   ├── 050_drush_add_manager_user.sh
│   ├── 055_drush_add_coll_manager_user.sh
│   ├── 060_drush_add_privUser_user.sh
│   ├── 070_drush_add_theme.sh
│   ├── 090_update_basic_solr_config.sh
│   ├── 095_load_solr_metadata_config_data.sh
│   ├── 100_update_islandora_forms.sh
│   ├── 110_modify_default_menus.sh
│   ├── 120_set_environment_settings.sh
│   ├── 130_add_private_messaging.sh
│   ├── 140_configure_blocks.sh
│   ├── 150_redirect_breadcrumbs.sh
│   ├── 161_modify_islandora_xml_form_builder.sh
│   ├── 162_replace_ingest_success_message.sh
│   ├── 170_ingest_sample_theses.sh
│   ├── 171_ingest_sample_articles.sh
│   ├── 172_ingest_sample_theses.sh
│   ├── 180_modify_islandora_scholar_metadata_display.sh
│   ├── 190_security.sh
│   ├── 200_analytics.sh
│   ├── 210_switch_module_repos.sh
│   ├── 220_create_workflow_entries.sh
│   ├── 999_cleanup_and_finish.sh
│   ├── README.md
│   └── create_pages.php
├── libraries.sh
├── modules.sh
├── post.sh
├── staging_env.sh
└── tests
    ├── README.md
    ├── test_users.sh
    └── usertest.sh
```
## [custom.sh](./custom.sh)
* Launches all script found within custom_scripts folder

## [custom_scripts](./custom_scripts)
* Is a directory of scripts to setup users, user roles, collections, theme, cmodel labels, and solr config

## [ldap.sh](./ldap.sh)
* Installs and enables simple ldap module for Drupal
* Ldap configured to ldap.utk.edu
* Sets ldap ports and variables
* Sets Time Zone to New York

## [libraries.sh](./libraries.sh)
* Installing all module's required libraries
* Installs & enables videojs-plugin
* Installs & enables pdfjs-plugin
* Installs & enables iabookreader-plugin
* Installs & enables colorbox-plugin
* Installs & enables openseadragon-plugin
* Installs & enables Islandora openseadragon

## [modules.sh](./modules.sh)
* Permissions and ownership
* Clone all Islandora Foundation modules
* Set git filemode false for git
* clone binary_object from IslandoraLabs
* clone the Digital initiatives module to ingest collections
* Clone Tuque, BagItPHP, and Cite-Proc
* Check for a user's .drush folder, create if it doesn't
* Move OpenSeadragon drush file to user's .drush folder
* Move video.js drush file to user's .drush folder
* Move pdf.js drush file to user's .drush folder
* Move IA Bookreader drush file to user's .drush folder
* Set variables for Islandora modules

## [post.sh](./post.sh)
* Set correct permissions on sites/default/files

## [tests directory](./tests)
* Scripts to test features and configurations for specific cases
