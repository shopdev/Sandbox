<!-- BEGIN: sale_items -->
<div class="boxTitleLeft">{LANG_SALE_ITEMS_TITLE}<img src="skins/Sandbox_Light/styleImages/blank.gif" alt="" /></div>
<div class="boxContentLeft" style="margin-top:-2px;">
      <!-- BEGIN: li -->
      <div class="clearfix popProdContainer">
        <div class="popThumb">
            <table border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td valign="middle" align="center" style="text-align:center;">
                        <a href="index.php?_a=viewProd&amp;productId={DATA.productId}">
                            <img src="skins/Sandbox_Light/php/getImg.php?id={DATA.productId}&amp;width=60&amp;height=60" alt="{DATA.name}" border="0" title="{DATA.name}" />                    				
                        </a>
                    </td>
                </tr>
            </table>
        </div>
        <div class="popDetail">
            <a href="index.php?_a=viewProd&amp;productId={DATA.productId}" class="txtDefault">{DATA.name}</a><br /><span class="txtBoxSave">{LANG_SAVE} {SAVING}</span>
        </div>
      </div>
      <!-- END: li -->
</div>
<!-- END: sale_items -->
