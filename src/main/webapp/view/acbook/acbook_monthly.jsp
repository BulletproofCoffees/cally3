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
  
<!-- font awesome css -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">

    <style>
   .table > tbody >tr>th {
    border-top: 0px;
    border-right: 1px solid #ddd;
    }
    
    .table > tbody > tr> td {
    border-top: 0px; }
    .table {
    margin: 0px; }
    .progress {
    margin-bottom: 0px;}
   
    </style>
    
 <section id="main-content">
      <section class="wrapper">
        <h3><i class="fa fa-angle-right"></i> 월간 보고서</h3>
        <!-- page start-->
        <div class="row mt">

          <aside class="col-lg-12 mt">
          
          <div class="showback">
          <table class="table">
          <tr>
          <th rowspan="2" style="width: 1%; white-space: nowrap;">
          <h3><i class="fa fa-chevron-left movemonth"></i>
          <span class="datespan">2018년 10월</span> 
          <i class="fa fa-chevron-right movemonth"></i></h3>
          <input type="hidden" name="det_date" value="${det_date}">
          </th>
          <td>
          <div class="progress">
                <span style="margin-left: 5px;"><fmt:formatNumber value="${sum_in}"/></span> <div class="progress-bar bg-theme" role="progressbar" aria-valuenow="${per_in}" aria-valuemin="0" aria-valuemax="100">
                  수입 합계
                </div>
                </div>
           
          </td>
          </tr>
          <tr>
          <td>
                <div class="progress">
                <span style="margin-left: 5px;"><fmt:formatNumber value="${sum_ex}"/></span> <div class="progress-bar bg-theme02" role="progressbar" aria-valuenow="${per_ex}" aria-valuemin="0" aria-valuemax="100">
                  지출 합계
                </div>
              </div>
          </td>
          </tr>
          </table>
          </div>
          
            <div class="showback">
                <h4><i class="fa fa-angle-right"></i> 그래프</h4>
               
                 <div class="text-center" style="width: 150px; margin: 0 auto;">
                <div style="margin-bottom: 20px;">
                <select style="width:100%; margin-bottom: 5px;" class="m_cate_code" name="cate_code">
                <option value="0">지출 전체보기</option>
                <option value="-1">수입 전체보기</option>
                <option value="1">주수입</option>
                <option value="2">부수입</option>
                <option value="3">식비</option>
                <option value="4">주거/통신</option>
                <option value="5">생활용품</option>
                <option value="6">의복/미용</option>
               	<option value="7">건강/문화</option>
               	<option value="8">교육/육아</option>
               	<option value="9">교통/차량</option>
               	<option value="10">경조사/회비</option>
               	<option value="11">세금/이자</option>
               	<option value="12">용돈/기타</option>
                </select>
                <button id="btn_bar" class="btn btn-sm btn-theme02"><i class="fa fa-bar-chart-o"></i> 막대형</button>
                 <button id="btn_donut" class="btn btn-sm" ><i class="fa fa-chart-pie"></i> 파이형</button>
                </div></div>
                
                <hr>
                 			<h3 class="centered">[ <i class="fa fa-bar-chart-o"></i> 막대형 그래프 ]</h3>
                <div id="bargroup"  style="min-height: 250px; width:100%; margin: 0 auto;">
 				<div id="monthly_bar_exall"></div>    
 				<div id="monthly_bar"></div>
              </div>
              <hr>
               <h3 class="centered">[ <i class="fa fa-chart-pie"></i> 파이형 그래프 ]</h3>
               <div id="monthly_donut" style=" width:400px; margin: 0 auto;"></div>
                
             
       
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
  <!--  모리스 차트 커스텀 js -->  
    <script>
    $("#ac_sub_2").addClass("active");
    $("#ac_sub_monthly").addClass("active");
    
    $(document).ready(function(){
    	var date = $("input[name='det_date']").val().split("/");
    	$(".datespan").text(date[0] + "년 " + date[1] + "월");
    	
    	var bars = $(".progress").find(".progress-bar"); 
    	bars.each(function(){
    		var width = $(this).attr('aria-valuenow') + '%';
        	$(this).css('width', width);
    	});
    	
    	var det_date = $("input[name='det_date']").val();
    	
    	ajaxBar(0, det_date);
    	ajaxDonut(0, det_date);
    });
    
    $(".movemonth").click(function(){
    	//화살표를 눌러 달을 움직인다.
    	var dateinput = $(this).parent().next();
    	movemonth($(this), $(dateinput));
    	
    	var date = $(dateinput).val();
    	
    	$(location).attr("href",
				getContextPath()+"/acbook/monthly?det_date=" 
						+ date);
    });
    
    
    var basicData = [{SUB_NAME : '카테1', DET_MONEY : 0},
    	{SUB_NAME : '카테2', DET_MONEY : 0},
    	{SUB_NAME : '카테3', DET_MONEY : 0},
    	{SUB_NAME : '카테4', DET_MONEY : 0}];
   
    var basicData2 = [{CATE_NAME : '카테1', BUDGET_VALUE : 0, DET_MONEY : 0},
    	{CATE_NAME : '카테2', BUDGET_VALUE : 0, DET_MONEY : 0},
    	{CATE_NAME : '카테3', BUDGET_VALUE : 0, DET_MONEY : 0},
    	{CATE_NAME : '카테4', BUDGET_VALUE : 0, DET_MONEY : 0}];
   
    var basicData3 = [
	    { label: '식비', value: 0 },
	    { label: '주거/통신', value: 0 },
	    { label: '생활용품', value: 0 },
	    { label: '의복/미용', value: 0 },
	    { label: '건강/문화', value: 0 },
	    { label: '교육/육아', value: 0 },
	    { label: '교통/차량', value: 0 },
	    { label: '경조사/회비', value: 0 },
	    { label: '세금/이자', value: 0 },
	    { label: '용돈/기타', value: 0 }
	  ];
    
    var allExChart =  Morris.Bar({
    	  // ID of the element in which to draw the chart.
    	  element: 'monthly_bar_exall',
    	  // Chart data records -- each entry in this array corresponds to a point on
    	  // the chart.
    	  data: basicData2,
    	  // The name of the data record attribute that contains x-values.
    	  xkey: 'CATE_NAME',
    	  // A list of names of data record attributes that contain y-values.
    	  ykeys: ['BUDGET_VALUE','DET_MONEY'],
    	  // Labels for the ykeys -- will be displayed when you hover over the
    	  // chart.
    	  labels: ['예산','지출'],
    	  //바 컬러
    	  barColors: ['#4ECDC4','#ac92ec'],
    	  //바 width
    	  barSizeRatio: 0.2,
    	  resize: true
    	});
    
    var barChart = Morris.Bar({
  	  // ID of the element in which to draw the chart.
  	  element: 'monthly_bar',
  	  // Chart data records -- each entry in this array corresponds to a point on
  	  // the chart.
  	  data: basicData,
  	  // The name of the data record attribute that contains x-values.
  	  xkey: 'SUB_NAME',
  	  // A list of names of data record attributes that contain y-values.
  	  ykeys: ['DET_MONEY'],
  	  // Labels for the ykeys -- will be displayed when you hover over the
  	  // chart.
  	  labels: ['지출'],
  	  //바 컬러
  	  barColors: ['#ac92ec'],
  	  //바 width
  	  barSizeRatio: 0.2,
  	  resize: true
  	});
    
    var donutChart = Morris.Donut({
		element: 'monthly_donut',
		colors: ['#4ECDC4','#ac92ec','#48cfad','#ed5565','#8075c4',
			'#a9d86e','#FCB322','#ff6c60','#41cac0','#2A3542','#3498db'],
		  data: basicData3});

    
    $(".m_cate_code").change(function(){
    	var cate_code =  $(this).val();
    	var det_date = $("input[name='det_date']").val();
    	ajaxBar(cate_code, det_date);
    	ajaxDonut(cate_code, det_date);
    	
    	if(cate_code == -1 || cate_code == 1 || cate_code == 2){
    		barChart.options.barColors = ['#4ECDC4'];
		} else {
			barChart.options.barColors = ['#ac92ec'];
		}
    });
    
    
    function ajaxBar(cate_code, det_date){
    		$.ajax({
          		headers: { 
        		            Accept : "text/plain; charset=utf-8"
        		        },
          		url : '/cally/acbook/monthly',
          		type : 'POST',
          		dataType : 'json',
          		data : {'cate_code' : cate_code,
          				'det_date' : det_date,
          				'type' : 1},
          		success : function(Data){
          		 var obj = $(Data);
          	   if(cate_code == 0){
          		 $("#monthly_bar").css({'display':'none'});
               	$("#monthly_bar_exall").css({'display':'block'});
          		   //예산과 지출이 있는 바그래프
          	   allExChart.setData(Data);
          	   } else {
          		   //지출만 있는 바그래프
          	$("#monthly_bar_exall").css({'display':'none'});
          		$("#monthly_bar").css({'display':'block'});
          		barChart.setData(Data);
          	   }
          		},
          		error : function(){
          			alert("json실패");
          		}
          	});
    	}
    
    function ajaxDonut(cate_code, det_date){
    	$.ajax({
      		headers: { 
    		            Accept : "text/plain; charset=utf-8"
    		        },
      		url : '/cally/acbook/monthly',
      		type : 'POST',
      		dataType : 'json',
      		data : {'cate_code' : cate_code,
      				'det_date' : det_date,
      				'type' : 2},
      		success : function(Data){
      			//도넛은 무조건 label : , value : 으로 지출 혹은 수입만 보여준다.
      		 var obj = $(Data);
			donutChart.setData(Data);
      		},
      		error : function(){
      			alert("json실패");
      		}
      	});
    }
    	$(".btn").click(function(){
    		if($(this).hasClass("btn-theme02")){
    		}else {
    			$(".btn").removeClass("btn-theme02");
    			$(this).addClass("btn-theme02");
    		}
    		
    		if($(this).is("#btn_bar")){
    			  document.getElementById('bargroup').scrollIntoView();
    		} else {
    			  document.getElementById('monthly_donut').scrollIntoView();
    		}
    		
    		
    		
    	});
   

    	
    </script>