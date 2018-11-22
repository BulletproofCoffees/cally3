<%@ include file="submenu.jspf" %>  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
<script src="https://www.amcharts.com/lib/3/serial.js"></script>
<script src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
<link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
<script src="https://www.amcharts.com/lib/3/themes/light.js"></script>
    
     <style>
#chartdiv {
	width		: 100%;
	height		: 500px;
	font-size	: 11px;
}					
</style>
<section id="main-content">
<section class="wrapper">
<div class="container">
<div class="row mt"> 

 <aside class="col-lg-5 mt">
    <div class="form-group row">
    <h1>기본정보 입력</h1>
    <hr/>
    <form method="post" action="health_mypage">
 <table class="table table-bordered">
    <tr>
    <th><label for="sex" name="MEM_SEX">성별</label></th>
    <td>
    <div class="form-group">
    <div class="col-xs-8">
    남<input type="radio"  id="boy" value="m" name="MEM_SEX">
    여<input type="radio"  id="girl" value="w" name="MEM_SEX">
    </div>                                                 
    </div>
    </td>
    </tr>
    <tr>
    <th><label for="age">연령</label></th>
    <td>
    <div class="form-group">
    <div class="col-xs-8">
    <input type="text" class="form-control" id="age" placeholder="만 나이를 입력해 주세요 --> 예)31" name="AGE">
    </div>
    </div>
    </td>
    </tr>
    <tr>
    <th><label for="height" >키</label></th>
    <td>
    <div class="form-group">
    <div class="col-xs-8">
    <input type="text" class="form-control" id="height" name="STATURE">
    </div>
    </div>
    </td>
    </tr>
    <tr>
    <th><label for="weight">몸무게</label></th>
    <td>
    <div class="form-group">
    <div class="col-xs-8">
    <input type="text" class="form-control" id="weight" name="KG">
    </div>
    </div>
    </td>
    </tr>
 </table>

    <center>
    <button class="btn btn-info btn-lg" type="submit">확인</button>
    </center>
 </form>
 

    </div>
  </aside>
  <aside class="col-lg-2 mt"></aside>
  
      <aside class="col-lg-5 mt">
    <div class="form-group row">
    <h1>나의정보</h1>
    <hr/>
   <c:forEach items="${mypage}" var="mp">
 <table class="table table-bordered">
    <tr>
    <th><label for="sex">성별</label></th>
    <td>
    <div class="form-group">
    <div class="col-xs-8">
  <input type="text" class="form-control" name="MEM_SEX" value="${mp.MEM_SEX}">
    </div>                                                 
    </div>
    </td>
    </tr>
    <tr>
    <th><label for="age">연령</label></th>
    <td>
    <div class="form-group">
    <div class="col-xs-8">
    <input type="text" class="form-control" id="age" value="${mp.AGE}" name="AGE">
    </div>
    </div>
    </td>
    </tr>
    <tr>
    <th><label for="height" >키</label></th>
    <td>
    <div class="form-group">
    <div class="col-xs-8">
    <input type="text" class="form-control" id="height" name="STATURE" value="${mp.STATURE}">
    </div>
    </div>
    </td>
    </tr>
    <tr>
    <th><label for="weight">몸무게</label></th>
    <td>
    <div class="form-group">
    <div class="col-xs-8">
    <input type="text" class="form-control" id="weight" name="KG" value="${mp.KG}">
    </div>
    </div>
    </td>
    </tr>
 </table>
    
    </c:forEach> 

    <center>
    <button class="btn btn-info btn-lg">수정</button>
    </center> 

    </div>
  </aside>
  <aside class="col-lg-2 mt"></aside>
      <aside class="col-lg-12 mt">
      <div id="chartdiv"></div>
      </aside>
  
  
  
  </div> 
</div>

</section>
</section>

    <script>
var chart = AmCharts.makeChart( "chartdiv", {
  "type": "serial",
  "theme": "light",
  "dataProvider": [ {
    "country": "USA",
    "visits": 2025
  }, {
    "country": "China",
    "visits": 1882
  }, {
    "country": "Japan",
    "visits": 1809
  }, {
    "country": "Germany",
    "visits": 1322
  }, {
    "country": "UK",
    "visits": 1122
  }, {
    "country": "France",
    "visits": 1114
  }, {
    "country": "India",
    "visits": 984
  }, {
    "country": "Spain",
    "visits": 711
  }, {
    "country": "Netherlands",
    "visits": 665
  }, {
    "country": "Russia",
    "visits": 580
  }, {
    "country": "South Korea",
    "visits": 443
  }, {
    "country": "Canada",
    "visits": 441
  }, {
    "country": "Brazil",
    "visits": 395
  } ],
  "valueAxes": [ {
    "gridColor": "#FFFFFF",
    "gridAlpha": 0.2,
    "dashLength": 0
  } ],
  "gridAboveGraphs": true,
  "startDuration": 1,
  "graphs": [ {
    "balloonText": "[[category]]: <b>[[value]]</b>",
    "fillAlphas": 0.8,
    "lineAlpha": 0.2,
    "type": "column",
    "valueField": "visits"
  } ],
  "chartCursor": {
    "categoryBalloonEnabled": false,
    "cursorAlpha": 0,
    "zoomable": false
  },
  "categoryField": "country",
  "categoryAxis": {
    "gridPosition": "start",
    "gridAlpha": 0,
    "tickPosition": "start",
    "tickLength": 20
  },
  "export": {
    "enabled": true
  }

} );
</script>
<%@ include file="js.jspf" %>