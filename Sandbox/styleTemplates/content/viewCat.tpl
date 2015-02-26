<!-- BEGIN: view_cat -->
<div class="topTitle"></div>
<h1 class="txtContentTitle">{TXT_CAT_TITLE}</h1>
<div class="boxContent" style="padding-right:0px; padding-bottom:0px; padding-left:13px;">
  <!-- BEGIN: cat_desc -->
  <div style="margin-right:15px; margin-bottom:15px;">{TXT_CAT_DESC}</div>
  <!-- END: cat_desc -->
  <!-- BEGIN: sub_cats -->
  <div id="subCats" class="clearfix">
    <!-- BEGIN: sub_cats_loop -->
    <div class="subCat">
        <table border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td valign="middle" align="center" style="text-align:center;">
                    <a href="index.php?_a=viewCat&amp;catId={TXT_LINK_CATID}" class="txtDefault">
                    <img src="skins/Sandbox/php/getImg.php?src={IMG_CATEGORY}&amp;width=159&amp;height=130" alt="{TXT_CATEGORY}" border="0" title="{TXT_CATEGORY}" />
                    </a>
                </td>
            </tr>
        </table>
        <a href="index.php?_a=viewCat&amp;catId={TXT_LINK_CATID}" class="subCatName">{TXT_CATEGORY}</a>
    </div>
    <!-- END: sub_cats_loop -->
    <br clear="all" style="line-height:0px;" /><!-- IE7 Fix -->
  </div>
  <!-- END: sub_cats -->
</div>
<!-- BEGIN: pagination_top -->
<div class="paginationBar clearfix">{PAGINATION}</div>
<!-- END: pagination_top -->
<!-- BEGIN: productTable -->
<div class="sortBar clearfix"><span class="lastDoc"></span><a href="{SORT_PRICE}" class="txtSiteDocs">{SORT_ICON}{LANG_PRICE}</a><a href="{SORT_NAME}" class="txtSiteDocs">{SORT_ICON}{LANG_NAME}</a><span class="firstDoc"></span><span class="sortBy">Sort by:</span></div>
<div class="boxContent gridView">
  <div class="latestProdsContainer clearfix">
    <!-- BEGIN: products -->
    <div class="span-8" style="width:208px;">
      <div class="latestProds">
      	<div class="AJAX-process AJAX-process-{PRODUCT_ID}"></div>
      	<div class="AJAX-confirm AJAX-confirm-{PRODUCT_ID}"><a href="index.php?_g=co&amp;_a=cart" title="Checkout"></a></div>
        <table border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td valign="middle" align="center" style="text-align:center;"><a href="index.php?_a=viewProd&amp;productId={PRODUCT_ID}"> <img src="skins/Sandbox/php/getImg.php?src={SRC_PROD_THUMB}&amp;width=178&amp;height=130" alt="{TXT_TITLE}" border="0" title="{TXT_TITLE}" /> </a> </td>
          </tr>
        </table>
        <div class="latestProdDetails">
            <a href="index.php?_a=viewProd&amp;productId={PRODUCT_ID}" class="prodLink">{TXT_TITLE}</a>
            <br />
          	<div class="prices"> 
            	<span class="txtSale">{TXT_SALE_PRICE}</span>{TXT_PRICE}
            </div>
          <form action="skins/Sandbox/php/ajaxCart.php" method="post" name="prod{PRODUCT_ID}" id="myForm{PRODUCT_ID}">
            <input type="hidden" name="add" value="{PRODUCT_ID}" />
            <input type="hidden" name="quan" value="1" />
            <input type="hidden" name="opt" value="1" />
            <input type="hidden" name="page" value="viewCat" />
            <div class="buttons">
                <!-- BEGIN: buy_btn --><a href="javascript:doAddToCart({PRODUCT_ID});" title="{BTN_BUY}" class="buyBtn">ADD TO CART<img src="skins/Sandbox/styleImages/backgrounds/buttonArrow.gif" alt="" /></a><!-- END: buy_btn --><a href="index.php?_a=viewProd&amp;productId={PRODUCT_ID}" title="{TXT_TITLE}" class="moreBtn">MORE<img src="skins/Sandbox/styleImages/backgrounds/buttonArrow.gif" alt="" /></a>
            </div>
          </form>
        </div>
      </div>
     </div>
    <!-- END: products -->
  </div>
</div>
<!-- END: productTable -->
<!-- BEGIN: noProducts -->
<div class="typInfo">{TXT_NO_PRODUCTS}</div>
<!-- END: noProducts -->
<!-- BEGIN: pagination_bot -->
<div class="paginationBar clearfix">{PAGINATION}</div>
<!-- END: pagination_bot -->
<!-- END: view_cat -->
