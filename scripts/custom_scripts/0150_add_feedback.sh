#!/usr/bin/env bash

cd /var/www/drupal/sites/all/modules || exit

# utklibrary.uservoice.com

drush -y dl uservoice
drush -y en uservoice

drush -y vset uservoice_classic_widget_default_mode 'support'
drush -y vset uservoice_classic_widget_link_color '#007cbf'
drush -y vset uservoice_classic_widget_mode 'full'
drush -y vset uservoice_classic_widget_primary_color '#cc6d00'
drush -y vset uservoice_classic_widget_tab_color '#cc6d00'
drush -y vset uservoice_classic_widget_tab_inverted: 0
drush -y vset uservoice_classic_widget_tab_label 'Feedback & Support'
drush -y vset uservoice_classic_widget_tab_position 'middle-right'
drush -y vset uservoice_contact_form '0'
drush -y vset uservoice_js_api_key 'FD76oSQaYThdUhkScrcsQ'
drush -y vset uservoice_new_widget_accent_color '#FF8200'
drush -y vset uservoice_new_widget_autopromp '0'
drush -y vset uservoice_new_widget_autoprompt: 1
drush -y vset uservoice_new_widget_custom_triggers: 0
drush -y vset uservoice_new_widget_default_forum ''
drush -y vset uservoice_new_widget_starting_experience 'contact'
drush -y vset uservoice_new_widget_trigger_background_color '#FF8200'
drush -y vset uservoice_new_widget_trigger_color 'rgba(240 237 227, 0.6)'
drush -y vset uservoice_new_widget_trigger_position 'bottom-right'
drush -y vset uservoice_script_cache_time '0'
drush -y vset uservoice_sso_key 'd1bb433dd8ce0f30b5f1202fb6eafc62'
drush -y vset uservoice_subdomain 'utklibrary'
drush -y vset uservoice_webhooks: 0
drush -y vset uservoice_widget_type 'new'
drush -y vset uservoice_widget_visibility_pages '0'
drush -y vset uservoice_widget_visibility_roles '0'
