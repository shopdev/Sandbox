<!-- BEGIN: prod_images -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset={VAL_ISO}" />
<title>{META_TITLE}</title>
<link href="skins/{VAL_SKIN}/styleSheets/galleria.css" rel="stylesheet" type="text/css" media="screen"> 
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.2.3/jquery.min.js"></script> 
<script type="text/javascript" src="skins/{VAL_SKIN}/javascript/jquery.galleria.js"></script> 
<script type="text/javascript">
$(document).ready(function(){	
    $('.gallery_demo_unstyled').addClass('gallery_demo'); // adds new class name to maintain degradability 
    $('ul.gallery_demo').galleria({
        history   : true, // activates the history object for bookmarking, back-button etc.
        clickNext : true, // helper for making the image clickable
        insert    : '#main_image', // the containing selector for our main image
        onImage   : function(image,caption,thumb) { // let's add some image effects for demonstration purposes
            
            // fade in the image & caption
            image.css('display','none').fadeIn(1000);
            
            // fetch the thumbnail container
            var _li = thumb.parents('li');
            
            // fade out inactive thumbnail
            _li.siblings().children('img.selected').fadeTo(500,0.3);
            
            // fade in active thumbnail
            thumb.fadeTo('fast',1).addClass('selected');
        
        }
    });
});
</script>
</head>

<body>
    <div class="demo">
    <div id="main_image"></div>
    <ul class="gallery_demo_unstyled">
        <!-- BEGIN: thumbs -->
            <li><a href="skins/Sandbox/php/getImg.php?src={VALUE_SRC}&amp;width=700&amp;height=438"><img src="skins/Sandbox/php/getImg.php?src={VALUE_SRC}&amp;width=68&amp;height=50&amp;fill=1" alt="{ALT_THUMB}"></a></li>
        <!-- END: thumbs -->
    </ul>
    <p class="nav"><a href="#" onclick="$.galleria.prev(); return false;">&laquo; previous</a> | <a href="#" onclick="$.galleria.next(); return false;">next &raquo;</a><br /><br /><a href="javascript:window.close();" class="popupLink">Close Window</a></p>
    </div>
</div>
</body>
</html>
<!-- END: prod_images -->