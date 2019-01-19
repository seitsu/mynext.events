<?php
require_once 'config.php';
setLastModified('tpl/contact.tpl');

$meta_desc = 'Learn more about MyNext.Events';
$page_title = 'About MyNext.Events';

$array = array('meta_desc' => $meta_desc, 'meta_keywords' => $meta_keywords, 'page_title' => $page_title, 'content' => 'about', 'social_pic' => $social_pic);

$output = $twig->render('index.tpl', $array);

echo preg_replace('/\s+/', ' ', $output);