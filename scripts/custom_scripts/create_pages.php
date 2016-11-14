<?php

function create_named_page($page_name, $page_body) {
  $node = new stdClass();
  $node->nid = NULL;
  $node->type = "page";
  node_object_prepare($node);
  $node->title = "";
  $node->uid = 1;
  $node->created = strtotime("now");
  $node->changed = strtotime("now");
  $node->sticky= 0;
  $node->promote = 0;
  $node->language = LANGUAGE_NONE;
  $node->validated = TRUE;

  $node->body[$node->language][0]["value"]   =  $page_body;  
  $node->body[$node->language][0]["summary"] = text_summary("");
  $node->body[$node->language][0]["format"]  = "filtered_html";
  $node->path = array("alias" => $page_name, "pathauto" => FALSE);

  node_save($node);

  drupal_set_message(t("Created $page_name page with node id " . $node->nid) );
  return $node->nid;
}

function add_menu_link_to_trace_navigation($pid, $link_title, $weight) {
	# link_path: (required) The path of the menu item, which should be normalized first by calling drupal_get_normal_path() on it.
	# link_title: (required) Title to appear in menu for the link.
	# menu_name: (optional) The machine name of the menu for the link. Defaults to 'navigation'.
	# weight: (optional) Integer to determine position in menu. Default is 0.
	# expanded: (optional) Boolean that determines if the item is expanded.
	# options: (optional) An array of options, see l() for more.
	# mlid: (optional) Menu link identifier, the primary integer key for each menu link. Can be set to an existing value, or to 0 or NULL to insert a new link.
	# plid: (optional) The mlid of the parent.
	# router_path: (optional) The path of the relevant router item.
  $link['menu_name'] = 'trace-navigation';
  $link['link_title'] = $link_title;
  $link['link_path'] =  "node/$pid";
  $link['weight'] = $weight;
  $link['expanded'] =  0;
  $link['router_path'] = "node/%";
  $mlid = menu_link_save($link);
  
}
$home_body =  <<<HOME_BODY
<p class="trace_home_page_article_title">TRACE is Tennessee Research and Creative Exchange &ndash; 
      the University of Tennessee's open repository</p>
<p class="trace_home_page_article_blurb">TRACE gives the world access to UT research and creative works &ndash; 
       including faculty research findings and data  &ndash; as well as documents from our institutional history.</p>
HOME_BODY;

$home_nid = create_named_page("home", $home_body);

$about_nid = create_named_page("about", "");
add_menu_link_to_trace_navigation($about_nid, "About TRACE", 0);

$browse_nid = create_named_page("browse", "");
add_menu_link_to_trace_navigation($browse_nid, "Browse TRACE Collections", 2);

$help_nid = create_named_page("help", "");
add_menu_link_to_trace_navigation($help_nid, "Use TRACE: Help & Tutorial", 4);
