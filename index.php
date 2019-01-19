<?php
require_once 'config.php' ;
date_default_timezone_set('UTC');

$page_title = 'Upcoming Internet, Domain, Hosting, Startup and Tech Events';

$min = date('Y-m-d\T00:00:00\Z');
$cache_timeout = 300;
$img_cache_timeout = 3600;

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

$uq = uniqid();
$events = json_decode($events);

header('Last-Modified: '.gmdate('D, d M Y H:i:s', strtotime($events->updated)).' GMT');

foreach ($events->items as $i => $event) {
    $event->location_img = '';
    $params = array(
        'center' => $event->location,
        'markers' => $event->location,
        'zoom' => 10
    );
    $output_file = sha1(implode(':', array_values($params))) . '-event.jpg';
    if (file_exists('img/cache/' . $output_file) && filemtime('img/cache/' . $output_file) > time() - $img_cache_timeout) {
        $event->location_img = '/img/cache/' . $output_file;
    } else {
        $ukey = sha1($site_key . $uq . implode(':', array_values($params)));
        $event->location_img = '/gcache.php?center=' . urlencode($params['center']) . '&markers=' . urlencode($params['center']) . '&ukey=' . $ukey . '&uid=' . $uq;
    }
}

$output = $twig->render('index.tpl', array(
    'meta_desc' => $meta_desc, 
    'meta_keywords' => $meta_keywords, 
    'social_pic' => $social_pic,
    'page_title' => $page_title, 
    'content' => 'home', 
    'events' => $events
));

echo preg_replace('/\s+/', ' ', $output);