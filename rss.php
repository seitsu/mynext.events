<?php
if(preg_match('/Chrome/i', $_SERVER['HTTP_USER_AGENT'])) {
	header("Content-type: application/xml; charset=utf-8");
} else {
	header("Content-type: application/rss+xml; charset=utf-8");
}

echo '<?xml version="1.0" ?>'."\n";
date_default_timezone_set('UTC');
?>
<rss version="2.0">
<channel>
<title>Upcoming Internet and Domain Name Industry Events</title>
<link>https://mynext.events</link>
<description>List of Upcoming Internet and Domain Name Industry Events. https://mynext.events</description>
<lastBuildDate><?php echo date('r'); ?></lastBuildDate>
<language>en-us</language>
<copyright>Tobias Sattler</copyright>
<?php
// add your google maps api key here
$key = '';
$min = date('Y-m-d\T00:00:00\Z');

$google = 'https://www.googleapis.com/calendar/v3/calendars/b4sb2s2bnfpr139hct9ggk7q8s%40group.calendar.google.com/events?key='.$key.'&orderBy=startTime&singleEvents=true&timeMin='.$min;
$curl = curl_init();
curl_setopt($curl, CURLOPT_URL, $google);
curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($curl, CURLOPT_CONNECTTIMEOUT, 15);
$events = curl_exec($curl);
curl_close($curl);

$events = json_decode($events);

foreach ($events->items as $i => $event) {
echo '<item>' . "\n";
echo '<title>'.htmlspecialchars($event->summary).'</title>'."\n";
echo '<link>'.$event->description.'</link>'."\n";
echo '<guid>'.$event->description.'#'.$i.'</guid>'."\n";
echo '<pubDate>'.date('r', strtotime($event->updated)).'</pubDate>'."\n";
echo '<category>Internet and Domain Industry Event</category>'."\n";

$start=date('d.m.Y', strtotime($event->start->date));
$end = date('d.m.Y', strtotime($event->end->date . "-1 days"));

if($start != $end) {
$time = $start . ' - ' . $end;
} else {
$time = $start;
}

echo '<description>&lt;b&gt;Time:&lt;/b&gt; '.$time.'&lt;br/&gt;&lt;b&gt;Location:&lt;/b&gt; '.htmlspecialchars($event->location).'</description>'."\n";
echo '</item>';
echo "\n";
}
?>
</channel>
</rss>