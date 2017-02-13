INSERT INTO `drupal7`.`rules_trigger` (`id`, `event`)  (select max(id) + 1, 'islandora_object_ingested' from rules_trigger)
