<!-- BEGIN: view_prod -->
<script type="text/javascript" language="javascript" src="skins/{VAL_SKIN}/php/compress.php?get=../javascript/jquery.fancybox-1.2.1.js"></script>
<script type="text/javascript" language="javascript">
jQuery(function() {
	jQuery("a.useLightbox").fancybox({
		'hideOnContentClick': true,
		'zoomSpeedIn': 400,
		'zoomSpeedOut': 400,
		'zoomSpeedChange': 400,
		'overlayShow': true,
		'overlayOpacity': 0.3,
		'padding': '10px'
	}); 
});
</script>
<div class="topTitle"></div>
<h1 class="txtContentTitle">{TXT_PRODTITLE}</h1>
<!-- BEGIN: prod_true -->
<div class="boxContent" style="padding:0px; background:#FCFCFC;">
  <!-- BEGIN: opts_notice -->
  <div class="typError" style="margin:0px; border-left:none; border-right:none; border-top:none;">{LANG_OPTS_NOTICE}</div>
  <!-- END: opts_notice -->
  <form action="skins/{VAL_SKIN}/php/ajaxCart.php" method="post" name="addtobasket" target="_self" id="myForm{PRODUCT_ID}">
    <input type="hidden" value="{PRODUCT_ID}" name="add" />
    <div id="viewProdTop" class="clearfix">
        <div class="span-14 viewProdImageContainer">
          <table border="0" align="center" cellpadding="0" cellspacing="0" style="height:100%;">
            <tr>
              <td valign="middle" align="center" style="text-align:center;">
                  <a href="{IMG_SRC}" class="useLightbox" rel="group">
                    <img src="skins/Sandbox_Light/php/getImg.php?src={IMG_SRC}&amp;width=320&amp;height=305" alt="{TXT_PRODTITLE}" border="0" title="{TXT_PRODTITLE}" />
                  </a>
              </td>
            </tr>
          </table>
        </div>
        <div class="span-9 viewProdDetails">
            <div class="detailTitle" style="margin-top:0px;">Product Details</div>
            <div class="stockLevel">{TXT_INSTOCK}<span class="txtOutOfStock">{TXT_OUTOFSTOCK}</span></div>
            <div class="productCode">Product Code: {TXT_PRODCODE}</div>
            <div class="tellAFriend"><a href="index.php?_a=tellafriend&amp;productId={PRODUCT_ID}" target="_self">{LANG_TELLFRIEND}</a></div>
            <!-- BEGIN: popup_gallery -->
            <div class="moreImagesPopUp"><a id="galleryLink" href="index.php?_g=ex&amp;_a=prodImages&amp;productId={PRODUCT_ID}" style="display:none"></a><a href="javascript:void(0);" onclick="window.open(jQuery('#galleryLink').attr('href'),'Images','fullscreen=yes,scrollbars=yes')">{LANG_MORE_IMAGES}</a></div>
            <!-- END: popup_gallery -->
              <!-- BEGIN: prod_opts -->
            <div class="detailTitle">{TXT_PROD_OPTIONS}</div>
            <table border="0" cellspacing="0" cellpadding="0" id="prodOptions">
              <!-- BEGIN: repeat_options -->
              <tr>
                <td style="padding-right:5px; padding-bottom:10px;"><span class="optName">{VAL_OPTS_NAME}</span></td>
                <td style="padding-bottom:10px;"><select name="productOptions[{VAL_OPTION_ID}]" class="dropDown" style="margin-left:5px;">
                    <!-- BEGIN: repeat_values -->
                    <option value="{VAL_ASSIGN_ID}">{VAL_VALUE_NAME}
                    <!-- BEGIN: repeat_price -->
                    ({VAL_OPT_SIGN}{VAL_OPT_PRICE})
                    <!-- END: repeat_price -->
                    </option>
                    <!-- END: repeat_values -->
                  </select>
                </td>
              </tr>
              <!-- END: repeat_options -->
              <!-- BEGIN: text_opts -->
              <tr>
                <td valign="top" style="padding-right:5px;"><span class="optName">{VAL_OPTS_NAME}</span>
                  <!-- BEGIN: repeat_price -->
                  <br />
                  ({VAL_OPT_SIGN}{VAL_OPT_PRICE})
                  <!-- END: repeat_price -->
                </td>
                <td style="padding-bottom:10px;"><!-- BEGIN: textbox -->
                  <input type="text" name="productOptions[{VAL_OPTION_ID}]" class="textbox" style="margin-left:5px;" />
                  <!-- END: textbox -->
                  <!-- BEGIN: textarea -->
                  <textarea name="productOptions[{VAL_OPTION_ID}]" class="textbox" cols="18" rows="4" style="margin-left:5px;"></textarea>
                  <!-- END: textarea -->
                </td>
              </tr>
              <!-- END: text_opts -->
            </table>
            <!-- END: prod_opts -->
             <div class="detailTitle">PURCHASE</div>
            <div style="margin-left:11px; margin-top:3px;">
                <table border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td align="left" width="95" valign="middle">
                        <div id="viewProdPrices" class="prices" style="margin:0px; margin-right:12px;">
                            <div>{TXT_SALE_PRICE_VIEW}</div>
                            <div>{TXT_PRICE_VIEW}</div>
                        </div>
                    </td>
                    <td align="left" valign="middle"> X </td>
                    <td align="left" valign="middle"><input name="quan" type="text" value="1" size="2" class="textbox" style="text-align:center;" title="{LANG_QUAN}" />
                    </td>
                  </tr>
                </table>
            </div>
            <!-- BEGIN: buy_btn -->
            <div class="viewProdButtons">
                <a href="javascript:doAddToCart({PRODUCT_ID});" class="buyBtn singleBtn largeBtn">{BTN_ADDBASKET}<img src="skins/Sandbox_Light/styleImages/backgrounds/buttonArrow.gif" alt="" /></a>
            </div>
            <!-- END: buy_btn -->
            <input type="hidden" value="viewProd" name="page"/>
        </div>
	</div>
  </form>
<ul id="tabBar" class="clearfix">
  <li><a href="#productDescription" id="descriptionTab">{LANG_PRODINFO}</a><a id="readDescriptionLink" href="index.php?_a=viewProd&amp;productId={PRODUCT_ID}" style="display:none;"></a></li>
  <li id="moreImagesTab" style="display:none;"><a href="#moreImages">More Images</a></li>
  <li><a href="#reviews" id="reviewsTab" onmousedown="javascript:readReview();">Reviews</a><a id="readReviewLink" href="index.php?_a=viewProd&amp;productId={PRODUCT_ID}&amp;review=read" style="display:none;"></a></li>
</ul>
<div class="tabContainer">
  <div id="productDescription" class="clearfix">{TXT_DESCRIPTION}</div>
  <div id="moreImages" class="clearfix" style="display:none;">
    <!-- BEGIN: image_gallery -->
    <script type="text/javascript" language="javascript">
	jQuery(function() {
		jQuery("li#moreImagesTab").css("display","block");
	});
    </script>
    <div id="imgThumbSpace" class="clearfix">
      <!-- BEGIN: img_repeat -->
      <div class="thumbContainer">
        <table border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td valign="middle" align="center">
                <a href="{VALUE_IMG_SRC}" rel="group" class="useLightbox">
                	<img src="skins/Sandbox_Light/php/getImg.php?src={VALUE_IMG_SRC}&amp;fill=1&amp;width=175&amp;height=175" border="0" alt="{TXT_PRODTITLE}" />
                </a>
            </td>
          </tr>
        </table>
      </div>
      <!-- END: img_repeat -->
    </div>
    <!-- END: image_gallery -->
  </div>
  <div id="reviews" class="clearfix" style="display:none;">
    <!-- BEGIN: reviews_true -->
    <!-- BEGIN: review_stars -->
    <!-- END: review_stars -->
    <!-- END: reviews_true -->
    <!-- BEGIN: reviews_false -->
    <a href="index.php?_a=viewProd&amp;productId={PRODUCT_ID}&amp;review=write#write_review" target="_self" class="txtDefault"> {LANG_FIRST_TO_REVIEW}</a>
    <br />
    <!-- END: reviews_false -->
    <!-- BEGIN: read_reviews -->
    <!-- END: read_reviews -->
    <!-- BEGIN: read_review -->
	<script type="text/javascript">
    jQuery(function() {
		// switch to review tab
        jQuery('a#reviewsTab').click();
		jQuery('#reviews').show();
		// modify description tab
		jQuery("a#descriptionTab").attr("onclick", "readDescription();");
    });
    </script>
    <div style="text-align:right">{VAL_REVIEW_PAGINATION}</div>
    <!-- BEGIN: reviews_true -->
    <div class="review">
        <div class="reviewTitleBar clearfix">
            <span class="reviewer">{VAL_REVIEW_TITLE}</span>
            <span class="reviewDate">{VAL_REVIEW_DATE}</span>
        </div>
        <div class="reviewDetails">
        <div class="reviewStars">
            <!-- BEGIN: review_stars -->
                <img src="skins/{VAL_SKIN}/styleImages/icons/rating/{VAL_REVIEW_STAR}.gif" width="15" height="15" alt="star" />
            <!-- END: review_stars -->
        </div>
        <div class="reviewComments"><strong style="color:#666666;">Reviewed By:</strong>&nbsp;&nbsp;{VAL_REVIEW_NAME}</div>
        <div class="reviewComments">&quot;{VAL_REVIEW}&quot;</div>
        </div>
    </div>
    <!-- END: reviews_true -->
    <div style="text-align:right">{VAL_REVIEW_PAGINATION}</div>
    <!-- BEGIN: reviews_false -->
    <!-- END: reviews_false -->
    <!-- END: read_review -->
    <br />
    <a href="index.php?_a=viewProd&amp;productId={PRODUCT_ID}&amp;review=write#write_review" target="_self" class="button"> {LANG_WRITE_REVIEWS}</a>
    </div>
</div>
</div>
<!-- BEGIN: write_review -->
<div class="topTitle"></div>
<h1 class="txtContentTitle">{LANG_SUBMIT_REVIEW}</h1>
<form action="index.php?_a=viewProd&amp;review=write&amp;productId={PRODUCT_ID}#write_review" method="post" id="write_review" class="boxContent">
  <!-- BEGIN: error -->
  <div class="typError">{VAL_ERROR}</div>
  <!-- END: error -->
  <!-- BEGIN: success -->
  <div class="typConfirm">{VAL_SUCCESS}</div>
  <!-- END: success -->
  <!-- BEGIN: form -->
  <div id="reviewForm">
  <div class="typInfo" style="margin-top:0px;">{LANG_SUBMIT_REVIEW_COMPLETE}</div>
  <div class="frmContainer">
    <p>
      <label for="type">{LANG_REVIEW_TYPE}</label>
      <select name="review[type]" style="width: 152px;" class="dropDownBox">
        <option value="0" onclick="findObj('rating_p').style.display = '';" {VAL_REV_TYPE_R_SELECTED}>{LANG_REVIEW}</option>
        <option value="1" onclick="findObj('rating_p').style.display = 'none';" {VAL_REV_TYPE_C_SELECTED}>{LANG_COMMENT}</option>
      </select>
      <br clear="all" />
    </p>
    <p id="rating_p">
      <label for="star0" class="span-5">{LANG_RATING}</label>
      <img src="images/general/px.gif" class="noMargin" alt="0" name="star0" width="15" height="15" id="star0" onclick="stars(0,'{VAL_ROOT_REL}skins/{VAL_SKIN}/styleImages/icons/rating/');" onmouseover="starsHover(0,'{VAL_ROOT_REL}skins/{VAL_SKIN}/styleImages/icons/rating/');" onmouseout="starsOut('{VAL_ROOT_REL}skins/{VAL_SKIN}/styleImages/icons/rating/');" style="cursor: pointer; cursor: hand; margin-left:-18px;" />
      <!-- BEGIN: review_stars -->
      <img src="skins/{VAL_SKIN}/styleImages/icons/rating/{VAL_STAR}.gif" class="noMargin" alt="{VAL_STAR_I}" name="star{VAL_STAR_I}" width="15" height="15" id="star{VAL_STAR_I}" onclick="stars({VAL_STAR_I},'{VAL_ROOT_REL}skins/{VAL_SKIN}/styleImages/icons/rating/');" onmouseover="starsHover({VAL_STAR_I},'{VAL_ROOT_REL}skins/{VAL_SKIN}/styleImages/icons/rating/');" onmouseout="starsOut('{VAL_ROOT_REL}skins/{VAL_SKIN}/styleImages/icons/rating/');" style="cursor: pointer; cursor: hand; padding-left:2px; padding-right:2px;" />
      <!-- END: review_stars -->
    </p>
    <!-- BEGIN: spambot -->
    <p>
      <label for="spambot">{LANG_SPAMBOT}</label>
      {IMG_SPAMBOT}<br />
	  <style type="text/css">
		form img { margin:0px; }
	  </style>
      <input name="review[spambot]" type="text" class="textbox" style="width: 118px; margin-left:200px; margin-top:10px;" maxlength="5" />
    </p>
    <!-- END: spambot -->
    <!-- BEGIN: recaptcha -->
    <div style="padding-top:15px;">
    <label for="spambot">{LANG_SPAMBOT}</label>
    {FILE "content/recaptcha.tpl"}
    </div>
    <p></p>
    <!-- END: recaptcha -->
    <p>
      <label for="name">{LANG_NAME}</label>
      <input name="review[name]" type="text" style="width: 150px;" class="textbox" value="{VAL_REV_NAME}" onclick="this.value = ''" />
    </p>
    <p>
      <label for="email">{LANG_EMAIL} {LANG_NOT_DISPLAYED}</label>
      <input name="review[email]" type="text" style="width: 150px;" class="textbox" value="{VAL_REV_EMAIL}" />
    </p>
    <p>
      <label for="title">{LANG_TITLE}</label>
      <input name="review[title]" type="text" style="width: 150px;" class="textbox" value="{VAL_REV_TITLE}" />
    </p>
    <p>
      <label for="review">{LANG_DETAILS}</label>
      <textarea name="review[review]" style="width:389px;" rows="7" cols="57" wrap="hard" class="textarea">{VAL_REVIEW}</textarea>
    </p>
    <p>
      <input name="ESC" type="hidden" value="{VAL_ESC}" />
      <input type="hidden" name="review[rating]" id="rating_val" value="{VAL_RATING}" />
      <input name="submit" type="submit" value="{LANG_SUBMIT_REVIEW}" class="button frmBtnAlign" />
    </p>
  </div>
</form>
</div>
<!-- END: form -->
</form>
<!-- END: write_review -->
<!-- BEGIN: related_products -->
<div class="topTitle"></div>
<span class="txtContentTitle">{LANG_RELATED_PRODUCTS}</span>
<div class="boxContent gridView" style="padding:0px;">
  <div class="latestProdsContainer clearfix">
    <!-- BEGIN: repeat_prods -->
    <div class="span-8" style="width:208px;">
      <div class="latestProds">
      	<div class="AJAX-process AJAX-process-{VAL_PRODUCT_ID}"></div>
      	<div class="AJAX-confirm AJAX-confirm-{VAL_PRODUCT_ID}"><a href="index.php?_g=co&amp;_a=cart" title="Checkout"></a></div>
        <table border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td valign="middle" align="center" style="text-align:center;"><a href="index.php?_a=viewProd&amp;productId={VAL_PRODUCT_ID}"> <img src="skins/Sandbox_Light/php/getImg.php?src={VAL_IMG_SRC}&amp;width=178&amp;height=130" alt="{VAL_PRODUCT_NAME}" border="0" title="{VAL_PRODUCT_NAME}" /> </a> </td>
          </tr>
        </table>
        <div class="latestProdDetails"> <a href="index.php?_a=viewProd&amp;productId={VAL_PRODUCT_ID}" class="prodLink">{VAL_PRODUCT_NAME}</a> <br />
          <div class="prices"> <span class="txtSale">{TXT_SALE_PRICE}</span>{TXT_PRICE} </div>
          <div class="buttons">
              <form action="skins/{VAL_SKIN}/php/ajaxCart.php" method="post" name="prod{VAL_PRODUCT_ID}" id="myForm{VAL_PRODUCT_ID}">
                <input type="hidden" name="add" value="{VAL_PRODUCT_ID}" />
                <input type="hidden" name="quan" value="1" />
                <input type="hidden" name="opt" value="1" />
                <input type="hidden" value="none" name="page"/>
          			<a href="javascript:doAddToCart({VAL_PRODUCT_ID});" title="{BTN_BUY}" class="buyBtn">ADD TO CART<img src="skins/Sandbox_Light/styleImages/backgrounds/buttonArrow.gif" alt="" /></a><a href="index.php?_a=viewProd&amp;productId={VAL_PRODUCT_ID}" title="{TXT_TITLE}" class="moreBtn">MORE<img src="skins/Sandbox_Light/styleImages/backgrounds/buttonArrow.gif" alt="" /></a>
              </form>
          </div>
        </div>
      </div>
    </div>
    <!-- END: repeat_prods -->
  </div>
</div>
<!-- END: related_products -->
<!-- END: prod_true -->
<!-- BEGIN: prod_false -->
<div class="boxContent">
	<div class="typError">{LANG_PRODUCT_EXPIRED}</div>
</div>
<!-- END: prod_false -->
<!-- END: view_prod -->