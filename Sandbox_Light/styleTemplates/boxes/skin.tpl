<!-- BEGIN: skin -->
<div class="sidebox">
    <div class="boxTitleLeft">Skin<img src="skins/Sandbox_Light/styleImages/blank.gif" alt="" class="collapsed" /></div>
    <div class="boxContentLeft">
        <div class="innerBox clearfix">
            <select name="skin" class="dropDown" onchange="jumpMenu('parent',this,0)">
                <optgroup label="{LANG_SKIN_SELECT}">
                <!-- BEGIN: option -->
                <option value="index.php?_g=sw&amp;r={VAL_CURRENT_PAGE}&amp;skin={SKIN_VAL}" {SKIN_SELECTED}>{SKIN_NAME}</option>
                <!-- END: option -->
                </optgroup>
            </select>
        </div>
    </div>
</div>
<!-- END: skin -->	