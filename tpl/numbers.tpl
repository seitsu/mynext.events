<section id="numbers">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h1>Numbers &amp; Statistics</h1>
				<hr class="small">
				<p class="lead text-center">These numbers and statistics are generated on the fly based on the upcoming events listed on this website.</p>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-10 col-lg-offset-1 col-xs-12">
				<h2>Events per Months this Year</h2>
				<canvas id="events_per_months" width="400" height="200"></canvas>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-5 col-lg-offset-1 col-xs-12">
				<h2>Number of Events still happening</h2>
				<canvas id="number_of_events" width="400" height="400"></canvas>
			</div>
			<div class="pull-left col-lg-5 col-xs-12">
				<h2>Average Event Duration</h2>
				<canvas id="number_by_duration" width="400" height="400"></canvas>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-5 col-lg-offset-1 col-xs-12">
				<h2>Top 5 Countries with most Events</h2>
				<canvas id="number_by_country" width="400" height="400"></canvas>
			</div>
			<div class="pull-left col-lg-5 col-xs-12">
				<h2>Events by Continents</h2>
				<canvas id="number_of_continent" width="400" height="400"></canvas>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">&nbsp;
			</div>
		</div>
	</div>
</section>
<script type="application/ld+json">{"@context":"https://schema.org","@type":"BreadcrumbList","itemListElement":[{"@type":"ListItem","position":1,"item":{"@id":"https://mynext.events","name":"MyNext.Events"}},{"@type":"ListItem","position":2,"item":{"@id":"https://mynext.events/numbers","name":"Numbers & Statistics"}}]}</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.min.js" integrity="sha384-nuT0qw6vBhqN718uyKaI6w1EXH49c5XiMUqmHEEiJadrKmJtmQOVVsd8vTgBpr8h" crossorigin="anonymous"></script>
<script>
var MonthsChart = new Chart(document.getElementById('events_per_months'), {
	"type": "horizontalBar",
	"data" : {
		"labels" : [
		{% for keys in numbers_by_months|keys%}
			'{{keys}}',
		{% endfor %}
		],
		"datasets": [{
			"label": "Events per Months",
			"data": [
            {% for year in numbers_by_months%}
            	{{year}},
            {% endfor %}
            ],
            "backgroundColor": ["rgb(255, 155, 44)", "rgb(52, 178, 175)", "rgb(255, 204, 153)", "rgb(176, 224, 224)", "rgb(168, 170, 172)"]
		}]
	}
});

var NumberChart = new Chart(document.getElementById('number_of_events'), {
    "type": "doughnut",
    "data": {
        "labels": [
		{% for keys in numbers_by_year|keys%}
			{{keys}},
		{% endfor %}
        ],
        "datasets": [{
            "label": "Number of Events",
            "data": [
            {% for year in numbers_by_year%}
            	{{year}},
            {% endfor %}
            ],
            "backgroundColor": ["rgb(255, 155, 44)", "rgb(52, 178, 175)", "rgb(255, 204, 153)", "rgb(176, 224, 224)", "rgb(168, 170, 172)"]
        }]
    }
});

var DurationChart = new Chart(document.getElementById('number_by_duration'), {
    "type": "doughnut",
    "data": {
        "labels": [
		{% for keys in numbers_by_duration|keys%}
			{{keys}},
		{% endfor %}
        ],
        "datasets": [{
            "label": "Average Event Duration",
            "data": [
            {% for duration in numbers_by_duration%}
            	{{duration}},
            {% endfor %}
            ],
            "backgroundColor": ["rgb(255, 155, 44)", "rgb(52, 178, 175)", "rgb(255, 204, 153)", "rgb(176, 224, 224)", "rgb(168, 170, 172)"]
        }]
    },
    "options": {
    	"tooltips" : {
    		"callbacks" : {
    			"label" : function (tooltipItem, data) {
    				var value = data.datasets[tooltipItem.datasetIndex].data[tooltipItem.index];
    				var label = data.labels[tooltipItem.index];
    				
    				if(value == 1) {
    					var event = 'event';
    				} else {
    					var event = 'events';
    				}
    				
    				if(label == 1) {
    					var day = 'day';
    				} else {
    					var day = 'days';
    				}
    				
    				return value + ' ' + event + ' will run ' + label + ' ' + day;
    			}
			}
    	}
    }
});

var CountryChart = new Chart(document.getElementById('number_by_country'), {
    "type": "doughnut",
    "data": {
        "labels": [
		{% for keys in numbers_by_country|keys%}
			'{{keys}}',
		{% endfor %}
        ],
        "datasets": [{
            "label": "Events by Country",
            "data": [
            {% for count in numbers_by_country%}
            	{{count}},
            {% endfor %}
            ],
            "backgroundColor": ["rgb(255, 155, 44)", "rgb(52, 178, 175)", "rgb(255, 204, 153)", "rgb(176, 224, 224)", "rgb(168, 170, 172)"]
        }]
    }
});

var ContinentChart = new Chart(document.getElementById('number_of_continent'), {
    "type": "doughnut",
    "data": {
        "labels": [
		{% for keys in numbers_by_continent|keys%}
			'{{keys}}',
		{% endfor %}
        ],
        "datasets": [{
            "data": [
            {% for count in numbers_by_continent%}
            	{{count}},
            {% endfor %}
            ],
            "label" : [
            {% for long_name in numbers_by_continent_long%}
            	'{{long_name}}',
            {% endfor %}
            ],
            "backgroundColor": ["rgb(255, 155, 44)", "rgb(52, 178, 175)", "rgb(255, 204, 153)", "rgb(176, 224, 224)", "rgb(168, 170, 172)"]
        }]
    },
    "options": {
    	"tooltips" : {
    		"callbacks" : {
    			"label" : function (tooltipItem, data) {
    				var value = data.datasets[tooltipItem.datasetIndex].data[tooltipItem.index];
    				var label = data.datasets[tooltipItem.datasetIndex].label[tooltipItem.index];
    				return label + ': ' + value;
    			}
			}
    	}
    }
});
</script>