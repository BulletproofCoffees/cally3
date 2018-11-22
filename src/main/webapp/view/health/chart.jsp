<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="col-md-12">
        		  	<span class="b_bold b_fontsize20"></span>
        	  	  	<div id="hero-donut" class="graph"></div>
</div>  



        	  	  
<!--  모리스 css -->
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">

   <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>
<script>
  /* Morris.Donut({
      element: 'hero-donut',
      data: [
        {label: '기초대사량', value: 1414 },
        {label: '활동대사량', value: 424 },
        {label: '소화에너지', value: 204 }
   
      ],
        colors: ['#4ECDC4', '#ED5565', '#f0AD4E', '#CCC'],
      formatter: function (y) { return y  }
    }); */
  
  </script>
<!-- <style>

#chartdiv {
	width: 100%;
	height: 700px;
}

#counter1 {
	font-size: 9rem;
	margin-left: 200px;
}


</style>

Resources
<script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
<script src="https://www.amcharts.com/lib/3/pie.js"></script>
<script src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
<link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
<script src="https://www.amcharts.com/lib/3/themes/none.js"></script>




Chart code
<script>
var chart;
var legend;
var selected;

var types = 
	[ {

		type : "탄수화물",
		percent : 50,
		color : "#ff9e01",
		/* subs : [ {
			type : "Oil",
			percent : 15
		}, {
			type : "Coal",
			percent : 35
		}, {
			type : "Nuclear",
			percent : 20
		} ] */
	},
	{
		type : "단백질",
		percent : 20,
		color : "#b0de09",
		subs : [ {
			type : "Hydro",
			percent : 15
		}, {
			type : "Wind",
			percent : 10
		}, {
			type : "Other",
			percent : 5
		} ]
	},
	{   
		type : "지방",
		percent : 30,
		color : "#b0de09",
		subs : [ {
			type : "Hydro",
			percent : 15
		}, {
			type : "Wind",
			percent : 10
		}, {
			type : "Other",
			percent : 5
		} ]
	}];

	function generateChartData() {
		var chartData = [];
		for (var i = 0; i < types.length; i++) {
			if (i == selected) {
				for (var x = 0; x < types[i].subs.length; x++) {
					chartData.push({
						type : types[i].subs[x].type,
						percent : types[i].subs[x].percent,
						color : types[i].color,
						pulled : true
					});
				}
			} else {
				chartData.push({
					type : types[i].type,
					percent : types[i].percent,
					color : types[i].color,
					id : i
				});
			}
		}
		return chartData;
	}

	AmCharts.makeChart("chartdiv", {
		"type" : "pie",
		"theme" : "none",

		"dataProvider" : generateChartData(),
		"labelText" : "[[title]]: [[value]]",
		"balloonText" : "[[title]]: [[value]]",
		"titleField" : "type",
		"valueField" : "percent",
		"outlineColor" : "#FFFFFF",
		"outlineAlpha" : 0.8,
		"outlineThickness" : 2,
		"colorField" : "color",
		"pulledField" : "pulled",
		"titles" : [ {
			"text" : "일일 칼로리"
		} ],
		"listeners" : [ {
			"event" : "clickSlice",
			"method" : function(event) {
				var chart = event.chart;
				if (event.dataItem.dataContext.id != undefined) {
					selected = event.dataItem.dataContext.id;
				} else {
					selected = undefined;
				}
				chart.dataProvider = generateChartData();
				chart.validateData();
			}
		} ],
		"export" : {
			"enabled" : true
		}
	});
</script>

<div id="chartdiv"></div> -->	