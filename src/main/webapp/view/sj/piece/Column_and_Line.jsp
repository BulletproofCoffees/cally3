<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
<style type="text/css">
#chartdiv {
  width: 100%;
  height: 500px;
}	

</style>

<script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
<script src="https://www.amcharts.com/lib/3/serial.js"></script>
<script src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
<script src="https://www.amcharts.com/lib/3/themes/none.js"></script>

<div id="chartdiv"></div>		


<script type="text/javascript">
	
var events = [];
$.ajax({
	url : "${pageContext.request.contextPath}/sj/days",
	type : 'POST',
	dataType : 'json',
	success : function(data) {	
/* alert('성공'); */
	var obj = data;
 var a = obj[0];
 
		$(a).each(function(day,e){
		  var test = {				  
				    year: e.DAY,
				    income: e.CAL,		
				    expenses:''
				};		
		  events.push(test); 		
		 });
 var dataProvider = events;

 var chart = AmCharts.makeChart( "chartdiv", {
	  "type": "serial",
	  "addClassNames": true,
	  "theme": "none",
	  "autoMargins": false,
	  "marginLeft": 30,
	  "marginRight": 8,
	  "marginTop": 10,
	  "marginBottom": 26,
	  "balloon": {
	    "adjustBorderColor": false,
	    "horizontalPadding": 10,
	    "verticalPadding": 8,
	    "color": "#ffffff"
	  },

	  "dataProvider": dataProvider,
	  "valueAxes": [ {
	    "axisAlpha": 0,
	    "position": "left"
	  } ],
	  "startDuration": 1,
	  "graphs": [ {
	    "alphaField": "alpha",
	    "balloonText": "<span style='font-size:12px;'>[[title]] in [[category]]:<br><span style='font-size:20px;'>[[value]]</span> [[additional]]</span>",
	    "fillAlphas": 1,
	    "title": "Income",
	    "type": "column",
	    "valueField": "income",
	    "dashLengthField": "dashLengthColumn"
	  }, {
	    "id": "graph2",
	    "balloonText": "<span style='font-size:12px;'>[[title]] in [[category]]:<br><span style='font-size:20px;'>[[value]]</span> [[additional]]</span>",
	    "bullet": "round",
	    "lineThickness": 3,
	    "bulletSize": 7,
	    "bulletBorderAlpha": 1,
	    "bulletColor": "#FFFFFF",
	    "useLineColorForBulletBorder": true,
	    "bulletBorderThickness": 3,
	    "fillAlphas": 0,
	    "lineAlpha": 1,
	    "title": "Expenses",
	    "valueField": "expenses",
	    "dashLengthField": "dashLengthLine"
	  } ],
	  "categoryField": "year",
	  "categoryAxis": {
	    "gridPosition": "start",
	    "axisAlpha": 0,
	    "tickLength": 0
	  }
	  
	} );
 
 /*  */
	}
});


</script>																						
