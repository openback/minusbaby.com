<?php

$path = ini_get('include_path');
if (substr($path, -1) != ':') {
	$path .= ':';
}

ini_set('include_path', $path.dirname(__FILE__).DS.'Gdata'.DS.'library');

App::import('Vendor', 'Zend/Gdata/library/Zend/Gdata');
