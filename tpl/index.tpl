{% spaceless %}
<!DOCTYPE html>
<html lang="en" prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# profile: http://ogp.me/ns/profile#">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="{{meta_desc}}">
    <meta property="fb:admins" content="1035057644">
    <meta property="og:title" content="{{page_title}}">
    <meta property="og:type" content="website">
    <meta property="og:url" content="https://mynext.events">
    <meta property="og:description" content="{{meta_desc}}">
    <meta property="og:image" content="https://mynext.events/img/{{social_pic}}">
    <meta name="twitter:card" content="summary">
    <meta name="twitter:site" content="@MyNextEvents">
    <meta name="twitter:creator" content="@tobiassattler">
    <title>{{page_title}}</title>
    <link href="https://plus.google.com/117865868225430402176" rel="author">
    <link href="https://twitter.com/MyNextEvents" rel="author">
    <link href="https://facebook.com/sattler" rel="author">
    <link href="https://plus.google.com/117865868225430402176" rel="publisher">
    <link href="https://twitter.com/MyNextEvents" rel="publisher">
    <link href="https://facebook.com/sattler" rel="publisher">
    <link href="https://mynext.events{% if content != 'home' %}/{{content}}{% endif %}" rel="canonical">
    <link href="https://mynext.events/favicon.png" rel="icon" type="image/png">
    <link href="https://mynext.events/apple-touch-icon.png" rel="apple-touch-icon" sizes="180x180">
    <!--[if lt IE 9]>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js" integrity="sha384-qFIkRsVO/J5orlMvxK1sgAt2FXT67og+NyFTITYzvbIP1IJavVEKZM7YWczXkwpB" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js" integrity="sha384-ZoaMbDF+4LeFxg6WdScQ9nnR1QC2MIRxA1O9KWEXQwns1G8UNyIEZIQidzb0T1fo" crossorigin="anonymous"></script>
    <![endif]-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Sarabun:300,400,700" rel="stylesheet"> 
    <link href="https://mynext.events/css/style117.css" rel="stylesheet">
</head>
<body>
    <a id="menu-toggle" href="#" class="btn btn-dark btn-lg toggle" title="Menü öffnen"><i aria-hidden="true" class="fa fa-bars"></i></a>
    <nav id="sidebar-wrapper">
    	<a id="menu-close" href="#" class="btn btn-light btn-lg pull-right toggle" title="Close menu"><i aria-hidden="true" class="fa fa-times"></i></a>
		<ul class="sidebar-nav">
			<li class="sidebar-brand">&nbsp;</li>
			<li><a href="https://mynext.events/" onclick="$('#menu-close').click();" title="What will be your next event?"><i aria-hidden="true" class="fa fa-home famine"></i>Home</a></li>
			<li><a href="https://mynext.events/about" onclick="$('#menu-close').click();" title="Learn more about this project"><i aria-hidden="true" class="fa fas fa-bullhorn famine"></i>About</a></li>
			<li><a href="https://mynext.events/numbers" onclick="$('#menu-close').click();" title="Numbers &amp; Statistics"><i aria-hidden="true" class="fa fa-chart-pie famine"></i>Numbers</a></li>
			<li><a href="https://mynext.events/faq" onclick="$('#menu-close').click();" title="Frequent Questions"><i aria-hidden="true" class="fa fa-question-circle famine"></i>FAQ</a></li>
			<li><a href="https://mynext.events/privacy" onclick="$('#menu-close').click();" title="More details about data privacy"><i aria-hidden="true" class="fa fa-shield-alt famine"></i>Privacy</a></li>
			<li><a href="https://mynext.events/#contact" onclick="$('#menu-close').click();" title="Get in touch"><i aria-hidden="true" class="far fa-envelope famine"></i>Contact</a></li>
		</ul>
    </nav>
    
    <header id="top" class="small-header">
        {% if content != 'home' %}<div class="rel"><span class="logo"><i aria-hidden="true" class="far fa-calendar-check"></i>&nbsp;<a href="//mynext.events" class="white" title="Where do you want to go next?">MyNext.Events</a></span></div>{% endif %}
    </header>
    
    {% include content ~ '.tpl' %}

	<section id="contact">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2 col-xs-12">
					<h2>Imprint</h2>
					<p class="text-center"><a href="//tobiassattler.com" target="_blank" title="Visit the website of Tobias Sattler" rel="noopener">Tobias Sattler</a>, Hauptstr. 5, 85586 Poing, mail [at] tobiassattler.com</p>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2 col-xs-12">
					<h2>Other Projects</h2>
					<p class="text-center"><a href="//stammtisch.domains" target="_blank" title="German biannual domain name event held in Munich" rel="noopener">Domain-Stammtisch München</a></p>
					<p class="text-center"><a href="//bestpractice.domains" target="_blank" title="Best practices for domain names by TechOps" rel="noopener">BestPractice.Domains</a></p>
				</div>
			</div>
		</div>
	</section>

	<a id="to-top" href="#top" class="btn btn-dark btn-lg" title="back to top"><i aria-hidden="true" class="fa fa-chevron-up fa-fw fa-1x"></i></a>
	
	<div class="overlay"></div>
	
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.1/jquery.min.js" integrity="sha384-UM1JrZIpBwVf5jj9dTKVvGiiZPZTLVoq4sfdvIe9SBumsvCuv6AHDNtEiIb5h1kU" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.lazyload/1.9.1/jquery.lazyload.min.js" integrity="sha384-ovn+ksX00EqrxlV2SLbvnb13K5244CZPrO3v08mAssOuQ1AgGVcEu4k44sdOJPJE" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <script src="https://mynext.events/script.js"></script>
</body>
</html>
{% endspaceless %}