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
    <h4>Tennessee Research and Creative Exchange (TRACE) is the University of Tennessee’s open repository.</h4>

            <p>
                <img class="alignright" alt="UT students walking on a sidewalk" src="https://www.lib.utk.edu/template/2016/images-utlibraries/trace-home.jpg">TRACE shines a light on UT scholarship, giving the public access to Volunteers’ research and creative work.
            </p>
            <p>
                The UT Libraries encourage Volunteer faculty and graduate students to submit work to TRACE in order to:
            </p>
            <ul>
                <li>
                    Make your work visible in Google Scholar.
                </li>
                <li>
                    Give the public access to your work.
                </li>
                <li>
                    Increase citation counts through greater visibility and availability.
                </li>
                <li>
                  Share not only articles but also presentations, data sets, white papers, and other files, with a permanent URL for every item.
                </li>
                <li>
                    Follow the number of downloads of your work worldwide.
                </li>
                <li>
                    Preserve your work long-term.
                </li>
                <li>
		                <a href="/iby">Find latest publications! Search by date across all Collections.</a>
		            </li>
            </ul>
HOME_BODY;

$help_body =  <<<HELP_BODY
<h4>Contact</h4>
<p>Rachel Caldwell - rachelcaldwell@utk.edu</p>

<h4>
    Do you want to deposit your work in TRACE? Go to the:
</h4>
<ul>
    <li><a href="http://libguides.utk.edu/trace/authors" rel="nofollow" title="Follow link">Submission Guide for Individual Authors/Researchers</a>
    </li>
    <li><a href="http://libguides.utk.edu/trace/coordinators" rel="nofollow" title="Follow link">Submission Guide for Collection Coordinators</a>
    </li>
    <li><a href="http://libguides.utk.edu/trace/graduate" rel="nofollow" title="Follow link">Submission Guide for Graduate Students (Theses and Dissertations)</a>
    </li>
</ul>
<br/><br/><br/><br/><br/>
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

$policy_body =  <<<POLICY_BODY
<div id="policies">
<p>Trace, the Tennessee Research and Creative Exchange digital repository at the University of Tennessee, provides long-term access and preservation services for the intellectual and creative output of the university's academic, research, and administrative
  communities. The digital repository is open access, making content freely available, worldwide, under the following conditions and terms.</p>

<h3>Organization</h3>
<p>Trace is organized by communities - academic and other units at the University of Tennessee. Any school, academic department or program, research center or research institute at the University of Tennessee, as well as other administrative units that can
  assume responsibility for setting and administering policies, is eligible to form a community in the digital repository. Each community assigns a community manager who works with the University Libraries to support Trace.</p>
<p>Communities develop, in consultation with the Trace administrator, policies addressing: 1) Items appropriate for a particular collection; 2) Electronic format acceptable for a particular collection; and 3) Guidelines for contributors.</p>
<p>Trace is directed by the University Libraries Scholarly Communication department head. A Trace administrator oversees technical support and the addition of content. Campus stakeholders who serve on the Trace Advisory Group assist with the solicitation
  of new content and training of repository contributors.</p>

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
<p>Any content is appropriate if all applicable policies are followed (e.g., copyright), if the content can be posted using existing format types (i.e., technically feasible), and if the sponsoring unit decides it is appropriate. Posting bibliographic citations
  or abstracts alone cannot be accommodated without the full text of a work. Examples of appropriate Trace content include:</p>
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
<p>Trace also supports peer-reviewed series and journals. If you are considering the repository for peer-reviewed content, visit <a href="http://www.trace.tennessee.edu/" title="Trace">www.trace.tennessee.edu</a> to determine if this is the right forum for
  your scholarship. Additionally, a conference or seminar series can be established within any department, center, or research unit participating in the repository. Creation of schedules and uploading of content is managed by the community manager of
  the sponsoring unit. If you are considering hosting a seminar series in the repository, contact the
  <a href="mailto:trace@utk.edu">Trace administrator</a>.</p>

<h3>Copyright and Author Agreements</h3>
<p>Authors must own the copyright for work submitted to Trace. Authors grant the university a non-exclusive, perpetual right to use the digital assets for non-commercial use. Because authors retain the copyright for all content posted in the repository,
  they are free to reuse the content elsewhere.</p>
<p>If a working paper is published in a journal - either in the same form or, more commonly, in revised form - many journals allow the working paper to continue to be openly accessible, especially when it is for educational/scholarly noncommercial use. While
  some journals require that the working paper be removed, others grant exceptions for institutional repositories, but must be asked.</p>
<p>The author is responsible for negotiating the terms of publication agreements. The repository constitutes noncommercial use. Faculty who wish to include a reprint of a journal article in the repository should consult their agreement with the journal to
  see if posting in a repository is allowed. Authors who have transferred copyrights may seek permission of the copyright holder to publish it in the repository. The <a href="http://www.sherpa.ac.uk/projects/sherparomeo.html" title="SHERPA/RoMEO" target="_blank">SHERPA/RoMEO</a>  site provides information about publisher copyright policies.</p>
<p>Unless otherwise noted, documents posted in Trace are the property of their respective authors. Authors who deposit material in the repository agree to the following:</p>

<div class="indent">
  <p>I hold the copyright to this document, or have been authorized by the copyright holder(s) to upload it for distribution, and agree to permit this document to be posted in Trace, and made available to the public in any format in perpetuity.</p>
  <p>To the best of my knowledge, I warrant that the posting of the work does not infringe any copyright, nor violate any proprietary rights, nor contains any libelous matter, nor invade the privacy of any person or third party, nor otherwise violate Trace
    policies.</p>
</div>

<p>All permission requests should be directed to the individual authors or the stated holders of copyright. The University of Tennessee claims no rights over the content in Trace. For more information about copyright, please see the University Libraries
  Scholarly Communication Copyright pages at <a href="http://www.lib.utk.edu/scholar/copyright/" target="_blank">http://www.lib.utk.edu/scholar/copyright/</a>.</p>

<h3>Author Review</h3>
<p>Trace automatically creates a PDF from a Word or rtf document; in some cases the author should check the PDF once a paper has been uploaded to the system but before it is posted. The decision to have author review or not is the responsibility of each
  unit. The exception is peer-reviewed series and journals, where author review is essential.</p>

<h3>Formats Supported and Preservation</h3>
<p>Trace recommends the use of particular file types to increase the likelihood of safely migrating files into the future. Word and RTF files are converted to PDF when they are imported into the repository. For more information on preparing PDF versions
  of papers, see our file format and conversion guide.</p>
<p>We recommend the following formats as most likely to migrate effectively:</p>
<div class="indent">
  <p>Images: JPEG, PNG, GIF, TIFF</p>
  <p>Audio: AIFF, MP3 "unprotected" (DRM-free) AAC, WAVE</p>
  <p>Video: MPEG, QuickTime</p>
  <p>Data: XML, Comma-separated values</p>
</div>
<p>Other formats may be included for associated materials, but are less likely to be migrated when technology changes. Special arrangements for streaming video and for files larger than 100 MB should be made with the <a href="mailto:trace@utk.edu">Trace administrator</a>.</p>
<p>The library is committed to providing access to and preserving all contents of the repository. When we migrate to new formats, we will change the format of a file, but not the information in it. For example, the Trace administrator will not update hyperlinks,
  other external references, or out-of-date information within a paper or supplementary file. If file formats cease to be supported as a result of changes in technology and the private sector, beyond the control of the University Libraries, files in these
  formats may no longer function on current computer equipment and hence, become unusable. If a new repository platform is chosen, all content will be migrated and every effort made to ensure that all content continues to be accessible.</p>
<p>The commitment to provide persistent access to content in Trace applies only to material housed on servers maintained directly or under contract by the University Libraries. Links and access to content of any format referenced outside Trace cannot be
  guaranteed.</p>

<h3>Withdrawal of Materials</h3>
<p>Trace is meant to be a permanent scholarly record (working papers may be an exception). Once an item is deposited, a citation to it will always remain. Removing content is discouraged. However, authors may request the community manager to remove an item,
  except for peer-review series and journals, where removal is not allowed. No files will be removed by the Trace administrator or community managers without author notification. If a contributor leaves the University, the material will remain in Trace;
  upon request, new contact information will be added to the files.</p>

<h3>Suppression of Materials</h3>
<p>Trace is meant to provide open access to content. However, authors may request that the community manager restrict access according to community guidelines. The system is designed to enable communities to host subscription-based content.</p>
</div>
POLICY_BODY;

$about_body =  <<<ABOUT_BODY
  <div id="about_body">
    <h1>
        TRACE GUIDELINES
    </h1>
    <p>
        July 2017
    </p>
    <ul>
        <li>
            About TRACE
        </li>
        <li>
            Benefits of TRACE
        </li>
        <li>
            Copyright, Licensing, and General Use Guidelines
        </li>
        <li>
            Content Guidelines
        </li>
        <li>
            Withdrawal of Items
        </li>
        <li>
            Author/Researcher Submissions
        </li>
        <li>
            UT Community Submissions
        </li>
        <li>
            Credits
        </li>
    </ul>
    <h3>
        About TRACE
    </h3>
    <p>
        Tennessee Research and Creative Exchange (TRACE) is the University of Tennessee&#8217;s public access digital repository. Created and maintained by the University of Tennessee (UT) Libraries, TRACE is a venue and archive for Volunteers&#8217; research and creative works.
    </p>
    <p>
        TRACE contains scholarly works by UT faculty, staff, and graduate students, as well as documents from the University Archives. Content includes journal articles, technical reports, data sets, theses and dissertations, conference papers and presentations, book chapters, and other scholarly materials. These materials, and materials that are of historical value to the university, are the main focus of the collection. In addition, student work that is sponsored or approved by a faculty member, academic department, or campus unit, may be added.
    </p>
    <p>
        TRACE helps fulfill the Libraries&#8217; mission to provide &#8220;expertise and leadership in accessing, creating, disseminating, and preserving knowledge.&#8221;
    </p>
    <h3>
        Benefits of TRACE
    </h3>
    <p>
        UT Volunteers&#8217; research, creativity, and service make a difference in people&#8217;s lives. TRACE increases the reach of this scholarly work, broadening the audience and the impact by making Volunteer scholarship accessible to the public. TRACE supports the University&#8217;s mission to &#8220;move forward the frontiers of human knowledge and enrich and elevate the citizens of the state of Tennessee, the nation, and the world.&#8221;
    </p>
    <p>
        Adding your work to TRACE:
    </p>
    <ul>
      <li>
          Makes your work visible in Google Scholar.
      </li>
      <li>
          Gives the public access to your work.
      </li>
      <li> Increases citation counts through greater visibility and availability.
      </li>
      <li> Provides an additional metric of number of downloads of your work worldwide, demonstrating a broader audience for audience for your work than you might imagine.
      </li>
      <li> Is an option for long-term preservation of your work.
      </li>
      <li> Improves the findability of your work, since each item is assigned a permanent URL.
      </li>
    </ul>
    <p>
        The Libraries strives to provide good metadata in order to enhance the sharing and discoverability of resources. Content in TRACE will be preserved using accepted preservation techniques, with the recognition that changing file formats may lead to loss of functionality. Submitters are strongly encouraged to review the <a href="http://libguides.utk.edu/trace">TRACE Submission Guide</a> for assistance with descriptive metadata, linking to versions of record, verifying copyright permissions to submit work, and understanding preferred file formats for preservation.
    </p>
    <h1>
        Copyright, Licensing, and General Use Guidelines
    </h1>
    <p>
        All users are expected to follow University of Tennessee policies, including the Acceptable Use Policy&lt;link&gt;. Note that, in most but not all cases, UT faculty and students own the copyrights to their work; however, they may transfer those rights to another copyright holder, such as a journal publisher.
    </p>
    <p>
        Unless otherwise noted, copyright of each publication belongs to the author(s) of the work. Reproduction of any work in TRACE requires permission of the author(s) or other specified copyright holder, unless a work is in the public domain, or a use constitutes fair use. In all cases, proper attribution is required.
    </p>
    <p>
        UT faculty, staff, and students submitting to TRACE will be prompted to review and accept a non-exclusive deposit license as part of the submission process. For more information, go to &#8220;Author/Researcher Submissions&#8221; below.
    </p>
    <p>
        UT Libraries agrees to retain and maintain content submitted to TRACE and distribute content according to collection decisions. The Libraries/TRACE will notify users of significant changes to content, e.g., format migration for preservation purposes. If UT Libraries ceases to support TRACE, the Libraries will return collections to existing collection coordinators and transfer to the University Archives collections of communities or units that have ceased to exist.
    </p>
    <h3>
      Content Guidelines
    </h3>
    <p>
        The collections in TRACE are focused on the research, scholarship, creative works of UT faculty and researchers, and in some cases students, as well as materials that document the history of the university and reflect its intellectual environment.
    </p>
    <p>
        Examples of potential content include but are not limited to:
    </p>
    <ul type="disc">
        <li>
            Scholarly articles
        </li>
        <li>
            Books, book chapters, and manuscripts
        </li>
        <li>
            Theses and dissertations
        </li>
        <li>
            Conference papers and presentations
        </li>
        <li>
            University documents such as speeches, departmental bulletins and newsletters, scrapbooks, etc., as determined by the University Archivist
        </li>
        <li>
            Working papers and technical reports
        </li>
        <li>
            Art and creative works
        </li>
        <li>
            Software/code
        </li>
        <li>
            Datasets
        </li>
        <li>
            Journals published at UT or edited by UT researchers
        </li>
        <li>
            Audio and visual materials related to the intellectual endeavors of administrative units on campus or created by faculty in the course of their research and/or scholarly work.
        </li>
        <li>
            Works by undergraduates that are approved by faculty members or academic department or unit, including senior projects or theses and honors theses.
        </li>
    </ul>
    <p>
        Some content may not currently be accepted for deposit into TRACE either because it does not meet the general guidelines above or due to issues of copyright or technical limitations. For clarification of what can be deposited in TRACE, please contact <a href="mailto:trace@utk.edu">trace@utk.edu</a>.
    </p>
    <p>
        Graduate students submitting a thesis or dissertation to the TRACE Graduate Theses and Dissertation collection, which is administered by the Graduate School, are strongly encouraged to review the <a href="http://libguides.utk.edu/trace/graduate"> TRACE Submission Guide for Graduate Students</a>.
    </p>
    <h3>
        Withdrawal of Items
    </h3>
    <p>
        Items may be withdrawn from TRACE at the request of the author, the direction of the Provost or General Counsel, or by legal order. Withdrawn items will be removed from public access but metadata may still be visible and files will be retained in the repository. Withdrawal requests should be directed to <a href="mailto:trace@utk.edu">trace@utk.edu</a>.
    </p>
    <h1>
        Author/Researcher Submissions
    </h1>
    <p>
        For works submitted by individuals, including researchers and authors:
    </p>
    <ul type="disc">
        <li>
            The work should be produced, submitted or sponsored by UT faculty.
        </li>
        <li>
            The work must be scholarly in nature (original research, creative work, or teaching materials). See &#8220;Content Guidelines&#8221; &lt;link&gt;.
        </li>
        <li>
            The work should be complete and ready for distribution.
        </li>
        <li>
            The author/owner must be willing and able to grant UT the right to preserve and distribute the work via TRACE.
        </li>
        <li>
            If the work is part of a series, other works in the series should also be contributed so that TRACE can offer as full a set as possible.
        </li>
    </ul>
    <p>
      Submissions may be reviewed by TRACE administrators. Submitters take full responsibility for determining their right to deposit the work. Submitters grant a non-exclusive deposit license to TRACE/The University of Tennessee to distribute the work.
    </p>
    <h3>
      UT Community Submissions
    </h3>
    <p>
      UT administrative units or affiliates may wish to share their work in TRACE. Units that can add materials must:
    </p>
    <ul>
        <li>
            produce research or administrative records,
        </li>
        <li>
            have defined leaders,
        </li>
        <li>
            have long-term stability,
        </li>
        <li> assume responsibility for setting collection policies.
        </li>
    </ul>
    <p>
        Units with a collection in TRACE must assign one or more collection coordinators who can work with TRACE staff. That/Those collection coordinator(s) agree to:
    </p>
    <ul type="disc">
        <li>
            Arrange for submission and description of content
        </li>
        <li>
            Make decisions about collection definitions
        </li>
        <li>
            Notify TRACE of organizational changes affecting submissions
        </li>
        <li>
            Reply to annual reconfirmation of community information
        </li>
        <li>
            Understand and observe Institute policies relevant to TRACE, and educate community submitters regarding these policies
        </li>
        <li>
            Clear copyright or obtain permissions for items submitted when copyright owner is other than author(s) or UT
        </li>
        <li>
            Decide upon a submission workflow for each collection*
        </li>
    </ul>
    <p>
        *Review the <a href="http://libguides.utk.edu/trace/coordinators"> TRACE Collection Coordinator Guide</a> for more information.
    </p>
    <p>
        A collection coordinator may:
    </p>
    <ul type="disc">
        <li>
            Decide policy regarding content to be submitted (within TRACE guidelines)
        </li>
        <li>
            Decide who may submit content within the community
        </li>
        <li>
            Receive a copy of submitted content upon request
        </li>
        <li>
            Remove items and collections (as outlined in "Withdrawal of Items")
        </li>
        <li>
            Approve addition of or elimination of collections
        </li>
    </ul>
    <p>
      Contact <a href="mailto:trace@utk.edu">trace@utk.edu</a> to learn more about creating a collection or defining a collection submission workflow.
    </p>
    <h1>
        Credits
    </h1>
    <p>
        These guidelines were adapted from the Massachusetts Institute of Technology and the University of Kansas about their respective repositories, <a href="https://dspace.mit.edu/">DSpace</a> and <a href="https://kuscholarworks.ku.edu/">KU ScholarWorks</a>.
    </p>
  </div>
ABOUT_BODY;


$privacy_policy_body = <<<PRIVACY_BODY
<div class="field field-name-body field-type-text-with-summary field-label-hidden">
  <div class="field-items">
    <div class="field-item even">
      <h1>This is a DRAFT.</h1>
      <p>This Privacy Policy discloses the privacy practices for UTK.edu and trace.utk.edu. For the purposes of this Privacy Policy, unless otherwise noted, all references to "UTK.edu " include trace.utk.edu.</p>

      <p><strong>WHAT INFORMATION DO WE GATHER ABOUT YOU?</strong></p>

      <p>We collect information from you when you access UTK.edu.</p>

      <p><strong>WHAT DO WE USE YOUR INFORMATION FOR?</strong></p>

      <p>We use your IP address to help diagnose problems with our server and to administer our website by identifying (1) which parts of our site are most heavily used, and (2) which portion of our audience comes from within the Harvard network. We do not link IP addresses to anything personally identifiable. This means that user sessions will be tracked, but the users will remain anonymous.</p>

      <p>The email address you provide may be used to send you information, respond to inquiries, and/or other requests or questions.</p>

      <p>User information may be shared with third-party partners to the extent necessary to provide and improve web services or other communications to users. Any third parties who receive user information for this purpose are prohibited from using or sharing user information for any purpose other than providing services to users.</p>

      <p>We may also provide your information to third parties in circumstances where we believe that doing so is necessary or appropriate to: satisfy any applicable law, regulation, legal process or governmental request; detect, prevent or otherwise address fraud, security or technical issues; or protect the rights, property or safety of us, our users or others.</p>

      <p><strong>DEVICE INFORMATION COLLECTED BY US</strong></p>

      <p>We may collect non-personal information about the computer, mobile device or other device you use to access UTK.edu, such as IP address, geolocation information, unique device identifiers, browser type, browser language or other information of this nature. We use this information in an aggregate fashion to track access to UTK.edu. At no time do we disclose site usage by individual IP addresses. Web server logs are retained on a temporary basis and then deleted from our systems.</p>

      <p><strong>COOKIES</strong></p>

      <p>Cookies are small files that are stored on your computer (unless you block them). We use cookies to understand and save your preferences for future visits and compile aggregate data about site traffic and site interaction so that we can offer better site experiences and tools in the future. We may contract with third-party service providers to assist us in better understanding our site visitors. These service providers are not permitted to use the information collected on our behalf except to help us conduct and improve our business.</p>

      <p><strong>THIRD-PARTY COOKIES</strong></p>

      <p>Cookies may be set by an organization other than UTK.edu. These “third-party cookies” may, for example, originate from websites such as YouTube, Twitter, Facebook, Google Plus or other social media services for which UTK.edu has implemented “plug-ins.” Since the cookie policies of these sites change over time, you should determine their policies by visiting the privacy policy pages of these sites directly.</p>

      <p>You may disable cookies through your individual browser options. If you would like to learn more about cookies please refer to the following website:&nbsp;<a href="http://www.allaboutcookies.org/">http://www.allaboutcookies.org/</a></p>

      <p><strong>LINKS TO THIRD-PARTY WEBSITES</strong></p>

      <p>We may provide hyperlinks to third-party websites as a convenience to users of UTK.edu. UTK.edu does not control third-party websites and is not responsible for the contents of any linked-to, third-party websites or any hyperlink in a linked-to website. We are not responsible for the privacy practices or the content of third-party websites.</p>

      <p><strong>EMAIL POLICY</strong></p>

      <p>We will not share, sell, rent, swap or authorize any third party to use your email address for commercial purposes without your permission.</p>

      <p><strong>INFORMATION PROTECTION</strong></p>

      <p>To prevent unauthorized access, maintain data accuracy and ensure the appropriate use of information we gather about you, we have taken commercially reasonable steps to protect the information. However, no method of transmission over the Internet, or method of electronic storage, is 100% secure.</p>

      <p><strong>CHANGES TO THIS POLICY</strong></p>

      <p>This Privacy Policy may be amended from time to time. Any such changes will be posted on this page. The effective date of this policy was O7/01/2017.</p>
    </div>
  </div>
</div>

PRIVACY_BODY;

$iby_body = <<<IBY_BODY
Search most recent publications.
<ul>
<li><a href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateIssued_dt:[NOW-14DAYS%20TO%20NOW]?type=edismax&sort=mods_originInfo_encoding_etdf_keyDate_yes_dateIssued_dt%20desc">Last 2 weeks</a></li>
<li><a href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateIssued_dt:[NOW-183DAYS%20TO%20NOW]?type=edismax&sort=mods_originInfo_encoding_etdf_keyDate_yes_dateIssued_dt%20desc">Last 6 months</a></li>
</ul>
<p>
Search by year of publication.
<ul>
<li><a href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateIssued_dt:[2018-01-01T00:00:00Z TO 2018-12-31T23:59:59Z]?type=edismax&sort=mods_originInfo_encoding_etdf_keyDate_yes_dateIssued_dt%20desc">2018</a></li>
<li><a href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateIssued_dt:[2017-01-01T00:00:00Z TO 2017-12-31T23:59:59Z]?type=edismax&sort=mods_originInfo_encoding_etdf_keyDate_yes_dateIssued_dt%20desc">2017</a></li>
<li><a href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateIssued_dt:[2016-01-01T00:00:00Z TO 2016-12-31T23:59:59Z]?type=edismax&sort=mods_originInfo_encoding_etdf_keyDate_yes_dateIssued_dt%20desc">2016</a></li>
<li><a href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateIssued_dt:[2015-01-01T00:00:00Z TO 2015-12-31T23:59:59Z]?type=edismax&sort=mods_originInfo_encoding_etdf_keyDate_yes_dateIssued_dt%20desc">2015</a></li>
<li><a href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateIssued_dt:[2014-01-01T00:00:00Z TO 2014-12-31T23:59:59Z]?type=edismax&sort=mods_originInfo_encoding_etdf_keyDate_yes_dateIssued_dt%20desc">2014</a></li>
<li><a href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateIssued_dt:[2013-01-01T00:00:00Z TO 2013-12-31T23:59:59Z]?type=edismax&sort=mods_originInfo_encoding_etdf_keyDate_yes_dateIssued_dt%20desc">2013</a></li>
<li><a href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateIssued_dt:[2012-01-01T00:00:00Z TO 2012-12-31T23:59:59Z]?type=edismax&sort=mods_originInfo_encoding_etdf_keyDate_yes_dateIssued_dt%20desc">2012</a></li>
<li><a href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateIssued_dt:[2011-01-01T00:00:00Z TO 2011-12-31T23:59:59Z]?type=edismax&sort=mods_originInfo_encoding_etdf_keyDate_yes_dateIssued_dt%20desc">2011</a></li>
<li><a href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateIssued_dt:[2010-01-01T00:00:00Z TO 2010-12-31T23:59:59Z]?type=edismax&sort=mods_originInfo_encoding_etdf_keyDate_yes_dateIssued_dt%20desc">2010</a></li>
<li><a href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateIssued_dt:[2009-01-01T00:00:00Z TO 2009-12-31T23:59:59Z]?type=edismax&sort=mods_originInfo_encoding_etdf_keyDate_yes_dateIssued_dt%20desc">2009</a></li>
<li><a href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateIssued_dt:[2008-01-01T00:00:00Z TO 2008-12-31T23:59:59Z]?type=edismax&sort=mods_originInfo_encoding_etdf_keyDate_yes_dateIssued_dt%20desc">2008</a></li>
<li><a href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateIssued_dt:[2007-01-01T00:00:00Z TO 2007-12-31T23:59:59Z]?type=edismax&sort=mods_originInfo_encoding_etdf_keyDate_yes_dateIssued_dt%20desc">2007</a></li>
<li><a href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateIssued_dt:[2006-01-01T00:00:00Z TO 2006-12-31T23:59:59Z]?type=edismax&sort=mods_originInfo_encoding_etdf_keyDate_yes_dateIssued_dt%20desc">2006</a></li>
<li><a href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateIssued_dt:[2005-01-01T00:00:00Z TO 2005-12-31T23:59:59Z]?type=edismax&sort=mods_originInfo_encoding_etdf_keyDate_yes_dateIssued_dt%20desc">2005</a></li>
<li><a href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateIssued_dt:[2004-01-01T00:00:00Z TO 2004-12-31T23:59:59Z]?type=edismax&sort=mods_originInfo_encoding_etdf_keyDate_yes_dateIssued_dt%20desc">2004</a></li>
<li><a href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateIssued_dt:[2003-01-01T00:00:00Z TO 2003-12-31T23:59:59Z]?type=edismax&sort=mods_originInfo_encoding_etdf_keyDate_yes_dateIssued_dt%20desc">2003</a></li>
<li><a href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateIssued_dt:[2002-01-01T00:00:00Z TO 2002-12-31T23:59:59Z]?type=edismax&sort=mods_originInfo_encoding_etdf_keyDate_yes_dateIssued_dt%20desc">2002</a></li>
<li><a href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateIssued_dt:[2001-01-01T00:00:00Z TO 2001-12-31T23:59:59Z]?type=edismax&sort=mods_originInfo_encoding_etdf_keyDate_yes_dateIssued_dt%20desc">2001</a></li>
<li><a href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateIssued_dt:[2000-01-01T00:00:00Z TO 2000-12-31T23:59:59Z]?type=edismax&sort=mods_originInfo_encoding_etdf_keyDate_yes_dateIssued_dt%20desc">2000</a></li>
</ul>
<p>
Search by decade of publication.
<ul>
<li><a href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateIssued_dt:[2000-01-01T00:00:00Z%20TO%202009-12-31T23:59:59Z]?type=edismax&sort=mods_originInfo_encoding_etdf_keyDate_yes_dateIssued_dt%20desc">2000-2009</a></li>
<li><a href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateIssued_dt:[1990-01-01T00:00:00Z%20TO%201999-12-31T23:59:59Z]?type=edismax&sort=mods_originInfo_encoding_etdf_keyDate_yes_dateIssued_dt%20desc">1990-1999</a></li>
<li><a href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateIssued_dt:[1980-01-01T00:00:00Z%20TO%201989-12-31T23:59:59Z]?type=edismax&sort=mods_originInfo_encoding_etdf_keyDate_yes_dateIssued_dt%20desc">1980-1989</a></li>
<li><a href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateIssued_dt:[1970-01-01T00:00:00Z%20TO%201979-12-31T23:59:59Z]?type=edismax&sort=mods_originInfo_encoding_etdf_keyDate_yes_dateIssued_dt%20desc">1970-1979</a></li>
<li><a href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateIssued_dt:[1960-01-01T00:00:00Z%20TO%201969-12-31T23:59:59Z]?type=edismax&sort=mods_originInfo_encoding_etdf_keyDate_yes_dateIssued_dt%20desc">1960-1969</a></li>
<li><a href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateIssued_dt:[1950-01-01T00:00:00Z%20TO%201959-12-31T23:59:59Z]?type=edismax&sort=mods_originInfo_encoding_etdf_keyDate_yes_dateIssued_dt%20desc">1950-1959</a></li>
<li><a href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateIssued_dt:[1940-01-01T00:00:00Z%20TO%201949-12-31T23:59:59Z]?type=edismax&sort=mods_originInfo_encoding_etdf_keyDate_yes_dateIssued_dt%20desc">1940-1949</a></li>
<li><a href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateIssued_dt:[1900-01-01T00:00:00Z%20TO%201939-12-31T23:59:59Z]?type=edismax&sort=mods_originInfo_encoding_etdf_keyDate_yes_dateIssued_dt%20desc">1900-1939</a></li>
<li><a href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateIssued_dt:[1000-01-01T00:00:00Z%20TO%201899-12-31T23:59:59Z]?type=edismax&sort=mods_originInfo_encoding_etdf_keyDate_yes_dateIssued_dt%20desc">Before 1900</a></li>
</ul>


IBY_BODY;


$iby_nid = create_named_page("iby","Search by publication date","$iby_body");
//add_menu_link_to_trace_navigation($iby_nid, "trace-navigation", "Search-by-date", 9);


$home_nid = create_named_page("home", "Welcome to TRACE", $home_body);
add_menu_link_to_trace_navigation($home_nid, "trace-navigation", "Home", 1);

$about_nid = create_named_page("about", "About TRACE", "$about_body");
add_menu_link_to_trace_navigation($about_nid, "trace-navigation", "About TRACE", 2);

$browse_nid = create_named_page("browse", "", "");
add_menu_link_to_trace_navigation($browse_nid, "trace-navigation", "Browse Collections", 3);

$help_nid = create_named_page("help", "Help", "$help_body");
add_menu_link_to_trace_navigation($help_nid, "trace-navigation", "Help", 4);

$policy_nid = create_named_page("policy", "Policy", "$policy_body");
// add_menu_link_to_trace_navigation($policy_nid, "trace-navigation", "Policy", 5);

$privacy_policy_body_nid = create_named_page("privacy_policy", "Privacy Policy", "$privacy_policy_body");
// add_menu_link_to_trace_navigation($privacy_policy_body_nid, "trace-navigation", "Privacy Policy", 6);

$submit_nid = create_named_page("submit", "Deposit Your Work", $submit_body);
add_menu_link_to_trace_navigation($submit_nid, "user-menu", "Submit", 9);
