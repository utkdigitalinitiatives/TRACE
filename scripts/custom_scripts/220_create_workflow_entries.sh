#!/usr/bin/env bash

#insert td XACML-policies

drush sql-query --file=/vagrant/files/SQL/insert_trace_workflow_namespace_policies.sql


#insert into rules_trigger

drush sql-query --file=/vagrant/files/SQL/insert_object_ingested_rules_trigger.sql

# insert into `rules_dependencies` 

drush sql-query --file=/vagrant/files/SQL/insert_workflow_policy_rules_dependencies.sql

# insert into `rules_config` 

drush sql-query --file=/vagrant/files/SQL/insert_workflow_policy_rules_config.sql
 
 #JIRA TASK
 #remove Policy from manage files in administrative view.
 
 
# populate islandora_workflow_namespace_role
 

drush sql-query --file=/vagrant/files/SQL/insert_admin_workflow_namespace_role.sql


drush sql-query --file=/vagrant/files/SQL/insert_manager_workflow_namespace_role.sql


drush sql-query --file=/vagrant/files/SQL/insert_thesis-manager_workflow_namespace_role.sql