<?php
/**
 * @file
 * Islandora_solr_metadata display template.
 *
 * Variables available:
 * - $solr_fields: Array of results returned from Solr for the current object
 *   based upon defined display configuration(s). The array structure is:
 *   - display_label: The defined display label corresponding to the Solr field
 *     as defined in the configuration in translatable string form.
 *   - value: An array containing all the result(s) found for the specific field
 *     in Solr for the current object when queried against Solr.
 * - $found: Boolean indicating if a Solr doc was found for the current object.
 * - $not_found_message: A string to print if there was no document found in
 *   Solr.
 *
 * @see template_preprocess_islandora_solr_metadata_display()
 * @see template_process_islandora_solr_metadata_display()
 */
// find if user has thesis_manager role
if (in_array('thesis_manager_role', $user->roles)) {
  $thesis_manager_role = TRUE;
  // pull in object info
  $islandora_object=$variables['islandora_object'];
  // get pid
  $pid = $islandora_object->id;
  // get state
  $state = $islandora_object->state;
  // get workflow state
  $wfstate = db_select('trace_workflow_pids', 'q')
     ->fields('q', array('state'))
     ->condition('pid', "$pid")
     ->execute()
     ->fetchField();
  if (($state == 'I')&&($wfstate == 's')) {
    // get owner
    $ownerid = $islandora_object->owner;
    // get owner email
    $ownermail = db_select('users', 'q')
        ->fields('q', array('mail'))
        ->condition('name', "$ownerid")
        ->execute()
        ->fetchField();
    // also get thesis_manager email
    $tm_mail = $user->mail;
    //
    $prevmess = FALSE;
    $messages = '';
    // detect whether MESSAGES datastream exists
    if (isset($islandora_object['MESSAGES'])) {
      $prevmess = TRUE;
      $messages = $islandora_object->getDatastream('MESSAGES')->content;
    }
    //print t("tm role = $thesis_manager_role <br />");
    //print t("PID = $pid <br />");
    //print t("state = $state <br />");
    //print t("owner = $ownerid <br />");
    //print t("ownermail = $ownermail <br />");
    $submit = '';
    $newmess = '';
    if (isset($_POST['submit'])) $submit = $_POST['submit'];
    if (isset($_POST['bodytext'])) $bodytext = $_POST['bodytext'];
    if ($submit == "Send Message") { // process message and ds
      if ($prevmess) {
        $newmess = $messages;
      }
      $newmess.= "-------------------------------------------------";
      $newmess.= "FROM: Thesis Manager\n";
      $newmess.= "TO: $ownermail  CC: $tm_mail\n";
      $newmess.= "SUBJECT: Message from the Thesis Manager\n";
      $now = "Date: ".date("Y-m-d H:i:s");
      $newmess.= "$now \n";
      $newmess.= "$bodytext \n";
      // add new MESSAGES ds
      if (!$prevmess) {
        $ds = $islandora_object->constructDatastream('MESSAGES', 'M');
        $ds->label = "messages.txt";
        $ds->mimetype = "text/plain";
        $ds->setContentFromString($newmess);
        $islandora_object->ingestDatastream($ds);
      } else {
        $islandora_object['MESSAGES']->setContentFromString("$newmess");
      }
      //send email
      $subject = "Message from the Thesis Manager";
      $header = "From: ".$tm_mail. "\r\n"; //optional headerfields
      $to = $ownermail." ".$tm_mail. "\r\n";
      //$to = "\r\n";
      if (mail($to, $subject, $bodytext, $header))  {
        drupal_set_message('The message was sent.');
      } else {
        drupal_set_message('There was an error sending the message.');
      }
      // clear and reload
      $bodytext=$submit = '';
      header("Location: /islandora/object/$pid");
      exit();
    } else { // create the form
      //$starttext = "This is the WRONG standard text.\n";
      //Replace per TRAC-815
      $starttext = date("Y-m-d H:i:s");
      print t("<div>");
      if ($prevmess) {
        print l(t('View the Previous Messages'), "islandora/object/$pid/datastream/MESSAGES/view");
      }else{
        print t('No Previous Messages');
      }
      print t("</div>");
      print "<div id=\"tm_mail\">\n";
      print "<b>Email the owner: $ownermail CC: $tm_mail </b><br/>";
      print "<b>Subject: Message from the Thesis Manager</b> <br />";
      print "<form action=\"#\" method=\"post\">\n";
      print '<label for="template_email">Select a template for email</label>';
      print '<select id="template_email" onchange="myFunction(this.value,\''.$ownerid.'\',\''.$tm_mail.'\')">';
			print '  <option value="nothing">Simple Date-only Email Template</option>';
      print '  <option value="more_edits_required">Additional Edits Needed</option>';
      print '  <option value="accepted_student_submission">Notification of Acceptance</option>';
      print '</select>';
      print '<br/>';
      print "<textarea id=\"email_textarea\"name=\"bodytext\" rows=\"10\" cols=\"100\">$starttext</textarea>\n";
      print "<br/><input type=\"submit\" name=\"submit\" value=\"Send Message\" />\n";
      print "</form>\n";
      print "</div>\n";
    }// end else
  } //end if state
} //end if thesis_manager_role
// drupal_add_js(array('UTKdrupal' => array('testvar' => $testVariable)), array('type' => 'setting'));

drupal_add_js(drupal_get_path('theme', 'UTKdrupal') .'/js/email_etd_feedback.js','file');
?>
<?php if ($found):
  if (!(empty($solr_fields) && variable_get('islandora_solr_metadata_omit_empty_values', FALSE))):?>
<fieldset <?php $print ? print('class="islandora islandora-metadata"') : print('class="islandora islandora-metadata collapsible"');?>>
  <legend><span class="fieldset-legend"><?php print t('Details'); ?></span></legend>
  <div class="fieldset-wrapper">
    <dl xmlns:dcterms="http://purl.org/dc/terms/" class="islandora-inline-metadata islandora-metadata-fields">
      <?php $row_field = 0; ?>
      <?php foreach($solr_fields as $value): ?>
        <dt class="<?php print $row_field == 0 ? ' first' : ''; ?>">
          <?php print $value['display_label']; ?>
        </dt>
        <dd class="<?php print $row_field == 0 ? ' first' : ''; ?>">
          <?php print check_markup(implode("\n", $value['value']), 'islandora_solr_metadata_filtered_html'); ?>
        </dd>
        <?php $row_field++; ?>
      <?php endforeach; ?>
    </dl>
  </div>
</fieldset>
<?php endif; ?>
<?php else: ?>
  <fieldset <?php $print ? print('class="islandora islandora-metadata"') : print('class="islandora islandora-metadata collapsible collapsed"');?>>
    <legend><span class="fieldset-legend"><?php print t('Details'); ?></span></legend>
    <?php if (in_array('administrator',$GLOBALS['user']->roles)): ?>
      <div class="messages--warning messages warning">
        <?php print $not_found_message; ?>
      </div>
    <?php endif; ?>
  </fieldset>
<?php endif; ?>

<!-- START SEARCH-BY-DATe -->

<!-- ?php -->

/**
 * @file
 * Template file for default facets
 *
 * @TODO document available variables
 */
// $total_facets = count($buckets);
<@--  ?  test to see if this php block was the problem-->

<!-- BEGIN islandora-solr-facet.tpl.php -->

<ul role="listbox" class="<?php print $classes; ?>">
    <?php foreach ($buckets as $key => $bucket) : ?>
    <li role="option">

        <?php print $bucket['link']; ?>
        <span class="count">(<?php print $bucket['count']; ?>)</span>

        <span class="plusminus">

        <span class="plus_facet">
            <?php print $bucket['link_plus']; ?>
            <span role="tooltip" name="tooltipTextPlusText" aria-hidden="true" class="tooltiptext_plus">Contains this</span>
        </span>

        <span class="minus_facet">
            <?php print $bucket['link_minus']; ?>
            <span role="tooltip" name="tooltipTextMinusTest" aria-hidden="true" class="tooltiptext_minus">Excludes this</span>
        </span>

      </span>

    </li>
    <?php endforeach; ?>
</ul>
<!-- BEGIN BROWSE-BY-DATE -->
<h3>Browse Most Recent</h3>
<ul role="listbox" class="islandora-solr-facet">


    <li role="option">
        <a href="/islandora/search/timestamp%3A[NOW-10MINUTES%20TO%20NOW]?type=edismax&sort=timestamp+desc">Last 10 minutes</a>
        <span class="plusminus">
          <span class="plus_facet">
              <a rel="nofollow" href="/islandora/search/timestamp%3A[NOW-10MINUTES%20TO%20NOW]?type=edismax&sort=timestamp+desc" class="plus">+</a>
              <span role="tooltip" name="tooltipTextPlusText" aria-hidden="true" class="tooltiptext_plus">Contains this</span>
          </span>
          <span class="minus_facet">
              <a rel="nofollow" href="/islandora/search/timestamp%3A[NOW-10MINUTES%20TO%20NOW]?type=edismax&sort=timestamp+desc" class="minus">-</a>
              <span role="tooltip" name="tooltipTextMinusTest" aria-hidden="true" class="tooltiptext_minus">Excludes this</span>
          </span>
      </span>
    </li>


    <li role="option">
        <a href="/islandora/search/timestamp%3A[NOW-20MINUTES%20TO%20NOW]?type=edismax&sort=timestamp+desc">Last 20 minutes</a>
        <span class="plusminus">
          <span class="plus_facet">
              <a rel="nofollow" href="/islandora/search/timestamp%3A[NOW-20MINUTES%20TO%20NOW]?type=edismax&sort=timestamp+desc" class="plus">+</a>
              <span role="tooltip" name="tooltipTextPlusText" aria-hidden="true" class="tooltiptext_plus">Contains this</span>
          </span>
          <span class="minus_facet">
              <a rel="nofollow" href="/islandora/search/timestamp%3A[NOW-20MINUTES%20TO%20NOW]?type=edismax&sort=timestamp+desc" class="minus">-</a>
              <span role="tooltip" name="tooltipTextMinusTest" aria-hidden="true" class="tooltiptext_minus">Excludes this</span>
          </span>
      </span>
    </li>



    <li role="option">
        <a href="/islandora/search/timestamp%3A[NOW-30MINUTES%20TO%20NOW]?type=edismax&sort=timestamp+desc">Last 30 minutes</a>
        <span class="plusminus">
          <span class="plus_facet">
              <a rel="nofollow" href="/islandora/search/timestamp%3A[NOW-30MINUTES%20TO%20NOW]?type=edismax&sort=timestamp+desc" class="plus">+</a>
              <span role="tooltip" name="tooltipTextPlusText" aria-hidden="true" class="tooltiptext_plus">Contains this</span>
          </span>
          <span class="minus_facet">
              <a rel="nofollow" href="/islandora/search/timestamp%3A[NOW-30MINUTES%20TO%20NOW]?type=edismax&sort=timestamp+desc" class="minus">-</a>
              <span role="tooltip" name="tooltipTextMinusTest" aria-hidden="true" class="tooltiptext_minus">Excludes this</span>
          </span>
      </span>
    </li>


    <li role="option">
        <a href="/islandora/search/timestamp%3A[NOW-60MINUTES%20TO%20NOW]?type=edismax&sort=timestamp+desc">Last 60 minutes</a>
        <span class="plusminus">
          <span class="plus_facet">
              <a rel="nofollow" href="/islandora/search/timestamp%3A[NOW-60MINUTES%20TO%20NOW]?type=edismax&sort=timestamp+desc" class="plus">+</a>
              <span role="tooltip" name="tooltipTextPlusText" aria-hidden="true" class="tooltiptext_plus">Contains this</span>
          </span>
          <span class="minus_facet">
              <a rel="nofollow" href="/islandora/search/timestamp%3A[NOW-60MINUTES%20TO%20NOW]?type=edismax&sort=timestamp+desc" class="minus">-</a>
              <span role="tooltip" name="tooltipTextMinusTest" aria-hidden="true" class="tooltiptext_minus">Excludes this</span>
          </span>
      </span>
    </li>


    <li role="option">
        <a href="/islandora/search/timestamp%3A[NOW-2HOURS%20TO%20NOW]?type=edismax&sort=timestamp+desc">Last 2 hours</a>
        <span class="plusminus">
          <span class="plus_facet">
              <a rel="nofollow" href="/islandora/search/timestamp%3A[NOW-2HOURS%20TO%20NOW]?type=edismax&sort=timestamp+desc" class="plus">+</a>
              <span role="tooltip" name="tooltipTextPlusText" aria-hidden="true" class="tooltiptext_plus">Contains this</span>
          </span>
          <span class="minus_facet">
              <a rel="nofollow" href="/islandora/search/timestamp%3A[NOW-2HOURS%20TO%20NOW]?type=edismax&sort=timestamp+desc" class="minus">-</a>
              <span role="tooltip" name="tooltipTextMinusTest" aria-hidden="true" class="tooltiptext_minus">Excludes this</span>
          </span>
      </span>
    </li>


    <li role="option">
        <a href="/islandora/search/timestamp%3A[NOW-12HOURS%20TO%20NOW]?type=edismax&sort=timestamp+desc">Last 12_hours</a>
        <span class="plusminus">
          <span class="plus_facet">
              <a rel="nofollow" href="/islandora/search/timestamp%3A[NOW-12HOURS%20TO%20NOW]?type=edismax&sort=timestamp+desc" class="plus">+</a>
              <span role="tooltip" name="tooltipTextPlusText" aria-hidden="true" class="tooltiptext_plus">Contains this</span>
          </span>
          <span class="minus_facet">
              <a rel="nofollow" href="/islandora/search/timestamp%3A[NOW-12HOURS%20TO%20NOW]?type=edismax&sort=timestamp+desc" class="minus">-</a>
              <span role="tooltip" name="tooltipTextMinusTest" aria-hidden="true" class="tooltiptext_minus">Excludes this</span>
          </span>
      </span>
    </li>


    <li role="option">
        <a href="/islandora/search/timestamp%3A[NOW-1DAYS%20TO%20NOW]?type=edismax&sort=timestamp+desc">Last 1 day</a>
        <span class="plusminus">
          <span class="plus_facet">
              <a rel="nofollow" href="/islandora/search/timestamp%3A[NOW-1DAYS%20TO%20NOW]?type=edismax&sort=timestamp+desc" class="plus">+</a>
              <span role="tooltip" name="tooltipTextPlusText" aria-hidden="true" class="tooltiptext_plus">Contains this</span>
          </span>
          <span class="minus_facet">
              <a rel="nofollow" href="/islandora/search/timestamp%3A[NOW-1DAYS%20TO%20NOW]?type=edismax&sort=timestamp+desc" class="minus">-</a>
              <span role="tooltip" name="tooltipTextMinusTest" aria-hidden="true" class="tooltiptext_minus">Excludes this</span>
          </span>
      </span>
    </li>


    <li role="option">
        <a href="/islandora/search/timestamp%3A[NOW-2DAYS%20TO%20NOW]?type=edismax&sort=timestamp+desc">Last 2 days</a>
        <span class="plusminus">
          <span class="plus_facet">
              <a rel="nofollow" href="/islandora/search/timestamp%3A[NOW-2DAYS%20TO%20NOW]?type=edismax&sort=timestamp+desc" class="plus">+</a>
              <span role="tooltip" name="tooltipTextPlusText" aria-hidden="true" class="tooltiptext_plus">Contains this</span>
          </span>
          <span class="minus_facet">
              <a rel="nofollow" href="/islandora/search/timestamp%3A[NOW-2DAYS%20TO%20NOW]?type=edismax&sort=timestamp+desc" class="minus">-</a>
              <span role="tooltip" name="tooltipTextMinusTest" aria-hidden="true" class="tooltiptext_minus">Excludes this</span>
          </span>
      </span>
    </li>

    <li role="option">
        <a href="/islandora/search/timestamp%3A[NOW-14DAYS%20TO%20NOW]?type=edismax&sort=timestamp+desc">Last 2 weeks</a>
        <span class="plusminus">
          <span class="plus_facet">
              <a rel="nofollow" href="/islandora/search/timestamp%3A[NOW-14DAYS%20TO%20NOW]?type=edismax&sort=timestamp+desc" class="plus">+</a>
              <span role="tooltip" name="tooltipTextPlusText" aria-hidden="true" class="tooltiptext_plus">Contains this</span>
          </span>
          <span class="minus_facet">
              <a rel="nofollow" href="/islandora/search/timestamp%3A[NOW-14DAYS%20TO%20NOW]?type=edismax&sort=timestamp+desc" class="minus">-</a>
              <span role="tooltip" name="tooltipTextMinusTest" aria-hidden="true" class="tooltiptext_minus">Excludes this</span>
          </span>
      </span>
    </li>

    <li role="option">
        <a href="/islandora/search/timestamp%3A[NOW-14DAYS%20TO%20NOW]?type=edismax&sort=timestamp+desc">Last 4 weeks</a>
        <span class="plusminus">
          <span class="plus_facet">
              <a rel="nofollow" href="/islandora/search/timestamp%3A[NOW-14DAYS%20TO%20NOW]?type=edismax&sort=timestamp+desc" class="plus">+</a>
              <span role="tooltip" name="tooltipTextPlusText" aria-hidden="true" class="tooltiptext_plus">Contains this</span>
          </span>
          <span class="minus_facet">
              <a rel="nofollow" href="/islandora/search/timestamp%3A[NOW-14DAYS%20TO%20NOW]?type=edismax&sort=timestamp+desc" class="minus">-</a>
              <span role="tooltip" name="tooltipTextMinusTest" aria-hidden="true" class="tooltiptext_minus">Excludes this</span>
          </span>
      </span>
    </li>

    <li role="option">
        <a href="/islandora/search/timestamp%3A[NOW-62DAYS%20TO%20NOW]?type=edismax&sort=timestamp+desc">Last 2 months</a>
        <span class="plusminus">
          <span class="plus_facet">
              <a rel="nofollow" href="/islandora/search/timestamp%3A[NOW-62DAYS%20TO%20NOW]?type=edismax&sort=timestamp+desc" class="plus">+</a>
              <span role="tooltip" name="tooltipTextPlusText" aria-hidden="true" class="tooltiptext_plus">Contains this</span>
          </span>
          <span class="minus_facet">
              <a rel="nofollow" href="/islandora/search/timestamp%3A[NOW-62DAYS%20TO%20NOW]?type=edismax&sort=timestamp+desc" class="minus">-</a>
              <span role="tooltip" name="tooltipTextMinusTest" aria-hidden="true" class="tooltiptext_minus">Excludes this</span>
          </span>
      </span>
    </li>

    <li role="option">
        <a href="/islandora/search/timestamp%3A[NOW-92DAYS%20TO%20NOW]?type=edismax&sort=timestamp+desc">Last 3 months</a>
        <span class="plusminus">
          <span class="plus_facet">
              <a rel="nofollow" href="/islandora/search/timestamp%3A[NOW-92DAYS%20TO%20NOW]?type=edismax&sort=timestamp+desc" class="plus">+</a>
              <span role="tooltip" name="tooltipTextPlusText" aria-hidden="true" class="tooltiptext_plus">Contains this</span>
          </span>
          <span class="minus_facet">
              <a rel="nofollow" href="/islandora/search/timestamp%3A[NOW-92DAYS%20TO%20NOW]?type=edismax&sort=timestamp+desc" class="minus">-</a>
              <span role="tooltip" name="tooltipTextMinusTest" aria-hidden="true" class="tooltiptext_minus">Excludes this</span>
          </span>
      </span>
    </li>

    <li role="option">
        <a href="/islandora/search/timestamp%3A[NOW-183DAYS%20TO%20NOW]?type=edismax&sort=timestamp+desc">Last 6 months</a>
        <span class="plusminus">
          <span class="plus_facet">
              <a rel="nofollow" href="/islandora/search/timestamp%3A[NOW-183DAYS%20TO%20NOW]?type=edismax&sort=timestamp+desc" class="plus">+</a>
              <span role="tooltip" name="tooltipTextPlusText" aria-hidden="true" class="tooltiptext_plus">Contains this</span>
          </span>
          <span class="minus_facet">
              <a rel="nofollow" href="/islandora/search/timestamp%3A[NOW-183DAYS%20TO%20NOW]?type=edismax&sort=timestamp+desc" class="minus">-</a>
              <span role="tooltip" name="tooltipTextMinusTest" aria-hidden="true" class="tooltiptext_minus">Excludes this</span>
          </span>
      </span>
    </li>

</ul>

<h3>Browse By Year</h3>
<ul role="listbox" class="islandora-solr-facet">

    <li role="option">
        <a href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateModified_dt%3A[2018-01-01 TO 2018-12-31]?type=edismax&sort=timestamp+desc">2018</a>
        <span class="plusminus">
          <span class="plus_facet">
              <a rel="nofollow" href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateModified_dt%3A[2018-01-01 TO 2018-12-31]?type=edismax&sort=timestamp+desc" class="plus">+</a>
              <span role="tooltip" name="tooltipTextPlusText" aria-hidden="true" class="tooltiptext_plus">Contains this</span>
          </span>
          <span class="minus_facet">
              <a rel="nofollow" href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateModified_dt%3A[2018-01-01 TO 2018-12-31]?type=edismax&sort=timestamp+desc" class="minus">-</a>
              <span role="tooltip" name="tooltipTextMinusTest" aria-hidden="true" class="tooltiptext_minus">Excludes this</span>
          </span>
      </span>
    </li>

    <li role="option">
        <a href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateModified_dt%3A[2017-01-01 TO 2017-12-31]?type=edismax&sort=timestamp+desc">2017</a>
        <span class="plusminus">
          <span class="plus_facet">
              <a rel="nofollow" href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateModified_dt%3A[2017-01-01 TO 2017-12-31]?type=edismax&sort=timestamp+desc" class="plus">+</a>
              <span role="tooltip" name="tooltipTextPlusText" aria-hidden="true" class="tooltiptext_plus">Contains this</span>
          </span>
          <span class="minus_facet">
              <a rel="nofollow" href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateModified_dt%3A[2017-01-01 TO 2017-12-31]?type=edismax&sort=timestamp+desc" class="minus">-</a>
              <span role="tooltip" name="tooltipTextMinusTest" aria-hidden="true" class="tooltiptext_minus">Excludes this</span>
          </span>
      </span>
    </li>


    <li role="option">
        <a href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateModified_dt%3A[2016-01-01 TO 2016-12-31]?type=edismax&sort=timestamp+desc">2016</a>
        <span class="plusminus">
          <span class="plus_facet">
              <a rel="nofollow" href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateModified_dt%3A[2016-01-01 TO 2016-12-31]?type=edismax&sort=timestamp+desc" class="plus">+</a>
              <span role="tooltip" name="tooltipTextPlusText" aria-hidden="true" class="tooltiptext_plus">Contains this</span>
          </span>
          <span class="minus_facet">
              <a rel="nofollow" href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateModified_dt%3A[2016-01-01 TO 2016-12-31]?type=edismax&sort=timestamp+desc" class="minus">-</a>
              <span role="tooltip" name="tooltipTextMinusTest" aria-hidden="true" class="tooltiptext_minus">Excludes this</span>
          </span>
      </span>
    </li>


    <li role="option">
        <a href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateModified_dt%3A[2015-01-01 TO 2015-12-31]?type=edismax&sort=timestamp+desc">2015</a>
        <span class="plusminus">
          <span class="plus_facet">
              <a rel="nofollow" href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateModified_dt%3A[2015-01-01 TO 2015-12-31]?type=edismax&sort=timestamp+desc" class="plus">+</a>
              <span role="tooltip" name="tooltipTextPlusText" aria-hidden="true" class="tooltiptext_plus">Contains this</span>
          </span>
          <span class="minus_facet">
              <a rel="nofollow" href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateModified_dt%3A[2015-01-01 TO 2015-12-31]?type=edismax&sort=timestamp+desc" class="minus">-</a>
              <span role="tooltip" name="tooltipTextMinusTest" aria-hidden="true" class="tooltiptext_minus">Excludes this</span>
          </span>
      </span>
    </li>

    <li role="option">
        <a href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateModified_dt%3A[2014-01-01 TO 2014-12-31]?type=edismax&sort=timestamp+desc">2014</a>
        <span class="plusminus">
          <span class="plus_facet">
              <a rel="nofollow" href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateModified_dt%3A[2014-01-01 TO 2014-12-31]?type=edismax&sort=timestamp+desc" class="plus">+</a>
              <span role="tooltip" name="tooltipTextPlusText" aria-hidden="true" class="tooltiptext_plus">Contains this</span>
          </span>
          <span class="minus_facet">
              <a rel="nofollow" href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateModified_dt%3A[2014-01-01 TO 2014-12-31]?type=edismax&sort=timestamp+desc" class="minus">-</a>
              <span role="tooltip" name="tooltipTextMinusTest" aria-hidden="true" class="tooltiptext_minus">Excludes this</span>
          </span>
      </span>
    </li>

    <li role="option">
        <a href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateModified_dt%3A[2013-01-01 TO 2013-12-31]?type=edismax&sort=timestamp+desc">2013</a>
        <span class="plusminus">
          <span class="plus_facet">
              <a rel="nofollow" href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateModified_dt%3A[2013-01-01 TO 2013-12-31]?type=edismax&sort=timestamp+desc" class="plus">+</a>
              <span role="tooltip" name="tooltipTextPlusText" aria-hidden="true" class="tooltiptext_plus">Contains this</span>
          </span>
          <span class="minus_facet">
              <a rel="nofollow" href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateModified_dt%3A[2013-01-01 TO 2013-12-31]?type=edismax&sort=timestamp+desc" class="minus">-</a>
              <span role="tooltip" name="tooltipTextMinusTest" aria-hidden="true" class="tooltiptext_minus">Excludes this</span>
          </span>
      </span>
    </li>


    <li role="option">
        <a href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateModified_dt%3A[2012-01-01 TO 2012-12-31]?type=edismax&sort=timestamp+desc">2012</a>
        <span class="plusminus">
          <span class="plus_facet">
              <a rel="nofollow" href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateModified_dt%3A[2012-01-01 TO 2012-12-31]?type=edismax&sort=timestamp+desc" class="plus">+</a>
              <span role="tooltip" name="tooltipTextPlusText" aria-hidden="true" class="tooltiptext_plus">Contains this</span>
          </span>
          <span class="minus_facet">
              <a rel="nofollow" href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateModified_dt%3A[2012-01-01 TO 2012-12-31]?type=edismax&sort=timestamp+desc" class="minus">-</a>
              <span role="tooltip" name="tooltipTextMinusTest" aria-hidden="true" class="tooltiptext_minus">Excludes this</span>
          </span>
      </span>
    </li>

    <li role="option">
        <a href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateModified_dt%3A[2011-01-01 TO 2011-12-31]?type=edismax&sort=timestamp+desc">2011</a>
        <span class="plusminus">
          <span class="plus_facet">
              <a rel="nofollow" href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateModified_dt%3A[2011-01-01 TO 2011-12-31]?type=edismax&sort=timestamp+desc" class="plus">+</a>
              <span role="tooltip" name="tooltipTextPlusText" aria-hidden="true" class="tooltiptext_plus">Contains this</span>
          </span>
          <span class="minus_facet">
              <a rel="nofollow" href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateModified_dt%3A[2011-01-01 TO 2011-12-31]?type=edismax&sort=timestamp+desc" class="minus">-</a>
              <span role="tooltip" name="tooltipTextMinusTest" aria-hidden="true" class="tooltiptext_minus">Excludes this</span>
          </span>
      </span>
    </li>

    <li role="option">
        <a href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateModified_dt%3A[2010-01-01 TO 2010-12-31]?type=edismax&sort=timestamp+desc">2010</a>
        <span class="plusminus">
          <span class="plus_facet">
              <a rel="nofollow" href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateModified_dt%3A[2010-01-01 TO 2010-12-31]?type=edismax&sort=timestamp+desc" class="plus">+</a>
              <span role="tooltip" name="tooltipTextPlusText" aria-hidden="true" class="tooltiptext_plus">Contains this</span>
          </span>
          <span class="minus_facet">
              <a rel="nofollow" href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateModified_dt%3A[2010-01-01 TO 2010-12-31]?type=edismax&sort=timestamp+desc" class="minus">-</a>
              <span role="tooltip" name="tooltipTextMinusTest" aria-hidden="true" class="tooltiptext_minus">Excludes this</span>
          </span>
      </span>
    </li>


    <li role="option">
        <a href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateModified_dt%3A[2009-01-01 TO 2009-12-31]?type=edismax&sort=timestamp+desc">2009</a>
        <span class="plusminus">
          <span class="plus_facet">
              <a rel="nofollow" href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateModified_dt%3A[2009-01-01 TO 2009-12-31]?type=edismax&sort=timestamp+desc" class="plus">+</a>
              <span role="tooltip" name="tooltipTextPlusText" aria-hidden="true" class="tooltiptext_plus">Contains this</span>
          </span>
          <span class="minus_facet">
              <a rel="nofollow" href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateModified_dt%3A[2009-01-01 TO 2009-12-31]?type=edismax&sort=timestamp+desc" class="minus">-</a>
              <span role="tooltip" name="tooltipTextMinusTest" aria-hidden="true" class="tooltiptext_minus">Excludes this</span>
          </span>
      </span>
    </li>

    <li role="option">
        <a href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateModified_dt%3A[2008-01-01 TO 2008-12-31]?type=edismax&sort=timestamp+desc">2008</a>
        <span class="plusminus">
          <span class="plus_facet">
              <a rel="nofollow" href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateModified_dt%3A[2008-01-01 TO 2008-12-31]?type=edismax&sort=timestamp+desc" class="plus">+</a>
              <span role="tooltip" name="tooltipTextPlusText" aria-hidden="true" class="tooltiptext_plus">Contains this</span>
          </span>
          <span class="minus_facet">
              <a rel="nofollow" href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateModified_dt%3A[2008-01-01 TO 2008-12-31]?type=edismax&sort=timestamp+desc" class="minus">-</a>
              <span role="tooltip" name="tooltipTextMinusTest" aria-hidden="true" class="tooltiptext_minus">Excludes this</span>
          </span>
      </span>
    </li>

    <li role="option">
        <a href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateModified_dt%3A[2007-01-01 TO 2007-12-31]?type=edismax&sort=timestamp+desc">2007</a>
        <span class="plusminus">
          <span class="plus_facet">
              <a rel="nofollow" href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateModified_dt%3A[2007-01-01 TO 2007-12-31]?type=edismax&sort=timestamp+desc" class="plus">+</a>
              <span role="tooltip" name="tooltipTextPlusText" aria-hidden="true" class="tooltiptext_plus">Contains this</span>
          </span>
          <span class="minus_facet">
              <a rel="nofollow" href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateModified_dt%3A[2007-01-01 TO 2007-12-31]?type=edismax&sort=timestamp+desc" class="minus">-</a>
              <span role="tooltip" name="tooltipTextMinusTest" aria-hidden="true" class="tooltiptext_minus">Excludes this</span>
          </span>
      </span>
    </li>


    <li role="option">
        <a href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateModified_dt%3A[2006-01-01 TO 2006-12-31]?type=edismax&sort=timestamp+desc">2006</a>
        <span class="plusminus">
          <span class="plus_facet">
              <a rel="nofollow" href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateModified_dt%3A[2006-01-01 TO 2006-12-31]?type=edismax&sort=timestamp+desc" class="plus">+</a>
              <span role="tooltip" name="tooltipTextPlusText" aria-hidden="true" class="tooltiptext_plus">Contains this</span>
          </span>
          <span class="minus_facet">
              <a rel="nofollow" href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateModified_dt%3A[2006-01-01 TO 2006-12-31]?type=edismax&sort=timestamp+desc" class="minus">-</a>
              <span role="tooltip" name="tooltipTextMinusTest" aria-hidden="true" class="tooltiptext_minus">Excludes this</span>
          </span>
      </span>
    </li>


    <li role="option">
        <a href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateModified_dt%3A[2005-01-01 TO 2005-12-31]?type=edismax&sort=timestamp+desc">2005</a>
        <span class="plusminus">
          <span class="plus_facet">
              <a rel="nofollow" href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateModified_dt%3A[2005-01-01 TO 2005-12-31]?type=edismax&sort=timestamp+desc" class="plus">+</a>
              <span role="tooltip" name="tooltipTextPlusText" aria-hidden="true" class="tooltiptext_plus">Contains this</span>
          </span>
          <span class="minus_facet">
              <a rel="nofollow" href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateModified_dt%3A[2005-01-01 TO 2005-12-31]?type=edismax&sort=timestamp+desc" class="minus">-</a>
              <span role="tooltip" name="tooltipTextMinusTest" aria-hidden="true" class="tooltiptext_minus">Excludes this</span>
          </span>
      </span>
    </li>


    <li role="option">
        <a href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateModified_dt%3A[2004-01-01 TO 2004-12-31]?type=edismax&sort=timestamp+desc">2004</a>
        <span class="plusminus">
          <span class="plus_facet">
              <a rel="nofollow" href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateModified_dt%3A[2004-01-01 TO 2004-12-31]?type=edismax&sort=timestamp+desc" class="plus">+</a>
              <span role="tooltip" name="tooltipTextPlusText" aria-hidden="true" class="tooltiptext_plus">Contains this</span>
          </span>
          <span class="minus_facet">
              <a rel="nofollow" href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateModified_dt%3A[2004-01-01 TO 2004-12-31]?type=edismax&sort=timestamp+desc" class="minus">-</a>
              <span role="tooltip" name="tooltipTextMinusTest" aria-hidden="true" class="tooltiptext_minus">Excludes this</span>
          </span>
      </span>
    </li>


    <li role="option">
        <a href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateModified_dt%3A[2003-01-01 TO 2003-12-31]?type=edismax&sort=timestamp+desc">2003</a>
        <span class="plusminus">
          <span class="plus_facet">
              <a rel="nofollow" href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateModified_dt%3A[2003-01-01 TO 2003-12-31]?type=edismax&sort=timestamp+desc" class="plus">+</a>
              <span role="tooltip" name="tooltipTextPlusText" aria-hidden="true" class="tooltiptext_plus">Contains this</span>
          </span>
          <span class="minus_facet">
              <a rel="nofollow" href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateModified_dt%3A[2003-01-01 TO 2003-12-31]?type=edismax&sort=timestamp+desc" class="minus">-</a>
              <span role="tooltip" name="tooltipTextMinusTest" aria-hidden="true" class="tooltiptext_minus">Excludes this</span>
          </span>
      </span>
    </li>


    <li role="option">
        <a href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateModified_dt%3A[2002-01-01 TO 2002-12-31]?type=edismax&sort=timestamp+desc">2002</a>
        <span class="plusminus">
          <span class="plus_facet">
              <a rel="nofollow" href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateModified_dt%3A[2002-01-01 TO 2002-12-31]?type=edismax&sort=timestamp+desc" class="plus">+</a>
              <span role="tooltip" name="tooltipTextPlusText" aria-hidden="true" class="tooltiptext_plus">Contains this</span>
          </span>
          <span class="minus_facet">
              <a rel="nofollow" href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateModified_dt%3A[2002-01-01 TO 2002-12-31]?type=edismax&sort=timestamp+desc" class="minus">-</a>
              <span role="tooltip" name="tooltipTextMinusTest" aria-hidden="true" class="tooltiptext_minus">Excludes this</span>
          </span>
      </span>
    </li>


    <li role="option">
        <a href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateModified_dt%3A[2001-01-01 TO 2001-12-31]?type=edismax&sort=timestamp+desc">2001</a>
        <span class="plusminus">
          <span class="plus_facet">
              <a rel="nofollow" href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateModified_dt%3A[2001-01-01 TO 2001-12-31]?type=edismax&sort=timestamp+desc" class="plus">+</a>
              <span role="tooltip" name="tooltipTextPlusText" aria-hidden="true" class="tooltiptext_plus">Contains this</span>
          </span>
          <span class="minus_facet">
              <a rel="nofollow" href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateModified_dt%3A[2001-01-01 TO 2001-12-31]?type=edismax&sort=timestamp+desc" class="minus">-</a>
              <span role="tooltip" name="tooltipTextMinusTest" aria-hidden="true" class="tooltiptext_minus">Excludes this</span>
          </span>
      </span>
    </li>

    <li role="option">
        <a href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateModified_dt%3A[2000-01-01 TO 2000-12-31]?type=edismax&sort=timestamp+desc">2000</a>
        <span class="plusminus">
          <span class="plus_facet">
              <a rel="nofollow" href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateModified_dt%3A[2000-01-01 TO 2000-12-31]?type=edismax&sort=timestamp+desc" class="plus">+</a>
              <span role="tooltip" name="tooltipTextPlusText" aria-hidden="true" class="tooltiptext_plus">Contains this</span>
          </span>
          <span class="minus_facet">
              <a rel="nofollow" href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateModified_dt%3A[2000-01-01 TO 2000-12-31]?type=edismax&sort=timestamp+desc" class="minus">-</a>
              <span role="tooltip" name="tooltipTextMinusTest" aria-hidden="true" class="tooltiptext_minus">Excludes this</span>
          </span>
      </span>
    </li>

</ul>
<h3>Browse By Decade</h3>
<ul role="listbox" class="islandora-solr-facet">

    <li role="option">
        <a href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateModified_dt/199[0-9].*/?type=edismax&sort=timestamp+desc">1990-1999</a>
        <span class="plusminus">
          <span class="plus_facet">
              <a rel="nofollow" href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateModified_dt/199[0-9].*/?type=edismax&sort=timestamp+desc" class="plus">+</a>
              <span role="tooltip" name="tooltipTextPlusText" aria-hidden="true" class="tooltiptext_plus">Contains this</span>
          </span>
          <span class="minus_facet">
              <a rel="nofollow" href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateModified_dt/199[0-9].*/?type=edismax&sort=timestamp+desc" class="minus">-</a>
              <span role="tooltip" name="tooltipTextMinusTest" aria-hidden="true" class="tooltiptext_minus">Excludes this</span>
          </span>
      </span>
    </li>


    <li role="option">
        <a href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateModified_dt/198[0-9].*/?type=edismax&sort=timestamp+desc">1980-1989</a>
        <span class="plusminus">
          <span class="plus_facet">
              <a rel="nofollow" href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateModified_dt/198[0-9].*/?type=edismax&sort=timestamp+desc" class="plus">+</a>
              <span role="tooltip" name="tooltipTextPlusText" aria-hidden="true" class="tooltiptext_plus">Contains this</span>
          </span>
          <span class="minus_facet">
              <a rel="nofollow" href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateModified_dt/198[0-9].*/?type=edismax&sort=timestamp+desc" class="minus">-</a>
              <span role="tooltip" name="tooltipTextMinusTest" aria-hidden="true" class="tooltiptext_minus">Excludes this</span>
          </span>
      </span>
    </li>

    <li role="option">
        <a href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateModified_dt/197[0-9].*/?type=edismax&sort=timestamp+desc">1970-1979</a>
        <span class="plusminus">
          <span class="plus_facet">
              <a rel="nofollow" href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateModified_dt/197[0-9].*/?type=edismax&sort=timestamp+desc" class="plus">+</a>
              <span role="tooltip" name="tooltipTextPlusText" aria-hidden="true" class="tooltiptext_plus">Contains this</span>
          </span>
          <span class="minus_facet">
              <a rel="nofollow" href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateModified_dt/197[0-9].*/?type=edismax&sort=timestamp+desc" class="minus">-</a>
              <span role="tooltip" name="tooltipTextMinusTest" aria-hidden="true" class="tooltiptext_minus">Excludes this</span>
          </span>
      </span>
    </li>

    <li role="option">
        <a href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateModified_dt/196[0-9].*/?type=edismax&sort=timestamp+desc">1960-1969</a>
        <span class="plusminus">
          <span class="plus_facet">
              <a rel="nofollow" href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateModified_dt/196[0-9].*/?type=edismax&sort=timestamp+desc" class="plus">+</a>
              <span role="tooltip" name="tooltipTextPlusText" aria-hidden="true" class="tooltiptext_plus">Contains this</span>
          </span>
          <span class="minus_facet">
              <a rel="nofollow" href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateModified_dt/196[0-9].*/?type=edismax&sort=timestamp+desc" class="minus">-</a>
              <span role="tooltip" name="tooltipTextMinusTest" aria-hidden="true" class="tooltiptext_minus">Excludes this</span>
          </span>
      </span>
    </li>


    <li role="option">
        <a href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateModified_dt/195[0-9].*/?type=edismax&sort=timestamp+desc">1950-1959</a>
        <span class="plusminus">
          <span class="plus_facet">
              <a rel="nofollow" href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateModified_dt/195[0-9].*/?type=edismax&sort=timestamp+desc" class="plus">+</a>
              <span role="tooltip" name="tooltipTextPlusText" aria-hidden="true" class="tooltiptext_plus">Contains this</span>
          </span>
          <span class="minus_facet">
              <a rel="nofollow" href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateModified_dt/195[0-9].*/?type=edismax&sort=timestamp+desc" class="minus">-</a>
              <span role="tooltip" name="tooltipTextMinusTest" aria-hidden="true" class="tooltiptext_minus">Excludes this</span>
          </span>
      </span>
    </li>

    <li role="option">
        <a href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateModified_dt/194[0-9].*/?type=edismax&sort=timestamp+desc">1940-1949</a>
        <span class="plusminus">
          <span class="plus_facet">
              <a rel="nofollow" href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateModified_dt/194[0-9].*/?type=edismax&sort=timestamp+desc" class="plus">+</a>
              <span role="tooltip" name="tooltipTextPlusText" aria-hidden="true" class="tooltiptext_plus">Contains this</span>
          </span>
          <span class="minus_facet">
              <a rel="nofollow" href="/islandora/search/mods_originInfo_encoding_edtf_keyDate_yes_dateModified_dt/194[0-9].*/?type=edismax&sort=timestamp+desc" class="minus">-</a>
              <span role="tooltip" name="tooltipTextMinusTest" aria-hidden="true" class="tooltiptext_minus">Excludes this</span>
          </span>
      </span>
    </li>



</ul>


<!-- END SEARCH-BY-DATE -->


<!-- END islandora-solr-metadata-display.tpl.php -->
