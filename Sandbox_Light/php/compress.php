<?php
/*
##########################################################################################################################
	STYLESHEET AND JAVASCRIPT COMPRESSION SCRIPT
##########################################################################################################################

	This file MUST be uploaded for the skin to work.  This file should reside within the "styleSheets" directory.

	V1.1 - Added support for JavaScript.  Added support for merging files (reducing HTTP requests).
	V1.2 - Edited to include new licensing script.
	V1.3 - Added JSMIN and caching
	V1.4 - Removed license verification.

##########################################################################################################################
*/

function set_gzip_header()
{
	if(strpos(" ".$_SERVER["HTTP_ACCEPT_ENCODING"], "x-gzip")) {
		$encoding = "x-gzip";
	}
	if(strpos(" ".$_SERVER["HTTP_ACCEPT_ENCODING"], "gzip")) {
		$encoding = "gzip";
	}

	if(!empty($encoding)) {
		header("Content-Encoding: ".$encoding);
	}
}

$files = strip_tags($_GET["get"]);

if (strpos($files, ".js")) {
	$ext = ".js";
} elseif (strpos($files, ".css")) {
	$ext = ".css";
} else {
	die("ERROR: Unknown file type");
}

$files = explode ("||", $files);

foreach ($files as $file) {
	## Last time the file was edited
	$fileEdit[] = filemtime($file);
}

## The time at which the most recent edit occured
$lastEdit = max($fileEdit);

## Name of the cached file
$cacheFile = md5(implode("_", $files))."_".$lastEdit;

## Add extension
$cacheFile .= $ext;

## Check for cached file
if (file_exists("../../../cache/compression/$cacheFile")) {

	if ($ext == ".js") {
		header('Content-type: text/javascript');
	} elseif($ext == ".css") {
		header('Content-type: text/css');
	}

	header("Cache-Control: must-revalidate");
	$offset = 60 * 60 ;
	$ExpStr = "Expires: " .
	gmdate("D, d M Y H:i:s",
	time() + $offset) . " GMT";
	header($ExpStr);
	$lastModifiedString	= gmdate('D, d M Y H:i:s', $lastEdit) . ' GMT';
	$etag = md5($cacheFile);
	header("Last-Modified: $lastModifiedString");
	header("ETag: \"{$etag}\"");

	if (strstr($_SERVER['HTTP_ACCEPT_ENCODING'], 'gzip') && function_exists('gzcompress')) {
		if (strpos(" ".$_SERVER["HTTP_ACCEPT_ENCODING"], "x-gzip"))	{
			$encoding = "x-gzip";
		}
		if (strpos(" ".$_SERVER["HTTP_ACCEPT_ENCODING"], "gzip")) 	{
			$encoding = "gzip";
		}

		if (!empty($encoding)) {
			header("Content-Encoding: ".$encoding);
		}
		ob_start ("ob_gzhandler");
	}

	## Load cached file
	echo file_get_contents("../../../cache/compression/$cacheFile");
	die();
}

## No cached file exists, so we'll create one ##

## Merge all file's source code
foreach ($files as $file) {
	if ((strpos($file, ".js") || strpos($file, ".css")) && file_exists($file)) {
		$sourceCode .= file_get_contents($file);
	} else {
		if(strpos(dirname(__FILE__),"\\")){$slash="\\";}else{$slash="/";}
		die("ERROR: \"".dirname(__FILE__).$slash.$file."\" was not found");
	}
}

## Minify javascript source code
if ($ext == ".js") {
	require_once("jsmin.php");
	$minified = JSMin::minify($sourceCode);
} elseif($ext == ".css") {
	## Strip comments
	$minified = preg_replace('!/\*[^*]*\*+([^/][^*]*\*+)*/!', '', $sourceCode);
	## Strip tabs, spaces, newlines, etc.
	$minified = str_replace(array("\r\n", "\r", "\n", "\t", '  ', '    ', '    '), '', $minified);
}

## Write cache file
if ($minified) {
	if (!file_exists("../../../cache/compression/")) {
		## Try to create the directory
		mkdir ("../../../cache/compression/", 0777);
	}
	if ($fp = fopen("../../../cache/compression/".$cacheFile, 'wb')) {
		fwrite($fp, $minified);
		fclose($fp);
		## Set permissions as required by some hosts
		chmod("../../../cache/compression/".$cacheFile, octdec("0755"));
	}

	if ($ext == ".js") {
		header('Content-type: text/javascript');
	} elseif($ext == ".css") {
		header('Content-type: text/css');
	}

	header("Cache-Control: must-revalidate");
	$offset = 60 * 60 ;
	$ExpStr = "Expires: " .
	gmdate("D, d M Y H:i:s",
	time() + $offset) . " GMT";
	header($ExpStr);
	$lastModifiedString	= gmdate('D, d M Y H:i:s', $lastEdit) . ' GMT';
	$etag = md5($cacheFile);
	header("Last-Modified: $lastModifiedString");
	header("ETag: \"{$etag}\"");

	## Output minified code
	if(strstr($_SERVER['HTTP_ACCEPT_ENCODING'], 'gzip') && function_exists('gzcompress')) {
		if(strpos(" ".$_SERVER["HTTP_ACCEPT_ENCODING"], "x-gzip"))	{
			$encoding = "x-gzip";
		}
		if(strpos(" ".$_SERVER["HTTP_ACCEPT_ENCODING"], "gzip")) 	{
			$encoding = "gzip";
		}

		if(!empty($encoding)) {
			header("Content-Encoding: ".$encoding);
		}
		ob_start ("ob_gzhandler");
	}

	echo $minified;
}
?>
