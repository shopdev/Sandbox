<!-- BEGIN: popular_products -->
<div class="boxTitleLeft">{LANG_POPULAR_PRODUCTS_TITLE}<img src="skins/Sandbox/styleImages/blank.gif" alt="" /></div>
<div class="boxContentLeft" style="margin-top:-2px;">
  <!-- BEGIN: li -->
  <div class="clearfix popProdContainer">
  	<div class="popThumb">
    	<table border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td valign="middle" align="center" style="text-align:center;">
                    <a href="index.php?_a=viewProd&amp;productId={DATA.productId}">
                        <img src="skins/Sandbox/php/getImg.php?id={DATA.productId}&amp;width=60&amp;height=60" alt="{DATA.name}" border="0" title="{DATA.name}" />                    				
                    </a>
                </td>
            </tr>
        </table>
    </div>
    <div class="popDetail">
    	<a href="index.php?_a=viewProd&amp;productId={DATA.productId}" class="txtDefault">{DATA.name}</a>
    </div>
  </div>
  <!-- END: li -->
</div>
<!-- END: popular_products -->
