/* 
	All Source Code is Copyright (2008) ShopDev: http://www.shopdev.co.uk
	All Rights Reserved.
	You are prohibited from copying or making derivitive works from any code herein without prior written permission of ShopDev.
	This file is intened for use with the Sandbox CubeCart Skin (for CubeCart V4).
	
	DESCRIPTION: This file contains and invokes a number of functions and jQuery plugins.  If you want to modify the skin's
	JavaScript behaviour, this is likely the file that you'll want to modify.
	
	VERSION: 1.0.R
	UPDATED: 23rd May 2009	
*/

// START: Global Variables - change these if you wish

	var skinName = "Sandbox_Light";		// Name of the skin directory
	var noAJAX = false;					// Disable the AJAX Add To Cart feature (will still use JavaScript, but not AJAX).
	var disableSB = false;				// Disable the ability for users to expand/collapse the side-boxes.
	var sbAnmSpd = "fast";				// Sidebox animation speed (options: "fast", "normal", "slow").
	var cookieExp = 365;				// Days until cookies expire - from time of creation.
	var cookiePrefix = "sd_sandbox_";	// Prefix to cookie name.
	var cookiePath = "/";				// Cookie path - you probably won't want to change this.
	var hideStk = false;				// Always hide stock information from visitors.
	var timeOutVal = 10000;				// Number of milliseconds (i.e. 1000ms = 1s) to wait for an AJAX response before retrying
	var retryAttempts = 5;				// Number of AJAX Add To Cart attempts before reverting to JavaScript sumbission
	var slideShow = false;				// Enable the sale item slideshow
	
// END: Global Variables - don't change anything below this line unless you know what you're doing

// START: Shake Plugin
	jQuery.fn.shake = function(intShakes, intDistance, intDuration) {
		this.each(function() {
			jQuery(this).css({position:'relative'});
			for (var x=1; x<=intShakes; x++) {
				jQuery(this).animate({left:(intDistance*-1)}, (((intDuration/intShakes)/4)))
				.animate({left:intDistance}, ((intDuration/intShakes)/2))
				.animate({left:0}, (((intDuration/intShakes)/4)));
			}
		});
		return this;
	};
// END: Shake Plugin

// START: Collapsible Side Boxes - Copyright ShopDev.co.uk 
	// 'var q' takes the sidebox title image
	function slideBox(q) {
		if (q.attr("class")!= "noCollapse") {
			if(q.attr("class")=="collapsed") {
				q.parents(".sidebox").children(".boxContentLeft").slideDown(sbAnmSpd);
				q.removeClass("collapsed");
				q.attr("src", rootRel + "skins/"+skinName+"/styleImages/icons/bullet_arrow_up.gif");
				var boxID = q.parents(".sidebox").attr("id");
				jQuery.cookie(cookiePrefix + boxID, 1, { expires: cookieExp, path:cookiePath});
			} else {
				q.parents(".sidebox").children(".boxContentLeft").slideUp(sbAnmSpd);
				q.addClass("collapsed");
				q.attr("src", rootRel + "skins/"+skinName+"/styleImages/icons/bullet_arrow_down.gif");
				var boxID = q.parents(".sidebox").attr("id");
				jQuery.cookie(cookiePrefix + boxID, 0, { expires: cookieExp, path:cookiePath });
			}
		}
	}
// END: Collapsible Side Boxes - Copyright ShopDev.co.uk 

// START: document.ready
	jQuery(function() {
			   
		// START: Check if IE
			isIE = (jQuery.browser.msie && parseInt(jQuery.browser.version.substr(0,1)) < 8);
		// END: Check if IE
		
		// START: AJAX Add To Cart - Copyright ShopDev.co.uk 
			jQuery("#ajaxCart").load(rootRel + "skins/" + skinName + "/php/ajaxCart.php" + "?nocache=" + Math.random());
		// END: AJAX Add To Cart - Copyright ShopDev.co.uk 
		
		// START: Collapsible Side Boxes - Copyright ShopDev.co.uk 
			if (disableSB != true) {
				
				// change the cursor
				jQuery("div.boxTitleLeft img").each(function(){
					if (jQuery(this).attr("class") != "noCollapse") {
						jQuery(this).css("cursor","pointer");
						jQuery(this).parent('.boxTitleLeft').css("cursor","pointer");
					}
				});
				
				// executed when DOM is ready
				jQuery("#page > .colLeft > div.sidebox").each(function(i) {
					
					// define some elements to avoid excessive DOM traversing
					var SB_title = jQuery(this).children(".boxTitleLeft");
					var SB_img = SB_title.children("img");
					var SB_content = jQuery(this).children(".boxContentLeft");
					
					// check for default collapsed status
					if (SB_img.attr("class") == "collapsed") {
						SB_content.css("display","none");
						SB_img.attr("src", rootRel + "skins/"+skinName+"/styleImages/icons/bullet_arrow_down.gif");
					}
					
					// identify cart or store-front pages
					if(typeof(isCart) == "undefined") {
						// for store-front pages
						jQuery(this).attr("id","box-" + i);
					} else {
						// for cart pages
						jQuery(this).attr("id","cartbox-" + i);
					}
					
					// identify the name of the cookie we're dealing with
					var cookieName = cookiePrefix + jQuery(this).attr("id");
					
					// apply the preferences stored in the cookie
					if (jQuery.cookie(cookieName) == 0) {
						// collapse the sidebox
						SB_content.css("display","none");
						SB_img.addClass("collapsed");
						SB_img.attr("src", rootRel + "skins/"+skinName+"/styleImages/icons/bullet_arrow_down.gif");
					} else if (jQuery.cookie(cookieName) == 1){
						// expand the sidebox
						SB_content.css("display","block");
						SB_img.removeClass("collapsed");
						SB_img.attr("src", rootRel + "skins/"+skinName+"/styleImages/icons/bullet_arrow_up.gif");
					} else if (SB_img.attr("class") == "collapsed") {
						SB_img.attr("src", rootRel + "skins/"+skinName+"/styleImages/icons/bullet_arrow_down.gif");
					} else if (SB_img.attr("class") != "noCollapse") {
						SB_img.attr("src", rootRel + "skins/"+skinName+"/styleImages/icons/bullet_arrow_up.gif");
					}
					// end - user overwrite
				});
				
				// slide the sideboxes on click
				jQuery(".boxTitleLeft").click(function() {
					slideBox(jQuery(this).children("img"));
				});
				
			}
		// END: Collapsible Side Boxes - Copyright ShopDev.co.uk 
		
		// START: Display Stock Info - Copyright ShopDev.co.uk 
		if ( jQuery("div.stockLevel").length > 0 ) {
			if((jQuery("div.stockLevel").html().toLowerCase() != '<span class="txtoutofstock"></span>') && (hideStk != true) && (jQuery("div.stockLevel").html().toLowerCase() != '<span class=txtoutofstock></span>')) {
				jQuery("div.stockLevel").show();
			}
		}
		// END: Display Stock Info - Copyright ShopDev.co.uk 
		
		// START: viewProd Tabs
			var tabContainers = jQuery('div.tabContainer > div');
			
			jQuery('ul#tabBar a').click(function () {
				tabContainers.hide().filter(this.hash).show();
				jQuery('ul#tabBar a').removeClass('active');
				jQuery(this).addClass('active');
				
				return false;
			}).filter(':first').click();
		// END: viewProd Tabs		
	});
// END: document.ready
	
// START: AJAX Add To Cart - Copyright ShopDev.co.uk 
	var options = { 
		beforeSubmit: showRequest,
		success: showResponse,
		timeout: timeOutVal,
		error: timeoutError
	};
	
	function doAddToCart(productID,manual) { 
		if (manual == true) {
			// used for debugging mostly - no ajax
			jQuery('#myForm'+productID).submit();
		}
		if ((noAJAX == true) || (parseFloat(jQuery.cookie(cookiePrefix + "ajax_errors")) > retryAttempts)) {
			// just submit the form
			jQuery('#myForm'+productID).append('<input type="hidden" name="noAJAX" value="1" />').submit();
		} else {
			// use ajax. woohoo!
			errorProdID = productID;
			jQuery('#myForm'+productID).ajaxSubmit(options);
		}
	};
	
	function showRequest(formData, jqForm, options) { 
		// form data array
		var showReqData = jqForm[0];
		// product id
		var prodID = showReqData['add'].value;
		// page template (used to select button classes)
		var pageTemplate = showReqData['page'].value;
		// hide loading icon
		jQuery('.AJAX-confirm-'+prodID).hide();
		// show cart icon
		jQuery('.AJAX-process-'+prodID).show();
		// change the button text
		jQuery("#myForm"+prodID+" a.buyBtn").html('Please Wait<img alt="" src="'+rootRel+'skins/'+skinName+'/styleImages/backgrounds/buttonArrow.gif"/>');
		// change button classes
		jQuery("#myForm"+prodID+" a.moreBtn").removeClass("moreBtn-active");
		jQuery("#myForm"+prodID+" a.buyBtn").removeClass("buyBtn-active");
		// for viewProd (where buy button is on its own)
		if (pageTemplate == 'viewProd') {
			jQuery("#myForm"+prodID+" a.buyBtn").removeClass("singleBtn-active");
			jQuery("#myForm"+prodID+" a.buyBtn").addClass("singleBtn");
		}
	} 
					  
	function showResponse(response, jqForm, jQueryform, options) {
		// form data array
		var showResData = jQueryform[0];
		// product id
		var prodID = showResData['add'].value;
		// check to redirect
		if (response.indexOf('http://') == 0) {
			window.location = response;
			return false; // don't continue, just redirect
		}
		// run the usual confirmation routine
		doSuccess(prodID,response);
	}
	
	function doSuccess(prodID,response) {
		jQuery("#ajaxCart").html(response);
		// shake the cart icon
		jQuery("#cartIcon").shake(3, 5, 600);
		// hide the loading icon
		jQuery(".AJAX-process-" + prodID).hide();
		// show the cart icon
		jQuery(".AJAX-confirm-" + prodID).show();
		// change the button classes
		jQuery("#myForm"+prodID+" a.buyBtn").addClass("buyBtn-active");
		jQuery("#myForm"+prodID+" a.singleBtn").addClass("singleBtn-active").removeClass("singleBtn");
		jQuery("#myForm"+prodID+" a.moreBtn").addClass("moreBtn-active");
		// change the button text
		jQuery("#myForm"+prodID+" a.buyBtn").html('Added To Cart<img alt="" src="'+rootRel+'skins/'+skinName+'/styleImages/backgrounds/buttonArrow_added.gif"/>');
	}
	
	// if submission times out
	function timeoutError(options) {
		// count the number of errors
		if (jQuery.cookie(cookiePrefix + "ajax_errors") == 'NaN') {
			jQuery.cookie(cookiePrefix + "ajax_errors", 1, { expires: cookieExp, path:cookiePath });
		} else {
			jQuery.cookie(cookiePrefix + "ajax_errors", parseFloat(jQuery.cookie(cookiePrefix + "ajax_errors")) + 1, { expires: cookieExp, path:cookiePath });
		}
		// retry adding the item
		doAddToCart(errorProdID,false);
	}
// END: AJAX Add To Cart - Copyright ShopDev.co.uk

// START: Stars~Hover - Copyright ShopDev.co.uk
	function starsHover(rating, pathImg) {
		/* Positive Stars */
		for (var i = 0; i <= rating; i++) {
			if (i>0) findObj("star"+i).src = pathImg+'1.gif';
		}
		/* Negative Stars */
		for (var i = rating+1; i <= 5; i++) {
			findObj("star"+i).src = pathImg+'0.gif';
		}
	}
// END: Stars~Hover - Copyright ShopDev.co.uk

// START: Stars~Mouse Out - Copyright ShopDev.co.uk
	function starsOut(pathImg) {
		var val = jQuery("#rating_val").val();
		if (val == "") { val = 0; }
		/* Show selected stars as per rating */
		for (var i = 0; i <= val; i++) {
			if (i>0) {
				jQuery("#star"+i).attr({src: pathImg+"1.gif"});
			}
		}
		/* Hide stars higher than selected rating */
		for (var i = 0; (i <= 5); i++) {
			if (i>val) {
				jQuery("#star"+i).attr({src: pathImg+"0.gif"});
			}
		}
	}
// END: Stars~Mouse Out - Copyright ShopDev.co.uk

// START: Read Review/Description Redirect (with SEO URL) - Copyright ShopDev.co.uk
	function readReview() {
		if (isIE) {
			jQuery('embed, object, select').css('visibility', 'hidden');
		}

		jQuery("#fancy_overlay").css('opacity', 0.3).show();
		jQuery.fn.fancybox.showLoading();
		window.location = jQuery("#readReviewLink").attr("href");
		return false;
	}
	
	function readDescription() {
		if (isIE) {
			jQuery('embed, object, select').css('visibility', 'hidden');
		}

		jQuery("#fancy_overlay").css('opacity', 0.3).show();
		jQuery.fn.fancybox.showLoading();
		window.location = jQuery('a#readDescriptionLink').attr("href");
	}
// END: Read Review/Description Redirect (with SEO URL) - Copyright ShopDev.co.uk