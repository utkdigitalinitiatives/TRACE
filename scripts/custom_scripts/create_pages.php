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


$policy_body = <<<POLICY_BODY
<div id="policies">
<p>Trace, the Tennessee Research and Creative Exchange digital repository at the University of Tennessee, provides long-term access and preservation services for the intellectual and creative output of the university's academic, research, and administrative communities. The digital repository is open access, making content freely available, worldwide, under the following conditions and terms.</p>

<h3>Organization</h3>
<p>Trace is organized by communities - academic and other units at the University of Tennessee. Any school, academic department or program, research center or research institute at the University of Tennessee, as well as other administrative units that can assume responsibility for setting and administering policies, is eligible to form a community in the digital repository. Each community assigns a community manager who works with the University Libraries to support Trace.</p>
<p>Communities develop, in consultation with the Trace administrator, policies addressing: 1) Items appropriate for a particular collection; 2) Electronic format acceptable for a particular collection; and 3) Guidelines for contributors.</p>
<p>Trace is directed by the University Libraries Scholarly Communication department head. A Trace administrator oversees technical support and the addition of content. Campus stakeholders who serve on the Trace Advisory Group assist with the solicitation of new content and training of repository contributors.</p>

<p>Communities:</p>
<ul>
  <li>Identify community managers who collaborate with repository staff</li>
  <li>Develop community-specific policies to supplement general repository policies</li>
  <li>Inform contributors about policies and procedures</li>
  <li>Manage the deposit and description of content</li>
  <li>Establish deposit workflows for collections</li>
  <li>Notify repository staff of organizational changes affecting submissions</li>
</ul>
<p>University Libraries:</p>
<ul>
  <li>Retains content deposited</li>
  <li>Preserves content using digital preservation standards and techniques</li>
  <li>Provides access to repository content</li>
  <li>Notifies communities of significant preservation actions, e.g. format migration</li>
  <li>Provides a streaming server to host media files</li>
</ul>
<h3>Appropriate Submissions</h3>
<p>Any content is appropriate if all applicable policies are followed (e.g., copyright), if the content can be posted using existing format types (i.e., technically feasible), and if the sponsoring unit decides it is appropriate. Posting bibliographic citations or abstracts alone cannot be accommodated without the full text of a work. Examples of appropriate Trace content include:</p>
<ul>
  <li>Published faculty research (as copyright permits)</li>
  <li>Technical reports, working papers, conference publications</li>
  <li>Research data in numeric or image formats</li>
  <li>Theses &amp; Dissertations</li>
  <li>Administrative records</li>
  <li>Special collections digitized locally (letters, photographs, diaries)</li>
  <li>Digital image collections</li>
  <li>Instructional materials and courseware</li>
  <li>Journal publishing platforms</li>
  <li>Software</li>
</ul>
<p>SelectedWorks Author pages, Trace's option for University of Tennessee scholars to have a personal webpage that showcases their work, is currently available for faculty associated with UTK.</p>
<p>Trace also supports peer-reviewed series and journals. If you are considering the repository for peer-reviewed content, visit <a href="http://www.trace.tennessee.edu/" title="Trace">www.trace.tennessee.edu</a> to determine if this is the right forum for your scholarship. Additionally, a conference or seminar series can be established within any department, center, or research unit participating in the repository. Creation of schedules and uploading of content is managed by the community manager of the sponsoring unit. If you are considering hosting a seminar series in the repository, contact
  <script type="text/javascript">
    //<![CDATA[
        document.write("<a href='mailto:" + "trace" + "@" + "utk.edu" + "'>" + "trace" + "@" + "utk.edu" + "<\/a>")
    //]]>
</script><a href="mailto:trace@utk.edu">trace@utk.edu</a>.</p>

<h3>Copyright and Author Agreements</h3>
<p>Authors must own the copyright for work submitted to Trace. Authors grant the university a non-exclusive, perpetual right to use the digital assets for non-commercial use. Because authors retain the copyright for all content posted in the repository, they are free to reuse the content elsewhere.</p>
<p>If a working paper is published in a journal - either in the same form or, more commonly, in revised form - many journals allow the working paper to continue to be openly accessible, especially when it is for educational/scholarly noncommercial use. While some journals require that the working paper be removed, others grant exceptions for institutional repositories, but must be asked.</p>
<p>The author is responsible for negotiating the terms of publication agreements. The repository constitutes noncommercial use. Faculty who wish to include a reprint of a journal article in the repository should consult their agreement with the journal to see if posting in a repository is allowed. Authors who have transferred copyrights may seek permission of the copyright holder to publish it in the repository. The <a href="http://www.sherpa.ac.uk/projects/sherparomeo.html" title="SHERPA/RoMEO" target="_blank">SHERPA/RoMEO</a>  site provides information about publisher copyright policies.</p>
<p>Unless otherwise noted, documents posted in Trace are the property of their respective authors. Authors who deposit material in the repository agree to the following:</p>

<div class="indent">
  <p>I hold the copyright to this document, or have been authorized by the copyright holder(s) to upload it for distribution, and agree to permit this document to be posted in Trace, and made available to the public in any format in perpetuity.</p>
  <p>To the best of my knowledge, I warrant that the posting of the work does not infringe any copyright, nor violate any proprietary rights, nor contains any libelous matter, nor invade the privacy of any person or third party, nor otherwise violate Trace policies.</p>
</div>

<p>All permission requests should be directed to the individual authors or the stated holders of copyright. The University of Tennessee claims no rights over the content in Trace. For more information about copyright, please see the University Libraries Scholarly Communication Copyright pages at <a href="http://www.lib.utk.edu/scholar/copyright/" target="_blank">http://www.lib.utk.edu/scholar/copyright/</a>.</p>

<h3>Author Review</h3>
<p>Trace automatically creates a PDF from a Word or rtf document; in some cases the author should check the PDF once a paper has been uploaded to the system but before it is posted. The decision to have author review or not is the responsibility of each unit. The exception is peer-reviewed series and journals, where author review is essential.</p>

<h3>Formats Supported and Preservation</h3>
<p>Trace recommends the use of particular file types to increase the likelihood of safely migrating files into the future. Word and RTF files are converted to PDF when they are imported into the repository. For more information on preparing PDF versions of papers, see our file format and conversion guide.</p>
<p>We recommend the following formats as most likely to migrate effectively:</p>
<div class="indent">
  <p>Images: JPEG, PNG, GIF, TIFF</p>
  <p>Audio: AIFF, MP3 "unprotected" (DRM-free) AAC, WAVE</p>
  <p>Video: MPEG, QuickTime</p>
  <p>Data: XML, Comma-separated values</p>
</div>
<p>Other formats may be included for associated materials, but are less likely to be migrated when technology changes. Special arrangements for streaming video and for files larger than 100 MB should be made with the <a href="mailto:trace@utk.edu">Trace administrator</a>.</p>
<p>The library is committed to providing access to and preserving all contents of the repository. When we migrate to new formats, we will change the format of a file, but not the information in it. For example, the Trace administrator will not update hyperlinks, other external references, or out-of-date information within a paper or supplementary file. If file formats cease to be supported as a result of changes in technology and the private sector, beyond the control of the University Libraries, files in these formats may no longer function on current computer equipment and hence, become unusable. If a new repository platform is chosen, all content will be migrated and every effort made to ensure that all content continues to be accessible.</p>
<p>The commitment to provide persistent access to content in Trace applies only to material housed on servers maintained directly or under contract by the University Libraries. Links and access to content of any format referenced outside Trace cannot be guaranteed.</p>

<h3>Withdrawal of Materials</h3>
<p>Trace is meant to be a permanent scholarly record (working papers may be an exception). Once an item is deposited, a citation to it will always remain. Removing content is discouraged. However, authors may request the community manager to remove an item, except for peer-review series and journals, where removal is not allowed. No files will be removed by the Trace administrator or community managers without author notification. If a contributor leaves the University, the material will remain in Trace; upon request, new contact information will be added to the files.</p>

<h3>Suppression of Materials</h3>
<p>Trace is meant to provide open access to content. However, authors may request that the community manager restrict access according to community guidelines. The system is designed to enable communities to host subscription-based content.</p>
</div>
POLICY_BODY;





$home_nid = create_named_page("home", "", $home_body);

$submit_nid = create_named_page("submit", "Deposit Your Work", $submit_body);
add_menu_link_to_trace_navigation($submit_nid, "user-menu", "Submit", 9);

$about_nid = create_named_page("about", "About TRACE", "$about_body");
add_menu_link_to_trace_navigation($about_nid, "trace-navigation", "About TRACE", 0);

#$policy_nid = create_named_page("policy", "Policy", "$policy_body");
#add_menu_link_to_trace_navigation($policy_nid, "trace-navigation", "Policy", 5);

$browse_nid = create_named_page("browse", "", "");
add_menu_link_to_trace_navigation($browse_nid, "trace-navigation", "Browse Collections", 2);

$help_nid = create_named_page("help", "Help", "$help_body");
add_menu_link_to_trace_navigation($help_nid, "trace-navigation", "Help", 4);
