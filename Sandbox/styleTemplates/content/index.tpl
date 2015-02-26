<!-- BEGIN: index -->
<script type="text/javascript" language="javascript">
	jQuery(function() {
		if (slideShow == true) {
			// activate the plugin
			var path = rootRel + 'skins/' + skinName + '/php/slideShow.php';
			jQuery("#slideShowContainer").load(path, function() {
				jQuery('.showCase').cycle({
					delay: 2000,
					speed: 500,
					timeout: 4000,
					pause: true
				});
			});
		}
	});
</script>
<!-- BEGIN: welcome_note -->
<div class="topTitle"></div>
<h1 class="txtContentTitle">{HOME_TITLE}</h1>
<div class="boxContent">
{HOME_CONTENT}
</div>
<!-- END: welcome_note -->
<div id="slideShowContainer"></div>
<!-- BEGIN: latest_prods -->
	<div class="topTitle"></div>
	<h1 class="txtContentTitle">{LANG_LATEST_PRODUCTS}</h1>
	<div class="boxContent gridView">
    <div class="latestProdsContainer clearfix">
		<!-- BEGIN: repeat_prods -->
			<div class="span-8" style="width:208px;">
                <div class="latestProds">
                    <div class="AJAX-process AJAX-process-{VAL_PRODUCT_ID}"></div>
                    <div class="AJAX-confirm AJAX-confirm-{VAL_PRODUCT_ID}"><a href="index.php?_g=co&amp;_a=cart" title="Checkout"></a></div>
                    <table border="0" align="center" cellpadding="0" cellspacing="0">
                        <tr>
                            <td valign="middle" align="center" style="text-align:center;">
                                <a href="index.php?_a=viewProd&amp;productId={VAL_PRODUCT_ID}">
                                    <img src="skins/Sandbox/php/getImg.php?src={VAL_IMG_SRC}&amp;width=178&amp;height=130" alt="{VAL_PRODUCT_NAME}" border="0" title="{VAL_PRODUCT_NAME}" />                    				
                                </a>
                            </td>
                        </tr>
                  	</table>
                    <div class="latestProdDetails">
                        <a href="index.php?_a=viewProd&amp;productId={VAL_PRODUCT_ID}" class="prodLink">{VAL_PRODUCT_NAME}</a>
                        <br />
                        <div class="prices absPricePos">
                        	<span class="txtSale">{TXT_SALE_PRICE}</span>{TXT_PRICE}
                        </div>
                        <div class="buttons">
                            <form action="skins/Sandbox/php/ajaxCart.php" method="post" name="prod{VAL_PRODUCT_ID}" id="myForm{VAL_PRODUCT_ID}">
                                <input type="hidden" name="add" value="{VAL_PRODUCT_ID}" />
                                <input type="hidden" name="quan" value="1" />
                                <input type="hidden" name="page" value="none" />
                            	<a href="javascript:doAddToCart({VAL_PRODUCT_ID});" title="{BTN_BUY}" class="buyBtn">ADD TO CART<img src="skins/Sandbox/styleImages/backgrounds/buttonArrow.gif" alt="" /></a><a href="index.php?_a=viewProd&amp;productId={VAL_PRODUCT_ID}" title="{TXT_TITLE}" class="moreBtn">MORE<img src="skins/Sandbox/styleImages/backgrounds/buttonArrow.gif" alt="" /></a>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
		<!-- END: repeat_prods -->
    </div>
	</div>
<!-- END: latest_prods -->
<!-- END: index -->