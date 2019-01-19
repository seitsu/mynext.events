<?php
require_once 'config.php';
$cache_timeout = 3600;
if (empty($_GET['center']) || empty($_GET['markers']) || empty($_GET['uid']) || empty($_GET['ukey'])) {
    exit;
}

$params = array(
    'center' => $_GET['center'],
    'markers' => $_GET['markers'],
    'zoom' => !empty($_GET['zoom']) ? intval($_GET['zoom']) : 10
);

$salt = $_GET['uid'];
$ukey = sha1($site_key . $salt . implode(':', array_values($params)));
if ($ukey != $_GET['ukey']) {
    exit;
}

$output_file = sha1(implode(':', array_values($params))) . '-event.jpg';
if (file_exists('img/cache/' . $output_file) && filemtime('img/cache/' . $output_file) > time() - $cache_timeout) {
    header("Location: /img/cache/" . $output_file);
    exit;
}

$google = 'https://maps.googleapis.com/maps/api/staticmap?key=' . $key . '&scale=2&language=en&format=jpg&center=' . urlencode($params['center']) . '&size=900x150&markers=' . urlencode($params['markers']) . '&zoom=' . $params['zoom'];
$curl = curl_init();
curl_setopt($curl, CURLOPT_URL, $google);
curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($curl, CURLOPT_CONNECTTIMEOUT, 15);
$img = curl_exec($curl);
curl_close($curl);
$f = fopen('img/cache/' . $output_file, 'w');
fwrite($f, $img);
fclose($f);
header("Location: /img/cache/" . $output_file);
