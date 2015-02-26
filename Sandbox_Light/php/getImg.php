<?php
/**********************************************************************************
    
	DYNAMIC IMAGE SCALING SCRIPT - Copyright ShopDev
	------------------------------------------------
    
    Version: 0.2a
	
		-	Added support for area filling
	
	Version: 0.3a
	
		-	Changed paths for new location (inside php dir)
		
	Version: 0.4a
	
		-	Added JPEG quality setting
	
	Version: 0.5a
	
		-	Added image padding
		
	Version: 0.6a
	
		-	Misc bug fixes
		
	Version: 0.7a
	
		-	Fixed dimension filling bugs and issues where black areas of images 
			were filled with color.
		
***********************************************************************************/

########################
##  START: Functions  ##
########################

function getCurrentDirectory() {
   $path = dirname($_SERVER['PHP_SELF']);
   $position = strrpos($path,'/') + 1;
   return substr($path,$position);
} 

function html2rgb($color) {
    if ($color[0] == '#')
        $color = substr($color, 1);

    if (strlen($color) == 6)
        list($r, $g, $b) = array($color[0].$color[1],
                                 $color[2].$color[3],
                                 $color[4].$color[5]);
    elseif (strlen($color) == 3)
        list($r, $g, $b) = array($color[0].$color[0], $color[1].$color[1], $color[2].$color[2]);
    else
        return false;

    $r = hexdec($r); $g = hexdec($g); $b = hexdec($b);
	
	$out = $r." ".$g." ".$b;

    return $out;
}

function new_thumb_name($filename) {
	$string = trim($filename);
	$string = strtolower($string);
	$string = trim(preg_replace("/[^ A-Za-z0-9_]/", " ", $string));
	$string = preg_replace("/[ \t\n\r]+/", "_", $string);
	$string = str_replace(" ", '_', $string);
	$string = preg_replace("/[ _]+/", "_", $string);
	return $string;
}

function doConditionalGet($etag, $lastModified) {
	header("Last-Modified: $lastModified");
	header("ETag: \"{$etag}\"");
		
	$if_none_match = isset($_SERVER['HTTP_IF_NONE_MATCH']) ?
		stripslashes($_SERVER['HTTP_IF_NONE_MATCH']) : 
		false;
	
	$if_modified_since = isset($_SERVER['HTTP_IF_MODIFIED_SINCE']) ?
		stripslashes($_SERVER['HTTP_IF_MODIFIED_SINCE']) :
		false;
	
	if (!$if_modified_since && !$if_none_match) {
		return;
	}
	
	if ($if_none_match && $if_none_match != $etag && $if_none_match != '"' . $etag . '"') {
		return;
	}
	
	if ($if_modified_since && $if_modified_since != $lastModified) {
		return;
	}
	
	header('HTTP/1.1 304 Not Modified');
	
	exit();
}

// Function written by Ryan Rud (http://www.adryrun.com)
function findSharp($orig, $final) {
	$final	= $final * (750.0 / $orig);
	$a		= 52;
	$b		= -0.27810650887573124;
	$c		= .00047337278106508946;
	$result = $a + $b * $final + $c * $final * $final;
	return max(round($result), 0);
}

function addColor($image, $color) {
	## Set default background color to white
	if ((strlen($color) != 6) && (strlen($color) != 3)) {
		$color = "FFF";
	}
	## 3 or 6 character HEX?
	if (strlen($color) == 6) {
		$bg	= imagecolorallocate($image, hexdec($color[0].$color[1]), hexdec($color[2].$color[3]), hexdec($color[4].$color[5]));
	} else if (strlen($color) == 3) {
		$bg	= imagecolorallocate($image, hexdec($color[0].$color[0]), hexdec($color[1].$color[1]), hexdec($color[2].$color[2]));
	}
	## Add the color
	imagefill($image, 0, 0, $bg);
	## Return the imae
	return $image;
}

function resize($cc_root,$image_to_resize,$new_width="",$new_height="",$ratio="",$save_folder="",$sharpen="",$quality=80,$noCache="",$color="",$reflect="",$reflectHeight="", $method="", $fill=false, $padding=0) {

	$crop_width = $new_width;
	$crop_height = $new_height;

	require_once ("../../../ini.inc.php");
	require_once '../../../includes'.CC_DS.'global.inc.php';
	
	if ($sharpen != NULL) {
		$sharpen = 'sharp';
	}
	
	if ($reflect != NULL) {
		$reflect = 'reflect';
	}
	
	## Full image path
	if ($method == 'src') {
		if ((strpos($cc_root, '\\')) && ($glob['rootRel'] != '\\')) {
			$globRootRel = str_replace('/','\\',$glob['rootRel']);
			$image_to_resize = str_replace('/','\\',$image_to_resize);
			$imagePath = $cc_root.str_replace($globRootRel,'',$image_to_resize);
		} elseif ($glob['rootRel'] != '/') {
			$imagePath = $cc_root.str_replace($glob['rootRel'],'',$image_to_resize);
		} elseif ($glob['rootRel'] == '/') {
			$imagePath = $cc_root.$image_to_resize;
		} elseif ($glob['rootRel'] == '\\') {
			$imagePath = $cc_root.$image_to_resize;
		}
		
	} else {
		$imagePath = $image_to_resize;
	}
	

	if(!file_exists($imagePath)) {
	  exit("File ".$imagePath." does not exist.");
	}
	
	$info = GetImageSize($imagePath);
	
	if(empty($info)) {
	  exit("The file ".$imagePath." doesn't seem to be an image.");
	}
	
	## Width & Height of the image
	$width = $info[0];
	$height = $info[1];
	
	
	
	## File Type
	$mime = $info['mime'];
	
	## Keep aspect ratio?	
	if($ratio) {
		
		## Thumbnail?
		if (($new_width < $width) || ($new_height < $height)) {
			$thumb = true;
		}
		
		## Larger than (or equal to) original image size?
		if (($new_width >= $width) && ($new_height >= $height)) {
			$bigger_image = true;
		}
		
		if ($reflect) {
			if ($reflectHeight) {
				$preRefH = $new_height;
				$new_height = $new_height - $reflectHeight;
			} else {
				$preRefH = $new_height;
				$new_height = $new_height - ceil($new_height * 0.3);
			}
		}
		
		## Scale the image down to create the thumbnail
		if ($thumb) {
			
			## Dimension ratios
			if ($fill) {
				if($new_height > $height) {
					$new_height = $height;
				}
				if ($new_width > $width) {
					$new_width = $width;
				}
			}
			
			$xFraction = $new_width / $width;
			$yFraction = $new_height / $height;
			
			
			## Determine max dimensions subject to width and height constraints
			## Dont' cha love math!
			
			if ($fill) {
				## If we want the resulting image to fill the dimensions given
				if (($xFraction * $height) < $new_height) {
					$crop_height = $new_height;	
					$new_height = ceil($yFraction * $height);
					$new_width = ceil($yFraction * $width);			
				} else {
					$crop_width = $new_width;	
					$new_width = ceil($xFraction * $width);
					$new_height = ceil($xFraction * $height);
				}				
			} else {
				if (($xFraction * $height) < $new_height) {
					$new_height = ceil($xFraction * $height);
					$new_width = ceil($xFraction * $width);
				} else {
					$new_width = ceil($yFraction * $width);
					$new_height = ceil($yFraction * $height);
				}
			}
			
			
		}
		
		## Display the original image (don't do any scaling)
		elseif ($bigger_image) {
			$new_height = $height;
			$new_width = $width;
		}
	}
	
	## Image type?
	$type = substr(strrchr($mime, '/'), 1);
	
	switch ($type) {
		case 'jpeg':
			$image_create_func = 'ImageCreateFromJPEG';
			$image_save_func = 'ImageJPEG';
			$new_image_ext = 'jpg';
			$new_image_quality = $quality;
			break;
		
		case 'png':
			$image_create_func = 'ImageCreateFromPNG';
			$image_save_func = 'ImagePNG';
			$new_image_ext = 'png';
			break;
		
		case 'bmp':
			$image_create_func = 'ImageCreateFromBMP';
			$image_save_func = 'ImageBMP';
			$new_image_ext = 'bmp';
			break;
		
		case 'gif':
			$image_create_func = 'ImageCreateFromGIF';
			$image_save_func = 'ImagePNG';
			$new_image_ext = 'png';
			break;
		
		case 'vnd.wap.wbmp':
			$image_create_func = 'ImageCreateFromWBMP';
			$image_save_func = 'ImageWBMP';
			$new_image_ext = 'bmp';
			break;
		
		case 'xbm':
			$image_create_func = 'ImageCreateFromXBM';
			$image_save_func = 'ImageXBM';
			$new_image_ext = 'xbm';
			break;
		
		default:
			$image_create_func = 'ImageCreateFromJPEG';
			$image_save_func = 'ImageJPEG';
			$new_image_ext = 'jpg';
			$new_image_quality = $quality;
	}
	
	
	$fileName = new_thumb_name(basename($image_to_resize))."_".ceil($new_width)."_".ceil($new_height)."_".$color."_".$sharpen."_".$quality."_".$padding."_".$reflect."_".$reflectHeight."_".ceil($crop_width)."_".ceil($crop_height).".".$new_image_ext;
	
	## Check for a cached image
	if ((file_exists($save_folder.$fileName)) && ($noCache != true)) {
		$cachedFile = $save_folder.$fileName;
		## Last Modified
		$lastModified = filemtime($cachedFile);
		$lastModifiedString	= gmdate('D, d M Y H:i:s', $lastModified) . ' GMT';
		## File data
		$data = file_get_contents($cachedFile);
		## MD5 Hash of file data
		$etag = md5($data);
		## Headers for browser cache
		doConditionalGet($etag, $lastModifiedString);
		## Return the function to display the cached image
		return array('result' => 1, 'new_file_path' => $cachedFile, 'mime' => $mime, 'image_save_func' => $image_save_func);
	}
	
	#########################################################
	##  There's no cached file, so we'll create one below  ##
	#########################################################
	
	## Create a new image
	$image_c = imagecreatetruecolor($new_width+($padding*2), $new_height+($padding*2));
	## Transparency for GIFs and PNGs
	if ((($new_image_ext == 'gif') || ($new_image_ext == 'png')) && (!$color) && (!reflect)) {
		imagealphablending($image_c, false);
		imagesavealpha($image_c, true);
	} else {
		## Add color to all other image types (or if color is specified for PNGs & GIFs)
		addColor($image_c, $color);
	}
	
	$new_image = $image_create_func($imagePath);
	ImageCopyResampled($image_c, $new_image, $padding, $padding, 0, 0, $new_width, $new_height, $width, $height);
	
	## Do we want to fill the dimensions
	if ($fill) {
		if($crop_height > $new_height) {
			$crop_top = abs($new_height - $crop_height)/2;
		} else {
			$hShift = abs($new_height - $crop_height)/2;
		}
		if ($crop_width > $new_width) {
			$crop_left = abs($new_width - $crop_width)/2;
		} else {
			$wShift = abs($new_width - $crop_width)/2;
		}
		
		## Create a canvas with the fill dimensions
		$cropImg = imagecreatetruecolor($crop_width, $crop_height);
		addColor($cropImg, $color);
		## Copy the image to the center of the blank canvas
		imagecopy($cropImg, $image_c, $crop_left, $crop_top, $wShift, $hShift, $crop_width-(2*$crop_left), $crop_height-(2*$crop_top));
		## Set the image variable to the merged image
		$image_c = $cropImg;
	}
	
	## If requested, sharpen the JPG
	if (($sharpen) && ($new_image_ext == 'jpg')) {
		$computeSharpness = findSharp($width, $new_width);
		$sharpenArray = array(
			array(-1, -2, -1),
			array(-2, $computeSharpness + 12, -2),
			array(-1, -2, -1)
		);
		$divisor = $computeSharpness;
		$offset = 0;
		imageconvolution($image_c, $sharpenArray, $divisor, $offset);
	}
	
	if ($reflect == true) {
		
		if (!$reflectHeight) {
			$preRefH = 1.3 * $new_height;
			$reflectHeight = ceil($preRefH * 0.3);
		}
		
		$new_width = $new_width + ($padding*2);
		
		$gradientHeight = $reflectHeight;
		
		if (!$color) {
			$color = "FFF";
		}
		
		$gradientColor = html2rgb($color);
		$gradparts = explode(" ",$gradientColor); ## get the components of the colour (R,G,B)
		$dividerHeight = 1;
		$gradient_y_startpoint = 1;
		$refBG = imagecreatetruecolor($new_width, $gradientHeight);
		$gdGradientColor = ImageColorAllocate($refBG, $gradparts[0], $gradparts[1], $gradparts[2]);  
		$mergeHeight = $new_height + $gradientHeight;
		
		$canvas = imagecreatetruecolor($new_width, $new_height);
		
		for ($x = 0; $x < $new_width; $x++) {
			for ($y = 0; $y < $new_height; $y++) {
				imagecopy($canvas, $image_c, $x, $new_height - $y - 1, $x, $y+$padding, 1, 1);
			}
		}
		
		## Add it to the blank background image
		imagecopymerge ($refBG, $canvas, 0, 0, 0, 0, $new_width, $new_height, 100);
		
		## create from a the image so we can use fade out
		$gradient_line = imagecreatetruecolor($new_width, 1);
		
		## draw a GD line into our gradient_line
		imageline ($gradient_line, 0, 0, $new_width, 0, $gdGradientColor);
		
		
		$i = 0;
		$transparency = 30; ## from 0 - 100
		
			while ($i < $gradientHeight) //create line by line changing as we go
			{
				imagecopymerge ($refBG, $gradient_line, 0,$gradient_y_startpoint, 0, 0, $new_width, 1, $transparency);
				
				++$i;
				++$gradient_y_startpoint;
				
				if ($transparency == 100) {
					$transparency = 100;
				} else  {
					## this will determing the height of the
					## reflection. The higher the number, the smaller the reflection. 
					## 1 being the lowest(highest reflection)
					if ($transparency <= 100) {
						$transparency = 50 + ((50 / $gradientHeight) * $i*1.5); 
					} else {
						$transparency = 100;
					}
				}
			}  
		
		## Set the thickness of the line we're about to draw
		imagesetthickness ($refBG, $dividerHeight);
		
		## Draw the line
		imageline ($refBG, 0, 0, $new_width, 0, $gdGradientColor);
		
		$totImg = imagecreatetruecolor($new_width, $mergeHeight+($padding*2));
		addColor($totImg, $color);
		
		## Merge the reflection with the image
		imagecopymerge ($totImg, $image_c, 0, 0, 0, 0, $new_width, $new_height+$padding, 100);
		imagecopymerge ($totImg, $refBG, 0, $new_height+$padding, 0, 0, $new_width, $gradientHeight, 100);
		
		$image_c = $totImg;
		//addColor($image_c, $color); ## removed: caused black images to be filled
		
		## Clear memory
		ImageDestroy($refBG);
		ImageDestroy($canvas);
	}
	
	if ($save_folder) {
		## Save path
		$save_path = $save_folder.$fileName;
		## Create the cahce directory if it doesn't exist
		if (!file_exists($save_folder)) {
			mkdir($save_folder, 0755);
		}		
	} else {
		## Show the image without saving it to a folder
		header("Content-Type: ".$mime);
		if ($new_image_quality) {
			$image_save_func($image_c, NULL, $new_image_quality);
		} else {
			$image_save_func($image_c);
		}
		$save_path = '';
	}
	
	## If image is a JPEG, we want to set the quality
	if ($new_image_quality) {
		$process = $image_save_func($image_c, $save_path, $new_image_quality);
	} else {
		$process = $image_save_func($image_c, $save_path);
	}
	
	## Clean up the memory
	ImageDestroy($image_c);
	ImageDestroy($new_image);
	
	## Check for a cached image now
	if (file_exists($save_folder.$fileName)) {
		$cachedFile = $save_folder.$fileName;
		## Last Modified
		$lastModified = filemtime($cachedFile);
		$lastModifiedString	= gmdate('D, d M Y H:i:s', $lastModified) . ' GMT';
		## File data
		$data = file_get_contents($cachedFile);
		## MD5 Hash of file data
		$etag = md5($data);
		## Headers for browser cache
		doConditionalGet($etag, $lastModifiedString);
		## Return the function to display the cached image
		return array('result' => 1, 'new_file_path' => $cachedFile, 'mime' => $mime, 'image_save_func' => $image_save_func);
	} else {
		exit("Error: There was a problem writing the image to the cache directory");
	}
}

######################
##  END: Functions  ##
######################

## Report simple running errors
error_reporting(E_ERROR | E_WARNING | E_PARSE);

if ((!$_REQUEST['src']) && (!$_REQUEST['id'])) {
	exit('Error: You must specify either 
	<ul>
	<li>A product ID</li>
	<li>An image path</li>
	</ul>
	Example 1: getImg.php?id=1<br />
	Example 2: getImg.php?src=/store/images/uploads/file.jpg<br />
	<br />
	<br />
	Optional attributes are:
	<ul>
		<li>width (integer)</li>
		<li>height (integer)</li>
		<li>sharpen (boolean) - for JPEGs only!</li>
		<li>color (HEX) - for transparent GIFs/PNGs (also used for rendering reflections and padding)!</li>
		<li>reflect (boolean)</li>
		<li>nocache (boolean)</li>
		<li>fill (boolean)</li>
		<li>padding (integer)</li>
	</ul>
	Example 3: getImg.php?id=1&amp;width=100&amp;height=150&amp;color=FFFFFF&amp;reflect=1&amp;nocache=1');
}

## CubeCart root directory path (should end with a trailing slash)
$cc_root = "../../../";

if ($_REQUEST['id']) {

	## include required files
	require_once ("../../../ini.inc.php");
	require_once '../../../includes'.CC_DS.'global.inc.php';
	require_once ("../../../classes" . CC_DS . "db" . CC_DS . "db.php");
	require_once '../../../includes'.CC_DS.'functions.inc.php';
	$db = new db();
	
	## make parameter safe
	$productId = mysql_real_escape_string(strip_tags($_REQUEST['id']));
	
	## build the query
	$query = "SELECT * FROM ".$glob['dbprefix']."CubeCart_inventory WHERE productId = '$productId'";
	
	## execute query
	$getImg = $db->select($query);
	$getImg = $getImg[0];
	$getImg = $getImg['image'];
	
	## Image Paths
	$thumbRootPath = imgPath($getImg,$thumb=0,$path="root");
	$thumbRelPath = imgPath($getImg,$thumb=0,$path="rel");
	
	
	if (file_exists($thumbRootPath) && !is_dir($thumbRootPath) ) {
		$image_to_resize = $thumbRootPath;
	} else {
		$image_to_resize = "../styleImages/thumb_nophoto.gif";
	}
	
	$method = 'id';

} elseif ($_REQUEST['src']) {
	$image_to_resize = strip_tags($_REQUEST['src']);
	$method = 'src';
}


## Get the requested width and height parameters
if ($_REQUEST['width']) {
	$new_width = (int) strip_tags($_REQUEST['width']);
} else {
	## Width is not a limiting dimension
	$new_width = 9999999999;
}

if ($_REQUEST['height']) {
	$new_height = (int) strip_tags($_REQUEST['height']);
} else {
	## Height is not a limiting dimension
	$new_height = 9999999999;
}

if ($_REQUEST['sharpen']) {
	$sharpen = true;
}

if ($_REQUEST['nocache']) {
	$noCache = true;
}

if ($_REQUEST['color']) {
	$color = preg_replace('/[^0-9a-fA-F]/', '', (string) strip_tags($_REQUEST['color']));
} else {
	$color = false;
}

if ($_REQUEST['reflect']) {
	$reflect = true;
}

if ($_REQUEST['reflectHeight']) {
	$reflectHeight = strip_tags($_REQUEST['reflectHeight']);
}

if ($_REQUEST['fill']) {
	$fill = true;
}

if($_REQUEST["quality"]){
	if (($_REQUEST["quality"] <= 100) && ($_REQUEST["quality"] > 0)) {
		$quality = strip_tags($_REQUEST["quality"]);
	}
}

if($_REQUEST["padding"]){
	if (is_int((int)$_REQUEST["padding"])) {
		$padding = (int) strip_tags($_REQUEST["padding"]);
	}
}

$ratio = true; ## Don't change this!

## Cache directory path from CubeCart root (should end with a trailing slash)
$save_folder = '../../../cache/images/';

## Do everything required :)
$process = resize($cc_root, $image_to_resize, $new_width, $new_height, $ratio, $save_folder, $sharpen, $quality, $noCache, $color, $reflect, $reflectHeight, $method, $fill, $padding);

## Display the saved image
if($process['result'] && $save_folder) {
	header("Content-Type: ".$process['mime']);
	$data = file_get_contents($process['new_file_path']);
	header('Content-Length: ' . strlen($data));
	echo $data;
}
?>
