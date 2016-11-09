#!/usr/bin/env bash


# read -d '' create_home_page <<"PHP_CREATE_NODE"
  # $node = new stdClass();
  # $node->type = "page";
  # node_object_prepare($node);
  # $node->title = "";
  # $node->uid = 1;
  # $node->language = LANGUAGE_NONE;
  # $node->body[$node->language][0]["value"]   = "";
  # $node->body[$node->language][0]["summary"] = text_summary("");
  # $node->body[$node->language][0]["format"]  = "filtered_html";
  # $node->path = array("alias" => "home");
  # node_save($node);
# PHP_CREATE_NODE

#drush php-eval "$create_home_page"

cd /var/www/drupal || exit
drush chp