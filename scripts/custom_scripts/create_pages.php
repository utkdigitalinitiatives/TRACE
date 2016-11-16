<?php

function create_named_page($page_name, $page_title, $page_body) {
  $node = new stdClass();
  $node->nid = NULL;
  $node->type = "page";
  node_object_prepare($node);
  $node->title = $page_title;
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

function add_menu_link_to_trace_navigation($pid, $menu_name, $link_title, $weight) {
	# link_path: (required) The path of the menu item, which should be normalized first by calling drupal_get_normal_path() on it.
	# link_title: (required) Title to appear in menu for the link.
	# menu_name: (optional) The machine name of the menu for the link. Defaults to 'navigation'.
	# weight: (optional) Integer to determine position in menu. Default is 0.
	# expanded: (optional) Boolean that determines if the item is expanded.
	# options: (optional) An array of options, see l() for more.
	# mlid: (optional) Menu link identifier, the primary integer key for each menu link. Can be set to an existing value, or to 0 or NULL to insert a new link.
	# plid: (optional) The mlid of the parent.
	# router_path: (optional) The path of the relevant router item.
  $link['menu_name'] = $menu_name;
  $link['link_title'] = $link_title;
  $link['link_path'] =  "node/$pid";
  $link['weight'] = $weight;
  $link['expanded'] =  0;
  $link['router_path'] = "node/%";
  $mlid = menu_link_save($link);

}
$home_body =  <<<HOME_BODY
<br/>
<p class="trace_home_page_article_title">TRACE is Tennessee Research and Creative Exchange &ndash;
      the University of Tennessee's open repository</p>
<p class="trace_home_page_article_blurb">TRACE gives the world access to UT research and creative works &ndash;
       including faculty research findings and data  &ndash; as well as documents from our institutional history.</p>
HOME_BODY;

$submit_body =  <<<SUBMIT_BODY

<br/>
<div class="row demo-row">
  <div class="col-xs-3">
    <a class="btn btn-block btn-lg btn-success" href="islandora/object/utk.ir:td/manage/overview/ingest">Submit Graduate Thesis or Dissertation</a>
<br/>
  </div>
  <div class="col-xs-3">
    <a class="btn btn-block btn-lg btn-success" href="islandora/object/utk.ir:fg/manage/overview/ingest">Submit Faculty and Graduate Student Research and Creative Work</a>
<br/>
  </div>
  <div class="col-xs-3">
    <p>Submit Undergraduate Research Projects</p>
    <p style="margin-left: 40px">
    <a href="islandora/object/utk.ir:bsp/manage/overview/ingest">Baker Scholars Program</a>
    <a href="islandora/object/utk.ir:chp/manage/overview/ingest">Chancellor’s Honors Program</a>
    <a href="islandora/object/utk.ir:csp/manage/overview/ingest">College Scholars Program</a>
    <a href="islandora/object/utk.ir:eureca/manage/overview/ingest">EUReCA: Exhibition of Undergraduate Research and Creative Achievement</a>
    <a href="islandora/object/utk.ir:hsp/manage/overview/ingest">Haslam Scholars Program</a>
    </p>
  </div>
  <div class="col-xs-3">
    <a href="/help" class="btn btn-block btn-lg btn-info">Help, I’m not sure.</a>
  </div>
</div>

SUBMIT_BODY;


$home_nid = create_named_page("home", "", $home_body);

$submit_nid = create_named_page("submit", "Welcome to TRACE. What do you want to do today?", $submit_body);

add_menu_link_to_trace_navigation($submit_nid, "user-menu", "Submit", 9);

$about_nid = create_named_page("about", "", "");
add_menu_link_to_trace_navigation($about_nid, "trace-navigation", "About", 0);

$browse_nid = create_named_page("browse", "", "");
add_menu_link_to_trace_navigation($browse_nid, "trace-navigation", "Browse Collections", 2);

$help_nid = create_named_page("help", "", "");
add_menu_link_to_trace_navigation($help_nid, "trace-navigation", "Help & Tutorial", 4);
