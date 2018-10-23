<?php

$path = str_replace('index.php', '', (string) $_SERVER['SCRIPT_FILENAME']);
$path = str_replace('kernel\system','',dirname(__FILE__));
$path = substr($path,0,-1);

define('DOMAIN', $_SERVER['SERVER_NAME'].str_replace('/index.php','',$_SERVER['SCRIPT_NAME']));
define('ROOT', $path);
define('VIEWS', ROOT.'/views');
define('TEMPLATE', ROOT.'/views/template');

require_once ROOT.'/kernel/other/autoload.php';
require_once ROOT.'/kernel/other/functions.php';

foreach (project\kernel\Config::getConfig() as $key => $item) {
    define($key, $item);
}

if (SESSION_ON) {
    session_start();
}
if (SHOW_ERRORS) {
    ini_set("display_errors",1);
    error_reporting(E_ALL);
}
require(ROOT.'/kernel/system/Router.php');
