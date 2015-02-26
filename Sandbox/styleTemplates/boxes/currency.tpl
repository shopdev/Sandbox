<!-- BEGIN: currency -->
<div class="boxTitleLeft">{LANG_CURRENCY_TITLE}<img src="skins/Sandbox/styleImages/blank.gif" alt="" class="collapsed" /></div>
<div class="boxContentLeft">
  <div class="innerBox clearfix">
    <select name="lang" class="dropDown" onchange="jumpMenu('parent',this,0)">
      <!-- BEGIN: option -->
      <option value="index.php?_g=sw&amp;r={VAL_CURRENT_PAGE}&amp;currency={VAL_CURRENCY}" {CURRENCY_SELECTED}>{CURRENCY_NAME}</option>
      <!-- END: option -->
    </select>
  </div>
</div>
<!-- END: currency -->
