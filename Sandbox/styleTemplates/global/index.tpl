<!-- BEGIN: body -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset={VAL_ISO}" />
<title>{META_TITLE}</title>
<meta name="description" content="{META_DESC}" />
<meta name="keywords" content="{META_KEYWORDS}" />
<link href="skins/{VAL_SKIN}/php/compress.php?get=../styleSheets/grid.css||../styleSheets/jquery.fancybox.css||../styleSheets/layout.css||../styleSheets/slideShow.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" language="javascript">
	var rootRel = '{VAL_ROOTREL}';
</script>
<script type="text/javascript" language="javascript" src="skins/{VAL_SKIN}/php/compress.php?get=../javascript/jslibrary.js||../javascript/jquery-1.3.2.min.js||../javascript/noConflict.js||../javascript/cookie.js||../javascript/form.js||../javascript/jquery.cycle.lite.js||../javascript/shopdev_effects.js"></script>
</head>
<body onload="initialiseMenu();{EXTRA_EVENTS}">
<div id="pageSurround" class="container">
  <div id="topHeader" class="clearfix">
  	<div class="span-28">
  		<a href="index.php"><img src="images/getLogo.php?skin=Sandbox" alt="Home" /></a>
    </div>
    <div id="topCart" class="clearfix">
        <div id="cartIcon"><a href="index.php?_g=co&amp;_a=cart"><img src="skins/{VAL_SKIN}/styleImages/icons/cartIcon.gif" width="46" height="36" alt="Shopping Cart" /></a></div>
        <div id="ajaxCart">{SHOPPING_CART}</div>
        <div id="itemsInCart"><a href="index.php?_g=co&amp;_a=cart"><img src="skins/{VAL_SKIN}/styleImages/icons/itemsInCart.gif" width="66" height="34" alt="Shopping Cart" /></a></div>
    </div>
  </div>
  <div class="pageBorder">
  <div class="siteDocBar clearfix">{SITE_DOCS}{SESSION}</div>
  <div class="siteDocBar-Shadow-1"></div>
  <div class="siteDocBar-Shadow-2"></div>
  <div id="page" class="clearfix">
    <div class="colLeft span-10 prepend-1">
        <div class="sidebox">
          {CATEGORIES}
        </div>
        <div class="sidebox">
          {POPULAR_PRODUCTS}
        </div>
        <div class="sidebox">
          {SALE_ITEMS}
        </div>
        <div class="sidebox">
          {SEARCH_FORM}
        </div>
        <div class="sidebox">
          {CURRENCY}
        </div>
        <div class="sidebox">
          {MAIL_LIST}
        </div>
          {SKIN}
    </div>
    <div class="colMid span-25 prepend-1">{PAGE_CONTENT}</div>
  </div>
</div>
</div>
<div class="txtCopyrightUpper">
	Website Designed by <a href="http://www.shopdev.co.uk" class="txtCopyright" target="_blank">ShopDev</a>
</div>
{DEBUG_INFO}
</body>
</html>
<!-- END: body -->
