<?php

/**
 * @file
 * Template file for default facets
 *
 * @TODO document available variables
 */
// $total_facets = count($buckets);
?>

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


<!-- END BROWSE-BY-DATE -->


<!-- END islandora-solr-facet.tpl.php -->
