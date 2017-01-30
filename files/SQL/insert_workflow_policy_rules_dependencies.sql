INSERT INTO `drupal7`.`rules_dependencies` (`id`, `module`)  (select max(id) + 1, 'trace_ext_workflow' from rules_dependencies)
