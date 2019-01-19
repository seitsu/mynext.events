<section id="events">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h1>Upcoming Internet, Domain, Hosting, Startup and Tech Industry Events</h1>
				<p class="text-center">This event calendar lists upcoming <strong>Internet, Domain, Hosting, Startup and Tech Conferences</strong>.<br>What will be your next event?</p>
				<p class="text-center">It is a private, free and open project. You may subscribe this calendar with <a href="webcal://calendar.google.com/calendar/ical/b4sb2s2bnfpr139hct9ggk7q8s@group.calendar.google.com/public/basic.ics" target="_blank" rel="noopener" title="Subscribe Upcoming Internet and Domain Industry Events with iCal"><i aria-hidden="true" class="far fa-calendar"></i>iCal</a>, <a href="//mynext.events/events.rss" target="_blank" rel="noopener" title="RSS Feed of Upcoming Internet and Domain Name Industry Events"><i aria-hidden="true" class="fa fa-rss"></i>RSS</a> and <a href="//calendar.google.com/calendar/render?cid=https://calendar.google.com/calendar/ical/b4sb2s2bnfpr139hct9ggk7q8s@group.calendar.google.com/public/basic.ics" target="_blank" rel="noopener" title="Add Upcoming Internet and Domain Industry Events to your Google Calendar"><i aria-hidden="true" class="fab fa-google"></i>Google Calendar</a>. If you want to add your meetup, event or conference to this calendar, please do not hesitate and <a href="/#contact">drop a note</a>.</p>
			</div>
		</div>
		<div class="row">
			<nav class="col-lg-2 col-md-2 col-xs-2 bs-docs-sidebar">
				<div class="fixed">
					<ul class="nav nav-stacked fixed affix-top" id="sidebar" data-spy="affix">
						<li>Jump to events in</li>
						{% set checkyear = '' %}
						{% for event in events.items %}
						{% set year = event.start.date|date("Y") %}
						{% if checkyear != year %}
						<li><a href="#events_{{year}}">{{year}}</a></li>
						{% set checkyear = year %}
						{% endif %}
						{% endfor %}
						<li>Follow us</li>
						<li><a href="//twitter.com/mynextevents" target="_blank" title="Follow MyNext.Events on Twitter" rel="nofollow noopener"><i aria-hidden="true" class="fab fa-twitter"></i></a></li>
					</ul>
				</div>
			</nav>
			<div class="col-lg-10 col-md-10 col-xs-12">
				{% set checkyear = '' %}
				{% for event in events.items %}
				{% set year = event.start.date|date("Y") %}
				{% if checkyear != year %}
				<h2 id="events_{{year}}" class="event_year"><a href="#top">Events in {{year}}</a></h2>
				{% set checkyear = year %}
				{% endif %}
				<div class="event" id="{{event.etag|replace({'\"': ''})|lower}}">
					<a target="_blank" href="//maps.google.de/maps?hl=en&amp;f=d&amp;iwstate1=dir:to&amp;daddr={{event.location|url_encode}}" rel="nofollow noopener" title="Find route to {{event.summary}}"><img src="//mynext.events/img/1.png" data-original="{{event.location_img}}" class="mapimage lazy" alt="Event location of {{event.summary}}" title="Google Maps event location of {{event.summary}}"><noscript><img src="{{event.location_img}}" alt="Event location of {{event.summary}}" title="Google Maps event location of {{event.summary}}" class="mapimage"></noscript></a>
					<span class="event">
					<a target="_blank" href="{{event.description}}" title="Find more details about {{event.summary}}" rel="nofollow noopener">{{event.summary}}</a>
					{% if event.created|date("Y-m-d") >= 'now'|date_modify("-7 day")|date("Y-m-d") %}
					&nbsp;<span class="label label-success">new</span>
					{% elseif event.updated|date("Y-m-d") >= 'now'|date_modify("-7 day")|date("Y-m-d") %}
					&nbsp;<span class="label label-info">updated</span>
					{% elseif event.start.date("Y-m-d") <= 'now'|date("Y-m-d") and event.end.date("Y-m-d") >= 'now'|date("Y-m-d")%}
					&nbsp;<span class="label label-warning">ongoing</span>
					{% endif %}
					</span>
					<p class="event_date">{{event.start.date|date("M")}}<br>{{event.start.date|date("d")}}</p>
					<p class="event">
						{% if event.start.date|date("d.m.Y") == event.end.date|date_modify("-1 day")|date("d.m.Y") %}
							<i aria-hidden="true" class="far fa-calendar"></i>{{event.start.date|date("d.m.Y")}}<br>
						{% else %}
							<i aria-hidden="true" class="far fa-calendar"></i>{{event.start.date|date("d.m.Y")}} - {{event.end.date|date_modify("-1 day")|date("d.m.Y")}}<br>
						{% endif %}
						<i aria-hidden="true" class="far fa-map"></i><a target="_blank" href="//maps.google.de/maps?hl=en&amp;f=d&amp;iwstate1=dir:to&amp;daddr={{event.location|url_encode}}" rel="nofollow noopener" title="Find {{event.summary}} on Google Maps">{{event.location}}</a><br>
						{% set twitterurl = event.summary ~ ' will take place ' ~ event.start.date|date('Y M, d') ~ ' ' ~ event.description ~ ' See more events on' %}
						<i aria-hidden="true" class="fab fa-twitter"></i><a href="//twitter.com/intent/tweet?text={{twitterurl|url_encode}}&url=https://mynext.events&via=mynextevents" target="_blank" title="Tweet about {{event.summary}}" class="button" rel="nofollow noopener">Share {{event.summary}} on Twitter</a>
					</p>
				</div>
				<script type="application/ld+json">
				{% set name = event.location|split(',') %}
				{"@context":"https://schema.org","@type":"BusinessEvent","name":"{{event.summary}}","startDate":"{{event.start.date}}","endDate":"{{event.end.date|date_modify("-1 day")|date("Y-m-d")}}","url":"{{event.description}}","description":"{{event.summary}} event / conference in {{event.location}}","location":{"@type":"Place","address":"{{event.location}}","name":"{{name.0}}"}}
				</script>
				{% endfor %}
			</div>
		</div>
	</div>
</section>
<script type="application/ld+json">{"@context":"https://schema.org","@type":"WebPage","name":"MyNext.Events","description":"{{meta_desc}}","url":"https://mynext.events","lastReviewed":"{{events.updated}}","keywords":"domain, hosting, internet, industry, event, conference, meeting, trade show, show","image":[{"@type":"ImageObject","contentUrl":"https://mynext.events/img/header.jpg","name":"MyNext.Events"}],"author":{"@type":"Person","givenName":"Tobias","familyName":"Sattler","name":"Tobias Sattler","image":"https://tobiassattler.com/tobias-sattler-sweater.jpg","url":"https://tobiassattler.com","sameAs":["https://twitter.com/tobiassattler","https://facebook.com/sattler","https://plus.google.com/117865868225430402176","https://linkedin.com/in/tobiassattler"]},"breadcrumb":[{"@type":"BreadcrumbList","itemListElement":[{"@type":"ListItem","position":1,"item":{"@id":"https://mynext.events","name":"MyNext.Events"}}]}]}</script>