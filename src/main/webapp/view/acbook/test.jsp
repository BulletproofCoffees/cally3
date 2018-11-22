<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <!-- 가계부 서브메뉴 인클루즈 -->
    <%@ include file="acbook_submenu.jspf" %>
       <!--  모리스 css -->
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">
    <!-- 모리스용 js -->
   <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>
  
     <section id="main-content">
      <section class="wrapper">
        <h3><i class="fa fa-angle-right"></i> 월간 보고서</h3>
        <!-- page start-->
        <div class="row mt">

          <aside class="col-lg-12 mt">
          
          <div class="showback">
          <h3>테스트2</h3>
<!-- 제이슨으로 data를 받아와서.. 한다? 흐음.. -->
<form id="ff">
<div class="chartdata">
<input type="hidden" name="category" value="주수입">
<input type="hidden" name="value" value="450">
<input type="hidden" name="budget" value="500">
</div>
<div class="chartdata">
<input type="hidden" name="category" value="부수입">
<input type="hidden" name="value" value="240">
<input type="hidden" name="budget" value="300">
</div>  
<div class="chartdata">
<input type="hidden" name="category" value="어쩌구">
<input type="hidden" name="value" value="550">
<input type="hidden" name="budget" value="500">
</div>  
<div class="chartdata">
<input type="hidden" name="category" value="저쩌구">
<input type="hidden" name="value" value="300">
<input type="hidden" name="budget" value="280">
</div> 
</form>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
 <div id="bbar" style="min-height: 250px; width:100%; margin: 0 auto;"></div> 
    
            </div>
          </aside>
          

          
     
        </div>
        <!-- page end-->
      </section>
      <!-- /wrapper -->
    </section>
    <!-- /MAIN CONTENT -->

      <!-- 가계부 자바스크립트 인클루드 -->
    <%@ include file="acbook_js.jspf" %>
    <script>
    $(document).ready(function(){
    	var fData = $("#ff").serializeArray();
    	 var config = {
   	    	  // ID of the element in which to draw the chart.
   	    	  element: 'bbar',
   	    	  // Chart data records -- each entry in this array corresponds to a point on
   	    	  // the chart.
   	    	  data: fData,
   	    	  // The name of the data record attribute that contains x-values.
   	    	  xkey: 'category',
   	    	  // A list of names of data record attributes that contain y-values.
   	    	  ykeys: ['value', 'budget'],
   	    	  // Labels for the ykeys -- will be displayed when you hover over the
   	    	  // chart.
   	    	  labels: ['예산','지출'],
   	    	  //바 컬러
   	    	  barColors: ['#4ECDC4','#ac92ec'],
   	    	  //바 width
   	    	  barSizeRatio: 0.2,
   	    	  resize: true
   	    	};
       new Morris.Bar(config);
    });
    
   
	 
    </script>