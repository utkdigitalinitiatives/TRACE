# Scripts Folder information
```shell
.
1 ├── README.md
2 ├── custom.sh
3 ├── custom_scripts
4 │   ├── drush_add_advisor_role.sh
5 │   ├── drush_add_anon_perms.sh
6 │   ├── drush_add_authUser_user.sh
7 │   ├── drush_add_collections.sh
8 │   ├── drush_add_manager_user.sh
9 │   ├── drush_add_privUser_user.sh
10│   ├── drush_add_theme.sh
11│   ├── drush_revise_CModel_labels.sh
12│   └── update_basic_solr_config.sh
13├── ldap.sh
14├── libraries.sh
15├── modules.sh
16├── post.sh
17└── tests
18  ├── test_users.sh
19  └── usertest.sh
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
