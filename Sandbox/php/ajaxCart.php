<?php
/*
##########################################################################################################################
	AJAX ADD TO CART
##########################################################################################################################

	This file displays the contents of the user's shopping cart.

	Author: ShopDev
	Written For: CubeCart V4
	Version: 1.1.R
	Release Date: 20th September 2010
	Support: http://www.shopdev.co.uk

##########################################################################################################################
*/

## include required files
require_once ("../../../ini.inc.php");
require_once ("../../../includes".CC_DS."global.inc.php");
require_once ("../../../includes".CC_DS."sef_urls.inc.php");
require_once ("../../../classes".CC_DS."db".CC_DS."db.php");
require_once ("../../../classes".CC_DS."cache".CC_DS."cache.php");
require_once ("../../../classes".CC_DS."session".CC_DS."cc_session.php");
require_once ('../../../includes'.CC_DS.'functions.inc.php');
require_once ("../../../classes".CC_DS."cart".CC_DS."shoppingCart.php");
require_once ("../../../classes".CC_DS."xtpl".CC_DS."xtpl.php");

class Ajax_Session extends session
{
	function Ajax_Session($config, $db, $glob, $ini)
	{
		$this->config = $config;
		$this->db = $db;
		$this->glob = $glob;
		$this->ini = $ini;

		if (isset($_GET[CC_SESSION_NAME])) {
			$this->set_cc_cookie(CC_SESSION_NAME, $_GET[CC_SESSION_NAME], $this->config['sqlSessionExpiry']);
		} else {
			$results = false;
			## see if session is still in db
			if(!empty($GLOBALS[CC_SESSION_NAME])) {
				$query = sprintf('SELECT `sessId` FROM %sCubeCart_sessions WHERE `sessId` = %s', $this->glob['dbprefix'], $this->db->mySQLSafe($GLOBALS[CC_SESSION_NAME]));
				$results = $this->db->select($query);
			}

			## !empty($results[0]['sessId']) critical in case results=true if session DB table has an empty sessionId!!
			if ($results && !empty($results[0]['sessId'])) {
				$data['timeLast'] = $this->db->mySQLSafe(time());
				$data['location'] = $this->db->mySQLSafe(currentPage());
				$update = $this->db->update($this->glob['dbprefix'].'CubeCart_sessions', $data, '`sessId` = '.$this->db->mySQLSafe($results[0]['sessId']));
			} else {
				$this->makeSession();
			}
		}

		$this->set_cc_cookie(CC_SESSION_NAME, $GLOBALS[CC_SESSION_NAME], $this->config['sqlSessionExpiry']);

		$query = sprintf("SELECT * FROM %1\$sCubeCart_sessions LEFT JOIN %1\$sCubeCart_customer ON %1\$sCubeCart_sessions.customer_id = %1\$sCubeCart_customer.customer_id WHERE `sessId` = %2\$s", $this->glob['dbprefix'], $this->db->mySQLSafe($GLOBALS[CC_SESSION_NAME]));

		$result = $this->db->select($query);

		$this->ccUserData = $result[0];
	}

	function set_cc_cookie($name, $value, $length = 0) {
		## only set the cookie if the visitor is not a spider or search engine system is off
		if (!$this->user_is_search_engine() || !$this->config['sef']) {
			$expires = ($length>0) ? (time()+$length) : 0;
			$urlParts = parse_url($GLOBALS['storeURL']);
			$domain = (empty($urlParts['host']) || !strpos($urlParts['host'], '.')) ? false : str_replace('www.','.',$urlParts['host']);
			$path = ($glob['rootRel']) ? $glob['rootRel'] : '/';
			setcookie($name, $value, $expires, '/', $domain);
		}
	}
}

## initialize the classes
$db = new db();
$config = fetchDbConfig("config");
$cc_session = new Ajax_Session($config, $db, $glob, $ini);
$cart = new cart();
$box_content = new XTemplate("..".CC_DS."styleTemplates".CC_DS."boxes".CC_DS."ajaxCart.tpl","",NULL,"main",TRUE,TRUE);

## Get numeric value of CubeCart version
$version = preg_replace('(\D+)', '', $ini["ver"]);

## Get the language file
$langBully = true;
$lang = include("../../../language/en/common.inc.php");
$lang = $bully;
$lang = getLang("includes".CC_DS."boxes".CC_DS."shoppingCart.inc.php");
$box_content->assign("LANG_SHOPPING_CART_TITLE",$lang['shoppingCart']['shopping_cart']);

if (!$cc_session->user_is_search_engine()) { // || !$config['sef']) {

	## get the language file
	$lang = getLang("includes" . CC_DS . "boxes" . CC_DS . "shoppingCart.inc.php");
	$box_content->assign("LANG_SHOPPING_CART_TITLE", $lang['shoppingCart']['shopping_cart']);

	## fetch the basket data
	$basket = $cart->cartContents($cc_session->ccUserData['basket']);

	if (isset($_POST['add']) && $_POST['add']>0) {

		if (!isset($_POST['productOptions'])) {
			## check product options are selected if they are required
			$prodOpts = $db->select("SELECT count(product) as noOpts FROM ".$glob['dbprefix']."CubeCart_options_bot WHERE product=".$db->mySQLSafe($_POST['add']));
			## if they are required redirect to product view page
			if ($prodOpts[0]['noOpts'] > 0) {
				if ($config['sef']) {
					## Generate a SEO URL
					$productUrl = generateProductUrl($_POST['add']).'?notice=1';
				} else {
					$productUrl = 'index.php?_a=viewProd&productId='.$_POST['add'].'&notice=1';
				}
				if ($_POST['noAJAX']) {
					httpredir($glob['storeURL'].'/'.$productUrl);
				}
				die($glob['storeURL'].'/'.$productUrl);
				exit;
			}
		}


		## add product to the cart
		$quantity = (is_numeric($_POST['quan']) && $_POST['quan'] > 0) ? $_POST['quan'] : 1;

		## Allow for integer AND float quantities
		$quantity = (isset($prodType[0]['prodType']) && $prodType[0]['prodType'] == 2) ? $quantity : ceil($quantity);
		$basket	= (isset($_POST['productOptions'])) ? $basket = $cart->add($_POST['add'], $quantity, $_POST['productOptions']) : $cart->add($_POST['add'], $quantity, '');

		## Go to cart or back to same page
		if ($config['add_to_basket_act']) {
			## Go to the cart
			if ($cc_session->ccUserData['customer_id'] > 0) {
				$redirPath = $glob['storeURL']."/index.php?_g=co&_a=step2";
			} else {
				$redirPath = $glob['storeURL']."/index.php?_g=co&_a=cart";
			}

			if ($_POST['noAJAX']) {
				httpredir($redirPath);
			} else {
				die($redirPath);
			}
		} else {
			## Back to same page
			$allowedVars = array('_a', 'category', 'catId', 'docId', 'page', 'priceMax', 'priceMin', 'prodId', 'productId', 'review', 'searchStr');

			## Stay on same page but get rid of those pesky post variables
			parse_str(parse_url($_SERVER['HTTP_REFERER'], PHP_URL_QUERY), $query);

			if (isset($query['searchStr'])) {
				## Rehash this later - could benefit from the code used below
				if (is_array($query) && !empty($query)) {
					foreach ($query as $key => $value) {
						if (in_array($key, $allowedVars) && !empty($value)) {
							#$append[$key] = $value;
							if (is_array($value)) {
								foreach ($value as $val) {
									$queryArray[] = sprintf('%s[]=%d', $key, $val);
								}
							} else {
								$queryArray[] = sprintf('%s=%s', $key, urlencode($value));
							}
						}
					}
					## Add flash basket
					$queryArray[]	= "added=1";
					$querystring	= '?'.implode('&', $queryArray);
				}
				if ($_POST['noAJAX']) {
					httpredir($glob['storeURL'].'/index.php'.$querystring);
				} else {
					//die($glob['storeURL'].'/index.php'.$querystring);
				}
			} else {
				## need to add added=1, as well as any allowed vars - PHP5 compatible
				if (!preg_match('#^'.$GLOBALS['storeURL'].'#', $_SERVER['HTTP_REFERER']) || empty($_SERVER['HTTP_REFERER'])) {
					if ($_POST['noAJAX']) {
						httpredir($glob['storeURL'] . '/index.php');
					} else {
						//die($glob['storeURL'].'/index.php');
					}
				} else {
					$return_url		= parse_url($_SERVER['HTTP_REFERER']);
					if (is_array($query)) {
						foreach ($query as $key => $value) {
							if (in_array($key, $allowedVars) && !empty($value)) {
								$append[$key] = $value;
							}
						}
					}
					$append['added']	= 1;
					$redirect_to = sprintf('%s/%s?%s', $glob['storeURL'], substr($return_url['path'], strlen($glob['rootRel'])), http_build_query($append));
					if ($_POST['noAJAX']) {
						httpredir($redirect_to);
					} else {
						//die($redirect_to);
					}
				}
			}
		}
	}


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

	if (is_array($basket['conts']) && !empty($basket['conts'])) {
		foreach ($basket['conts'] as $key => $value) {
			if ($basket['conts'][$key]['custom'] == true) {
				$price = $basket['conts'][$key]['gcInfo']['amount'];
				$name =  $lang['shoppingCart']['gift_cert'];
			} else {
				$productId = $cart->getProductId($key);

				## Get product details
				$product = $db->select("SELECT name, price, sale_price, productId FROM ".$glob['dbprefix']."CubeCart_inventory WHERE productId=".$db->mySQLSafe($productId));
				if (($val = prodAltLang($product[0]['productId'])) == true) {
					$product[0]['name'] = $val['name'];
				}

				## Build the product options

				$optionKeys = $cart->getOptions($key);
				$optionsCost = 0;

				if (!empty($optionKeys)) {
					$options = ($version >= 434) ? explode('{|}', $optionKeys) : explode('|', $optionKeys); # new delimiter for > V4.3.4
					foreach ($options as $value) {
						## Split on separator
						$value_data     = ($version >= 434) ? explode('{@}', $value) : explode('@', $value); # new delimiter for > V4.3.4
						$option_top		= $db->select(sprintf("SELECT T.* FROM %1\$sCubeCart_options_top AS T WHERE T.option_id = %2\$s", $glob['dbprefix'], $value_data[0]));
						if ($option_top) {
							$option_name	= $option_top[0]['option_name'];
							if ($option_top[0]['option_type'] == 0) {
								$option		= $db->select(sprintf("SELECT M.*, B.* FROM %1\$sCubeCart_options_mid AS M, %1\$sCubeCart_options_bot AS B WHERE M.value_id = B.value_id AND B.assign_id = %2\$d", $glob['dbprefix'], $value_data[1]));
								if ($option) {
									$option_price	= $option[0]['option_price'];
									$option_symbol	= $option[0]['option_symbol'];
									$option_value	= $option[0]['value_name'];
								}
							} else {
								$option			= $db->select(sprintf("SELECT B.* FROM %1\$sCubeCart_options_bot AS B WHERE B.option_id = %2\$d AND B.product = %3\$d LIMIT 1", $glob['dbprefix'], $value_data[0], $productId));
								if ($option) {
									$option_price	= $option[0]['option_price'];
									$option_symbol	= $option[0]['option_symbol'];
									$option_value	= $value_data[1];
								}
							}
						}
						if ($option_price > 0) {
							if ($option_symbol == "+") {
								$optionsCost = $optionsCost + $option_price;
							} else if ($option_symbol == "-") {
								$optionsCost = $optionsCost - $option_price;
							} else if ($option_symbol == "~") {
								$optionsCost = 0;
							}
						}
					}
				}
				$price = (salePrice($product[0]['price'], $product[0]['sale_price']) == false) ? $price = $product[0]['price'] : salePrice($product[0]['price'], $product[0]['sale_price']);

				$price += $optionsCost;
				if ($price < 0) $price = 0;
				$name = validHTML($product[0]['name']);
			}

			$box_content->assign("PRODUCT_PRICE", priceFormat($price, true));
			$box_content->assign("VAL_NO_PRODUCT", $cart->cartArray['conts'][$key]["quantity"]);
			$box_content->assign("PRODUCT_ID", $productId);

			## Chop name if too long
			if (strlen($name) > 15) $name = substr($name,0,15)."..";
			$box_content->assign("VAL_PRODUCT_NAME", validHTML($name));
			$box_content->parse("ajax_cart.contents_true");
			$cartTotal = $cartTotal + ($price * $cart->cartArray['conts'][$key]["quantity"]);
		}
	} else {
		$box_content->assign("LANG_CART_EMPTY",$lang['shoppingCart']['basket_empty']);
		$box_content->assign("VAL_SKIN",$skin_name); ## define the skin name/dir
		$box_content->parse("ajax_cart.contents_false");
	}

	$box_content->assign("VAL_CART_ITEMS", $cart->noItems());
	$box_content->assign("LANG_ITEMS_IN_CART", $lang['shoppingCart']['items_in_cart']);

	if (isset($cartTotal) && $cartTotal>0) {
		$box_content->assign("VAL_CART_TOTAL", priceFormat($cartTotal,true));
	} else {
		$box_content->assign("VAL_CART_TOTAL", priceFormat(0, TRUE));
	}

	$box_content->assign("LANG_TOTAL_CART_PRICE",$lang['shoppingCart']['total']);
	$box_content->assign("LANG_VIEW_CART",$lang['shoppingCart']['view_basket']);

	if ($cc_session->ccUserData['customer_id']>0) {
		$box_content->assign("CART_STEP", "step2");
	} else {
		$box_content->assign("CART_STEP", "cart");
	}

	if (($config['hide_prices']) && (!$cc_session->ccUserData['customer_id']) && (!$GLOBALS[CC_ADMIN_SESSION_NAME])) {
		// have a break, have a KitKat
	} else {
		$box_content->parse("ajax_cart.view_cart");
	}

	## parse the template
	$box_content->parse("ajax_cart");
	$box_content = $box_content->text("ajax_cart");

	## output the parsed template from this file
	echo $box_content;
} else {
	$box_content = null;
}
?>
