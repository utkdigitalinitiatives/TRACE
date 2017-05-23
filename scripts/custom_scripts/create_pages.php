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
  $node->body[$node->language][0]["format"]  = "full_html";
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
<p class="trace_home_page_article_blurb">Home page content is contained in page--front.tpl currently.</p>
HOME_BODY;

$help_body =  <<<HELP_BODY
<h4>Contact</h4>
<p>Rachel Caldwell - rachelcaldwell@utk.edu</p>
<p>Keila Zayas Ruiz - kzayasru@utk.edu</p>
HELP_BODY;

$submit_body =  <<<SUBMIT_BODY
<hr>
<div style="line-height: 2.0; font-size: larger;">
<ul style="list-style: none;">
  <li style="padding-bottom:10px;"><a href="islandora/object/utk.ir:td/manage/overview/ingest">Submit Graduate Thesis or Dissertation</a></li>
  <li style="padding-bottom:10px;"><a href="islandora/object/utk.ir:fg/manage/overview/ingest">Submit Faculty and Graduate Student Research and Creative Work</a></li>
  <li style="color: #A7A9AC;">Submit Undergraduate Research Projects</li>
  <ul style="list-style: none;">
    <li><a href="islandora/object/utk.ir:bsp/manage/overview/ingest">Baker Scholars Program</a></li>
    <li><a href="islandora/object/utk.ir:chp/manage/overview/ingest">Chancellor’s Honors Program</a></li>
    <li><a href="islandora/object/utk.ir:csp/manage/overview/ingest">College Scholars Program</a></li>
    <li><a href="islandora/object/utk.ir:eureca/manage/overview/ingest">EUReCA: Exhibition of Undergraduate Research and Creative Achievement</a></li>
    <li style="padding-bottom:10px;"><a href="islandora/object/utk.ir:hsp/manage/overview/ingest">Haslam Scholars Program</a></li>
  </ul>
  <li style="padding-bottom:10px;"><a href="/help">Help, I’m not sure.</a></li>
</ul>
</div>
SUBMIT_BODY;

$about_body =  <<<ABOUT_BODY

<h2>What Tests should be conducted?</h2>

<h3>Test student submission Process</h3>
<p>Log in as userA. Submit a thesis, following the prompts and upload a pdf and multiple supplemental files. Check to verify you have access to your file.</p>
<h3>Test Manager Review of a submission & feedback to student</h3>
<p>Manager should be able to see a list of pending submissions</p>
<h3>Test student receives instructions to edit and resubmit</h3>
<p></p>
<h3>Test Manager's ability to approve submissions(batch)</h3>
<p></p>
<h3>Test Embargos</h3>
<p></p>
<h3>Test User vs User access to inactive (pending) submissions</h3>
<p></p>
ABOUT_BODY;

$home_nid = create_named_page("home", "", $home_body);

$submit_nid = create_named_page("submit", "Deposit Your Work", $submit_body);
add_menu_link_to_trace_navigation($submit_nid, "user-menu", "Submit", 9);

$about_nid = create_named_page("about", "About TRACE", "$about_body");
add_menu_link_to_trace_navigation($about_nid, "trace-navigation", "About TRACE", 0);

$browse_nid = create_named_page("browse", "", "");
add_menu_link_to_trace_navigation($browse_nid, "trace-navigation", "Browse Collections", 2);

$help_nid = create_named_page("help", "Help", "$help_body");
add_menu_link_to_trace_navigation($help_nid, "trace-navigation", "Help", 4);
