<?php
/*
##########################################################################################################################
	Sale Item Slideshow
##########################################################################################################################

	This file builds an unordered list from your store's items that are marked on sale.
	
	1.1.R : Changed from direct output to using the templating system.
	
	Author: ShopDev
	Written For: CubeCart V4
	Version: 1.1.R
	Release Date: 27th February 2009
	
##########################################################################################################################
*/

## include required files
require_once ("../../../ini.inc.php");
require_once ("../../../includes".CC_DS."global.inc.php");
require_once ("../../../classes".CC_DS."db".CC_DS."db.php");
require_once ("../../../classes".CC_DS."session".CC_DS."cc_session.php");
require_once ("../../../includes".CC_DS."functions.inc.php");
require_once ("../../../includes".CC_DS."sef_urls.inc.php");
require_once ("../../../classes".CC_DS."xtpl".CC_DS."xtpl.php");
require_once ("../../../classes".CC_DS."cache".CC_DS."cache.php");

## initialize the classes
$db = new db();
$cc_session = new session();
$box_content = new XTemplate("..".CC_DS."styleTemplates".CC_DS."boxes".CC_DS."slideShow.tpl","",NULL,"main",TRUE,TRUE);

## get store configuration
$config = fetchDbConfig("config");
	
## read from the cache if available
$cache = new cache("boxes.slideShow");
$slideShow = $cache->readCache();

## get the currency
if (!empty($cc_session->ccUserData['currency'])) {
	$cCode = $cc_session->ccUserData['currency'];
} else {
	if (isset($_COOKIE['currency']) && !empty($_COOKIE['currency'])) {
		$cCode = $_COOKIE['currency'];
	}
	$cCode = $config['defaultCurrency'];
}

$query = sprintf("SELECT value, symbolLeft, symbolRight, decimalPlaces, name, decimalSymbol FROM %sCubeCart_currencies WHERE code=%s", $glob['dbprefix'], $db->mySQLSafe($cCode));
$currencyVars = $db->select($query);


if (!$cache->cacheStatus) {
	$slideShow = $db->select("SELECT I.name, I.productId, I.image, I.price, I.description, I.sale_price, I.price-I.sale_price AS saving FROM ".$glob['dbprefix']."CubeCart_inventory AS I, ".$glob['dbprefix']."CubeCart_category AS C WHERE C.cat_id = I.cat_id AND (C.cat_desc != '##HIDDEN##' OR C.cat_desc IS NULL) AND I.disabled = '0' AND I.price > I.sale_price AND I.sale_price > 0 AND I.cat_id > 0 ORDER BY saving DESC",$config['noSaleBoxItems']);
	$cache->writeCache($slideShow);
}

## if sale mode is enabled *and* there are items on sale
if ($slideShow && $config['saleMode'] > 0) {
	
	## initialize the salePrice variable
	$salePrice = 0;
	
	## get the skin name
	$box_content->assign("SKIN", $skin_name);
	
	## for each product on sale
	for ($i=0; $i<count($slideShow); $i++){
		
		if (($val = prodAltLang($slideShow[$i]['productId'])) == true) {
			$slideShow[$i]['name'] = $val['name'];
		}
		
		## get the name and product ID
		$saleProd["name"] = validHTML($slideShow[$i]['name']);
		$saleProd["productId"] = $slideShow[$i]['productId'];
		
		## get the image from the database here (rather than using getImg.php to lookup the ID) since the results are cached
		$imgRootPath = imgPath($slideShow[$i]['image'],$thumb=0,$path="root");
		$imgRelPath	= imgPath($slideShow[$i]['image'],$thumb=0,$path="rel");
		
		if (file_exists($imgRootPath) && !empty($slideShow[$i]['image'])) {
			$saleProd["image"] = $imgRelPath;
		} else {
			$saleProd["image"] = "skins/".$skin_name."/styleImages/thumb_nophoto.gif";
		}
		
		if (strlen($slideShow[$i]['description']) > $config['productPrecis']) {
			$saleProd["description"] = substr(strip_tags($slideShow[$i]['description']), 0, $config['productPrecis'])."&hellip;";
		} else {
			$saleProd["description"] = strip_tags($slideShow[$i]['description']);
		}
		
		## calculate the savings
		$salePrice = salePrice($slideShow[$i]['price'], $slideShow[$i]['sale_price']);
		$saleProd["saving"] = priceFormat($slideShow[$i]['price'] - $salePrice,true);
		
		## parse for each product	
		$box_content->assign('DATA', $saleProd);
		$box_content->parse("slide_show.li");
		
	}
	
	## parse the template
	$box_content->parse("slide_show");
	$box_content = $box_content->text("slide_show");
	
	## output the parsed template from *this* file
	echo $box_content;		
}
?>