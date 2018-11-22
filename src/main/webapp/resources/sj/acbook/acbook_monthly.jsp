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
          <h3><span style="font-size: 0.7em;"><i class="fa fa-chevron-left"></i></span> 2018년 10월 
          <span style="font-size: 0.7em;"><i class="fa fa-chevron-right"></i></span></h3>
          </th>
          <td>
          <div class="progress">
                <span style="margin-left: 5px;">4,000,000</span> <div class="progress-bar bg-theme" role="progressbar" aria-valuenow="58" aria-valuemin="0" aria-valuemax="100" style="width: 58%">
                  수입 합계
                </div>
                </div>
                
       
          
          </td>
          </tr>
          <tr>
          <td>
                <div class="progress">
                <span style="margin-left: 5px;">2,880,000</span> <div class="progress-bar bg-theme02" role="progressbar" aria-valuenow="42" aria-valuemin="0" aria-valuemax="100" style="width: 42%">
                  지출 합계
                </div>
              </div>
          </td>
          </tr>
          </table>
          </div>
          
            <div class="showback">
                <h4><i class="fa fa-angle-right"></i> 지출 그래프</h4>
               
                 <div class="text-center" style="width: 150px; margin: 0 auto;">
                <div style="margin-bottom: 20px;">
                <select style="width:100%; margin-bottom: 5px;">
                <option>전체보기</option>
                <option>식비</option>
                <option>주거/통신</option>
                <option>생활용품</option>
                <option>의복/미용</option>
               	<option>건강/문화</option>
               	<option>교육/육아</option>
               	<option>교통/차량</option>
               	<option>경조사/회비</option>
               	<option>세금/이자</option>
               	<option>용돈/기타</option>
                </select>
                <button id="btn_bar" class="btn btn-sm btn-theme02"><i class="fa fa-bar-chart-o"></i> 막대형</button>
                 <button id="btn_donut" class="btn btn-sm" ><i class="fa fa-chart-pie"></i> 파이형</button>
                </div></div>
               
                  <div id="monthly_bar" style="min-height: 250px; width:100%; margin: 0 auto;"></div>
               <div id="monthly_donut" style=" width:400px; margin: 0 auto; display:none;"></div>
                
             
       
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
    var mdata = [
	    { category: '식비', budget: 40, value: 300 },
	    { category: '주거/통신', budget: 40, value: 10 },
	    { category: '생활용품', budget: 40, value: 150 },
	    { category: '의복/미용', budget: 40, value: 50 },
	    { category: '건강/문화', budget: 40, value: 20 },
	    { category: '교육/육아', budget: 40, value: 200 },
	    { category: '교통/차량', budget: 40, value: 20 },
	    { category: '경조사/회비', budget: 40, value: 60 },
	    { category: '세금/이자', budget: 40, value: 80 },
	    { category: '용돈/기타', budget: 40, value: 20 },
	    { category: '미분류', budget: 40, value: 1 }
	  ],
	  config = {
	    	  // ID of the element in which to draw the chart.
	    	  element: 'monthly_bar',
	    	  // Chart data records -- each entry in this array corresponds to a point on
	    	  
	    	  // the chart.
	    	  data: mdata,
	    	  // The name of the data record attribute that contains x-values.
	    	  xkey: 'category',
	    	  // A list of names of data record attributes that contain y-values.
	    	  ykeys: ['budget', 'value'],
	    	  // Labels for the ykeys -- will be displayed when you hover over the
	    	  // chart.
	    	  labels: ['예산','지출'],
	    	  //바 컬러
	    	  barColors: ['#4ECDC4','#ac92ec'],
	    	  //바 width
	    	  barSizeRatio: 0.2,
	    	  resize: true
	    	}
    new Morris.Bar(config);
    new Morris.Donut({
    		element: 'monthly_donut',
    		colors: ['#4ECDC4','#ac92ec','#48cfad','#ed5565','#8075c4',
    			'#a9d86e','#FCB322','#ff6c60','#41cac0','#2A3542','#3498db'],
    		  data: [
    			    { label: '식비', value: 300 },
    			    { label: '주거/통신', value: 10 },
    			    { label: '생활용품', value: 150 },
    			    { label: '의복/미용', value: 50 },
    			    { label: '건강/문화', value: 20 },
    			    { label: '교육/육아', value: 200 },
    			    { label: '교통/차량', value: 20 },
    			    { label: '경조사/회비', value: 60 },
    			    { label: '세금/이자', value: 80 },
    			    { label: '용돈/기타', value: 20 },
    			    { label: '미분류', value: 1 }
    			  ]});
    
    
    	
    	$(".btn").click(function(){
    		if($(this).hasClass("btn-theme02")){
    		}else {
    			$(".btn").removeClass("btn-theme02");
    			$(this).addClass("btn-theme02");
    		}
    		
    		if($(this).is("#btn_bar")){
    			$("#monthly_bar").css({'display':'block'});
    			$("#monthly_donut").css({'display':'none'});
    		} else {
    			$("#monthly_bar").css({'display':'none'});
    			$("#monthly_donut").css({'display':'block'});
    		}
    		
    	});
   

    	
    </script>