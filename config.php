<?php
define('PATH', __DIR__);
require_once PATH . '/lib/Twig/Autoloader.php';
Twig_Autoloader::register();
$loader = new Twig_Loader_Filesystem(PATH . '/tpl');
$twig = new Twig_Environment($loader, array('cache' => false, 'debug' => true));

$meta_desc = 'List of Upcoming Upcoming Internet, Domain, Hosting, Startup and Tech Industry Events and Conferneces. Check out where you could go next on MyNext.Events.';
$meta_keywords = 'internet, web, domain, hosting, industry, startup, tech, event, meeting, conference, meetup, summit, trade fair, exhibition, trade show, show, future, upcoming, forthcoming, approaching';
$social_pic = 'cal.png';

// add a unique site key. will be used to validate image cache
$site_key = '';

// add your google maps api key here
$key = '';

header('Content-language: en');
header('Content-Type: text/html; charset=utf-8');
header('X-XSS-Protection: 1; mode=block');
header('X-Content-Type-Options: nosniff');
header('X-Frame-Options: SAMEORIGIN');
header('Access-Control-Allow-Origin: origin');
header("Content-Security-Policy: default-src 'self' 'unsafe-inline' 'unsafe-eval' data: maxcdn.bootstrapcdn.com code.jquery.com *.fontawesome.com *.cloudflare.com *.googleapis.com *.google-analytics.com *.gstatic.com; form-action 'self'; block-all-mixed-content; object-src 'none'; frame-ancestors 'self'; base-uri 'self';");
header('Referrer-Policy: no-referrer, strict-origin-when-cross-origin');

function setLastModified($file) {
	header('Last-Modified: '.gmdate('D, d M Y H:i:s', filemtime($file)).' GMT');
}