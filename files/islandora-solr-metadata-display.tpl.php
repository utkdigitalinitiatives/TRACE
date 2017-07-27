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
