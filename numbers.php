<?php
require_once 'config.php';
require_once 'continents.php';

$meta_desc = 'Numbers &amp; Statistics about Domain, Hosting and Internet Industry Events and Conferences';
$page_title = 'Numbers & Statistics | MyNext.Events';
$social_pic = 'numbers.jpg';

$min = date('Y-m-d\T00:00:00\Z');
$cache_timeout = 300;
$google = 'https://www.googleapis.com/calendar/v3/calendars/b4sb2s2bnfpr139hct9ggk7q8s%40group.calendar.google.com/events?key='.$key.'&orderBy=startTime&singleEvents=true&timeMin='.$min;

$fStats = @filemtime('event_cache.txt');
if (empty($fStats) || $fStats < time()-$cache_timeout) {
    $curl = curl_init();
    curl_setopt($curl, CURLOPT_URL, $google);
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($curl, CURLOPT_CONNECTTIMEOUT, 15);
    $events = curl_exec($curl);
    curl_close($curl);
    $f = fopen('event_cache.txt', 'w');
    fwrite($f, $events);
    fclose($f);
} else {
    $events = file_get_contents('event_cache.txt');
}

$events = json_decode($events);
header('Last-Modified: '.gmdate('D, d M Y H:i:s', strtotime($events->updated)).' GMT');

$numbers_by_year = array();
$numbers_by_months = array();
$numbers_by_country = array();
$numbers_by_continent = array();
$numbers_by_continent_long = array();
$numbers_by_duration = array();
$current_year = 0;
$current_months = 0;

foreach ($events->items as $i => $event) {
	if($current_year != date('Y', strtotime($event->start->date))) {
		$current_year = date('Y', strtotime($event->start->date));
		$numbers_by_year[$current_year] = 0;
	}
	$numbers_by_year[$current_year] = $numbers_by_year[$current_year] + 1;
	
	if(date('Y', strtotime($event->start->date)) == date('Y')) {
		if($current_months != date('m', strtotime($event->start->date))) {
			$current_months = date('m', strtotime($event->start->date));
		
			if(!isset($numbers_by_months[$current_months])) {
				$numbers_by_months[$current_months] = 0;
			}
		}
		$numbers_by_months[$current_months] = $numbers_by_months[$current_months] + 1;
	}
	
	$location = trim(substr($event->location, strrpos($event->location, ',')+1));
	
	if(!isset($numbers_by_country[$location])) {
		$numbers_by_country[$location] = 0;
	}
	$numbers_by_country[$location] = $numbers_by_country[$location] + 1;
	
	if(isset($continents[$location])) {
		$continent = $continents[$location];

		if(!isset($numbers_by_continent[$continent])) {
			$numbers_by_continent[$continent] = 0;
		}
	
		$numbers_by_continent[$continent] = $numbers_by_continent[$continent] + 1;
	}
	
	$datediff = date_diff(date_create($event->end->date), date_create($event->start->date));
	
	if(!isset($numbers_by_duration[$datediff->days])) {
		$numbers_by_duration[$datediff->days] = 0;
	}
	$numbers_by_duration[$datediff->days] = $numbers_by_duration[$datediff->days] + 1;
}

asort($numbers_by_duration);
$numbers_by_duration = array_reverse($numbers_by_duration, true);
$numbers_by_duration = array_slice($numbers_by_duration, 0, 5, true);

array_multisort($numbers_by_country, SORT_DESC);
$numbers_by_country = array_slice($numbers_by_country, 0, 5);

array_multisort($numbers_by_continent, SORT_DESC);

foreach($numbers_by_continent as $key => $value) {
	switch($key) {
		case 'NA':
			$numbers_by_continent_long[$key] = 'North America';
			break;
		case 'SA':
			$numbers_by_continent_long[$key] = 'South America';
			break;
		case 'EU':
			$numbers_by_continent_long[$key] = 'Europe';
			break;
		case 'AS':
			$numbers_by_continent_long[$key] = 'Asia';
			break;
		case 'AF':
			$numbers_by_continent_long[$key] = 'Africa';
			break;
		default:
			$numbers_by_continent_long[$key] = 'Others';
			break;
	}
}

$array = array('meta_desc' => $meta_desc, 'meta_keywords' => $meta_keywords, 'page_title' => $page_title, 'content' => 'numbers', 'numbers_by_year' => $numbers_by_year, 'numbers_by_country' => $numbers_by_country, 'numbers_by_continent' => $numbers_by_continent, 'numbers_by_continent_long' => $numbers_by_continent_long, 'numbers_by_duration' => $numbers_by_duration, 'numbers_by_months' => $numbers_by_months, 'social_pic' => $social_pic);

$output = $twig->render('index.tpl', $array);

echo preg_replace('/\s+/', ' ', $output);