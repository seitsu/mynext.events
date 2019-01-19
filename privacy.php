<?php
require_once 'config.php';
setLastModified('tpl/contact.tpl');

$meta_desc =  'Please read the privacy policy carefully.';
$meta_keywords = 'privacy, policy, google, maps, analytics, disable, enable, cloudflare';
$page_title = 'Privacy Policy | MyNext.Events';
$social_pic = 'privacy.jpg';

$output = $twig->render('index.tpl', array('meta_desc' => $meta_desc, 'meta_keywords' => $meta_keywords, 'page_title' => $page_title, 'content' => 'privacy', 'social_pic' => $social_pic));

echo preg_replace('/\s+/', ' ', $output);