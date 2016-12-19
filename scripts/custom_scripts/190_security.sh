#!/usr/bin/env bash

cd "$DRUPAL_HOME"/sites/all/modules || exit

sudo curl https://ftp.drupal.org/files/projects/seckit-7.x-1.x-dev.tar.gz | tar -xz

drush en -y seckit

# Set seckit Variables
drush ev 'variable_set("seckit_advanced", array("disable_seckit" => 1,"unlimited_csp_reports" => 1, "csp_limits" => array("max_size" => "4096","flood" => array("limit_user" => "100","window_user" => "900","limit_global" => "1000","window_global" => "3600"))));'

drush ev 'variable_set("seckit_clickjacking", array("x_frame" => "1","x_frame_allow_from" => "","js_css_noscript" => 0,"noscript_message" => "Sorry, you need to enable JavaScript to visit this website."));'

drush ev 'variable_set("seckit_csrf", array("origin" => 1,"origin_whitelist" => ""));'

drush ev 'variable_set("seckit_ssl", array("hsts" => 0,"hsts_max_age" => 1000,"hsts_subdomains" => 0,"hsts_preload" => 0));'

drush ev 'variable_set("seckit_various", array("from_origin" => 0,"from_origin_destination" => "same","disable_autocomplete" => 0));'

drush ev 'variable_set("seckit_xss", array("csp" => array("checkbox" => 0,"report-only" => 0,"default-src" => "self","script-src" => "","object-src" => "","style-src" => "","img-src" => "","media-src" => "","frame-src" => "","child-src" => "","font-src" => "","connect-src" => "","report-uri" => "report-csp-violation","policy-uri" => ""),"x_xss" => array("select" => "3"),"x_content_type" => array("checkbox"=> 1)));'

drush ev 'variable_set("seckit_ssl", array("hsts" => 0,"hsts_max_age" => 1000,"hsts_subdomains" => 0,"hsts_preload" => 0,));'
