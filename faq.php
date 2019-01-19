<?php
require_once 'config.php';
setLastModified('tpl/contact.tpl');

$meta_desc = 'Simple answers to your most common questions';
$page_title = 'Frequent Questions | MyNext.Events';
$social_pic = 'faq.jpg';

$array = array('meta_desc' => $meta_desc, 'meta_keywords' => $meta_keywords, 'page_title' => $page_title, 'content' => 'faq', 'social_pic' => $social_pic);

$output = $twig->render('index.tpl', $array);

echo preg_replace('/\s+/', ' ', $output);