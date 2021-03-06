/**
 * Galleria (http://monc.se/kitchen)
 *
 * Galleria is a javascript image gallery written in jQuery. 
 * It loads the images one by one from an unordered list and displays thumbnails when each image is loaded. 
 * It will create thumbnails for you if you choose so, scaled or unscaled, 
 * centered and cropped inside a fixed thumbnail box defined by CSS.
 * 
 * The core of Galleria lies in it's smart preloading behaviour, snappiness and the fresh absence 
 * of obtrusive design elements. Use it as a foundation for your custom styled image gallery.
 *
 * MAJOR CHANGES v.FROM 0.9
 * Galleria now features a useful history extension, enabling back button and bookmarking for each image.
 * The main image is no longer stored inside each list item, instead it is placed inside a container
 * onImage and onThumb functions lets you customize the behaviours of the images on the site
 *
 * Tested in Safari 3, Firefox 2, MSIE 6, MSIE 7, Opera 9
 * 
 * Version 1.0
 * Februari 21, 2008
 *
 * Copyright (c) 2008 David Hellsing (http://monc.se)
 * Licensed under the GPL licenses.
 * http://www.gnu.org/licenses/gpl.txt
 **/

(function(jQuery){

var jQueryjQuery;


/**
 * 
 * @desc Convert images from a simple html <ul> into a thumbnail gallery
 * @author David Hellsing
 * @version 1.0
 *
 * @name Galleria
 * @type jQuery
 *
 * @cat plugins/Media
 * 
 * @example jQuery('ul.gallery').galleria({options});
 * @desc Create a a gallery from an unordered list of images with thumbnails
 * @options
 *   insert:   (selector string) by default, Galleria will create a container div before your ul that holds the image.
 *             You can, however, specify a selector where the image will be placed instead (f.ex '#main_img')
 *   history:  Boolean for setting the history object in action with enabled back button, bookmarking etc.
 *   onImage:  (function) a function that gets fired when the image is displayed and brings the jQuery image object.
 *             You can use it to add click functionality and effects.
 *             f.ex onImage(image) { image.css('display','none').fadeIn(); } will fadeIn each image that is displayed
 *   onThumb:  (function) a function that gets fired when the thumbnail is displayed and brings the jQuery thumb object.
 *             Works the same as onImage except it targets the thumbnail after it's loaded.
 *
**/

jQueryjQuery = jQuery.fn.galleria = function(jQueryoptions) {
	
	// check for basic CSS support
	if (!jQueryjQuery.hasCSS()) { return false; }
	
	// init the modified history object
	jQuery.historyInit(jQueryjQuery.onPageLoad);
	
	// set default options
	var jQuerydefaults = {
		insert      : '.galleria_container',
		history     : true,
		clickNext   : true,
		onImage     : function(image,caption,thumb) {},
		onThumb     : function(thumb) {}
	};
	

	// extend the options
	var jQueryopts = jQuery.extend(jQuerydefaults, jQueryoptions);
	
	// bring the options to the galleria object
	for (var i in jQueryopts) {
		if (i) {
			jQuery.galleria[i]  = jQueryopts[i];
		}
	}
	
	// if no insert selector, create a new division and insert it before the ul
	var _insert = ( jQuery(jQueryopts.insert).is(jQueryopts.insert) ) ? 
		jQuery(jQueryopts.insert) : 
		jQuery(document.createElement('div')).insertBefore(this);
		
	// create a wrapping div for the image
	var _div = jQuery(document.createElement('div')).addClass('galleria_wrapper');
	
	// create a caption span
	var _span = jQuery(document.createElement('span')).addClass('caption');
	
	// inject the wrapper in in the insert selector
	_insert.addClass('galleria_container').append(_div).append(_span);
	
	//-------------
	
	return this.each(function(){
		
		// add the Galleria class
		jQuery(this).addClass('galleria');
		
		// loop through list
		jQuery(this).children('li').each(function(i) {
			
			// bring the scope
			var _container = jQuery(this);
			                
			// build element specific options
			var _o = jQuery.meta ? jQuery.extend({}, jQueryopts, _container.data()) : jQueryopts;
			
			// remove the clickNext if image is only child
			_o.clickNext = jQuery(this).is(':only-child') ? false : _o.clickNext;
			
			// try to fetch an anchor
			var _a = jQuery(this).find('a').is('a') ? jQuery(this).find('a') : false;
			
			// reference the original image as a variable and hide it
			var _img = jQuery(this).children('img').css('display','none');
			
			// extract the original source
			var _src = _a ? _a.attr('href') : _img.attr('src');
			
			// find a title
			var _title = _a ? _a.attr('title') : _img.attr('title');
			
			// create loader image            
			var _loader = new Image();
			
			// check url and activate container if match
			if (_o.history && (window.location.hash && window.location.hash.replace(/\#/,'') == _src)) {
				_container.siblings('.active').removeClass('active');
				_container.addClass('active');
			}
		
			// begin loader
			jQuery(_loader).load(function () {
				
				// try to bring the alt
				jQuery(this).attr('alt',_img.attr('alt'));
				
				//-----------------------------------------------------------------
				// the image is loaded, let's create the thumbnail
				
				var _thumb = _a ? 
					_a.find('img').addClass('thumb noscale').css('display','none') :
					_img.clone(true).addClass('thumb').css('display','none');
				
				if (_a) { _a.replaceWith(_thumb); }
				
				if (!_thumb.hasClass('noscale')) { // scaled tumbnails!
					var w = Math.ceil( _img.width() / _img.height() * _container.height() );
					var h = Math.ceil( _img.height() / _img.width() * _container.width() );
					if (w < h) {
						_thumb.css({ height: 'auto', width: _container.width(), marginTop: -(h-_container.height())/2 });
					} else {
						_thumb.css({ width: 'auto', height: _container.height(), marginLeft: -(w-_container.width())/2 });
					}
				} else { // Center thumbnails.
					// a tiny timer fixed the width/height
					window.setTimeout(function() {
						_thumb.css({
							marginLeft: -( _thumb.width() - _container.width() )/2, 
							marginTop:  -( _thumb.height() - _container.height() )/2
						});
					}, 1);
				}
				
				// add the rel attribute
				_thumb.attr('rel',_src);
				
				// add the title attribute
				_thumb.attr('title',_title);
				
				// add the click functionality to the _thumb
				_thumb.click(function() {
					jQuery.galleria.activate(_src);
				});
				
				// hover classes for IE6
				_thumb.hover(
					function() { jQuery(this).addClass('hover'); },
					function() { jQuery(this).removeClass('hover'); }
				);
				_container.hover(
					function() { _container.addClass('hover'); },
					function() { _container.removeClass('hover'); }
				);

				// prepend the thumbnail in the container
				_container.prepend(_thumb);
				
				// show the thumbnail
				_thumb.css('display','block');
				
				// call the onThumb function
				_o.onThumb(jQuery(_thumb));
				
				// check active class and activate image if match
				if (_container.hasClass('active')) {
					jQuery.galleria.activate(_src);
					//_span.text(_title);
				}
				
				//-----------------------------------------------------------------
				
				// finally delete the original image
				_img.remove();
				
			}).error(function () {
				
				// Error handling
			    _container.html('<span class="error" style="color:red">Error loading image: '+_src+'</span>');
			
			}).attr('src', _src);
		});
	});
};

/**
 *
 * @name NextSelector
 *
 * @desc Returns the sibling sibling, or the first one
 *
**/

jQueryjQuery.nextSelector = function(selector) {
	return jQuery(selector).is(':last-child') ?
		   jQuery(selector).siblings(':first-child') :
    	   jQuery(selector).next();
    	   
};

/**
 *
 * @name previousSelector
 *
 * @desc Returns the previous sibling, or the last one
 *
**/

jQueryjQuery.previousSelector = function(selector) {
	return jQuery(selector).is(':first-child') ?
		   jQuery(selector).siblings(':last-child') :
    	   jQuery(selector).prev();
    	   
};

/**
 *
 * @name hasCSS
 *
 * @desc Checks for CSS support and returns a boolean value
 *
**/

jQueryjQuery.hasCSS = function()  {
	jQuery('body').append(
		jQuery(document.createElement('div')).attr('id','css_test').css({ width:'1px', height:'1px', display:'none' })
	);
	var _v = (jQuery('#css_test').width() != 1) ? false : true;
	jQuery('#css_test').remove();
	return _v;
};

/**
 *
 * @name onPageLoad
 *
 * @desc The function that displays the image and alters the active classes
 *
 * Note: This function gets called when:
 * 1. after calling jQuery.historyInit();
 * 2. after calling jQuery.historyLoad();
 * 3. after pushing "Go Back" button of a browser
 *
**/

jQueryjQuery.onPageLoad = function(_src) {	
	
	// get the wrapper
	var _wrapper = jQuery('.galleria_wrapper');
	
	// get the thumb
	var _thumb = jQuery('.galleria img[@rel="'+_src+'"]');
	
	if (_src) {
		
		// new hash location
		if (jQuery.galleria.history) {
			window.location = window.location.href.replace(/\#.*/,'') + '#' + _src;
		}
		
		// alter the active classes
		_thumb.parents('li').siblings('.active').removeClass('active');
		_thumb.parents('li').addClass('active');
	
		// define a new image
		var _img   = jQuery(new Image()).attr('src',_src).addClass('replaced');

		// empty the wrapper and insert the new image
		_wrapper.empty().append(_img);

		// insert the caption
		_wrapper.siblings('.caption').text(_thumb.attr('title'));
		
		// fire the onImage function to customize the loaded image's features
		jQuery.galleria.onImage(_img,_wrapper.siblings('.caption'),_thumb);
		
		// add clickable image helper
		if(jQuery.galleria.clickNext) {
			_img.css('cursor','pointer').click(function() { jQuery.galleria.next(); });
		}
		
	} else {
		
		// clean up the container if none are active
		_wrapper.siblings().andSelf().empty();
		
		// remove active classes
		jQuery('.galleria li.active').removeClass('active');
	}

	// place the source in the galleria.current variable
	jQuery.galleria.current = _src;
	
};

/**
 *
 * @name jQuery.galleria
 *
 * @desc The global galleria object holds four constant variables and four public methods:
 *       jQuery.galleria.history = a boolean for setting the history object in action with named URLs
 *       jQuery.galleria.current = is the current source that's being viewed.
 *       jQuery.galleria.clickNext = boolean helper for adding a clickable image that leads to the next one in line
 *       jQuery.galleria.next() = displays the next image in line, returns to first image after the last.
 *       jQuery.galleria.prev() = displays the previous image in line, returns to last image after the first.
 *       jQuery.galleria.activate(_src) = displays an image from _src in the galleria container.
 *       jQuery.galleria.onImage(image,caption) = gets fired when the image is displayed.
 *
**/

jQuery.extend({galleria : {
	current : '',
	onImage : function(){},
	activate : function(_src) { 
		if (jQuery.galleria.history) {
			jQuery.historyLoad(_src);
		} else {
			jQueryjQuery.onPageLoad(_src);
		}
	},
	next : function() {
		var _next = jQuery(jQueryjQuery.nextSelector(jQuery('.galleria img[@rel="'+jQuery.galleria.current+'"]').parents('li'))).find('img').attr('rel');
		jQuery.galleria.activate(_next);
	},
	prev : function() {
		var _prev = jQuery(jQueryjQuery.previousSelector(jQuery('.galleria img[@rel="'+jQuery.galleria.current+'"]').parents('li'))).find('img').attr('rel');
		jQuery.galleria.activate(_prev);
	}
}
});

})(jQuery);


/**
 *
 * History extension for jQuery
 * Credits to http://www.mikage.to/
 *
**/


/*
 * jQuery history plugin
 *
 * Copyright (c) 2006 Taku Sano (Mikage Sawatari)
 * Licensed under the MIT License:
 * http://www.opensource.org/licenses/mit-license.php
 *
 * Modified by Lincoln Cooper to add Safari support and only call the callback once during initialization
 * for msie when no initial hash supplied.
 */


jQuery.extend({
	historyCurrentHash: undefined,
	
	historyCallback: undefined,
	
	historyInit: function(callback){
		jQuery.historyCallback = callback;
		var current_hash = location.hash;
		
		jQuery.historyCurrentHash = current_hash;
		if(jQuery.browser.msie) {
			// To stop the callback firing twice during initilization if no hash present
			if (jQuery.historyCurrentHash === '') {
			jQuery.historyCurrentHash = '#';
		}
		
			// add hidden iframe for IE
			jQuery("body").prepend('<iframe id="jQuery_history" style="display: none;"></iframe>');
			var ihistory = jQuery("#jQuery_history")[0];
			var iframe = ihistory.contentWindow.document;
			iframe.open();
			iframe.close();
			iframe.location.hash = current_hash;
		}
		else if (jQuery.browser.safari) {
			// etablish back/forward stacks
			jQuery.historyBackStack = [];
			jQuery.historyBackStack.length = history.length;
			jQuery.historyForwardStack = [];
			
			jQuery.isFirst = true;
		}
		jQuery.historyCallback(current_hash.replace(/^#/, ''));
		setInterval(jQuery.historyCheck, 100);
	},
	
	historyAddHistory: function(hash) {
		// This makes the looping function do something
		jQuery.historyBackStack.push(hash);
		
		jQuery.historyForwardStack.length = 0; // clear forwardStack (true click occured)
		this.isFirst = true;
	},
	
	historyCheck: function(){
		if(jQuery.browser.msie) {
			// On IE, check for location.hash of iframe
			var ihistory = jQuery("#jQuery_history")[0];
			var iframe = ihistory.contentDocument || ihistory.contentWindow.document;
			var current_hash = iframe.location.hash;
			if(current_hash != jQuery.historyCurrentHash) {
			
				location.hash = current_hash;
				jQuery.historyCurrentHash = current_hash;
				jQuery.historyCallback(current_hash.replace(/^#/, ''));
				
			}
		} else if (jQuery.browser.safari) {
			if (!jQuery.dontCheck) {
				var historyDelta = history.length - jQuery.historyBackStack.length;
				
				if (historyDelta) { // back or forward button has been pushed
					jQuery.isFirst = false;
					var i;
					if (historyDelta < 0) { // back button has been pushed
						// move items to forward stack
						for (i = 0; i < Math.abs(historyDelta); i++) {
							jQuery.historyForwardStack.unshift(jQuery.historyBackStack.pop());
						}
					} else { // forward button has been pushed
						// move items to back stack
						for (i = 0; i < historyDelta; i++) {
							jQuery.historyBackStack.push(jQuery.historyForwardStack.shift());
						}
					}
					var cachedHash = jQuery.historyBackStack[jQuery.historyBackStack.length - 1];
					if (cachedHash !== undefined) {
						jQuery.historyCurrentHash = location.hash;
						jQuery.historyCallback(cachedHash);
					}
				} else if (jQuery.historyBackStack[jQuery.historyBackStack.length - 1] === undefined && !jQuery.isFirst) {
					// back button has been pushed to beginning and URL already pointed to hash (e.g. a bookmark)
					// document.URL doesn't change in Safari
					if (document.URL.indexOf('#') >= 0) {
						jQuery.historyCallback(document.URL.split('#')[1]);
					} else {
						current_hash = location.hash;
						jQuery.historyCallback('');
					}
					jQuery.isFirst = true;
				}
			}
		} else {
			// otherwise, check for location.hash
			current_hash = location.hash;
			if(current_hash != jQuery.historyCurrentHash) {
				jQuery.historyCurrentHash = current_hash;
				jQuery.historyCallback(current_hash.replace(/^#/, ''));
			}
		}
	},
	historyLoad: function(hash){
		var newhash;
		
		if (jQuery.browser.safari) {
			newhash = hash;
		}
		else {
			newhash = '#' + hash;
			location.hash = newhash;
		}
		jQuery.historyCurrentHash = newhash;
		
		if(jQuery.browser.msie) {
			var ihistory = jQuery("#jQuery_history")[0];
			var iframe = ihistory.contentWindow.document;
			iframe.open();
			iframe.close();
			iframe.location.hash = newhash;
			jQuery.historyCallback(hash);
		}
		else if (jQuery.browser.safari) {
			jQuery.dontCheck = true;
			// Manually keep track of the history values for Safari
			this.historyAddHistory(hash);
			
			// Wait a while before allowing checking so that Safari has time to update the "history" object
			// correctly (otherwise the check loop would detect a false change in hash).
			var fn = function() {jQuery.dontCheck = false;};
			window.setTimeout(fn, 200);
			jQuery.historyCallback(hash);
			// N.B. "location.hash=" must be the last line of code for Safari as execution stops afterwards.
			//      By explicitly using the "location.hash" command (instead of using a variable set to "location.hash") the
			//      URL in the browser and the "history" object are both updated correctly.
			location.hash = newhash;
		}
		else {
		  jQuery.historyCallback(hash);
		}
	}
});