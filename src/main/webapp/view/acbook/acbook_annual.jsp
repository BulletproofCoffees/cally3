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


    <style>
   .table > tbody >tr>th {
    border-top: 0px;
    border-right: 1px solid #ddd;
    }
    .table-bordered th {
    background-color: #f9f9f9;
    width: 7.5%;
    }
    .table > tbody > tr> td {
    border-top: 0px;}
    .table {
    margin: 0px; }
    .progress {
    margin-bottom: 0px;}
    
   .charttr:hover {
   background-color: #fff !important;
   }
   
   .incometr {
   color: #4ECDC4;
   font-size: 1.2em;
   }
   
   .expensetr {
   color: #ac92ec;
   font-size: 1.2em;
   }
   
   .table-hover > tbody > tr > td {
   padding-left: 20px;
   }
  
	.btn-xs {
	padding: 0px 3px;
	margin-right: 3px;
	}
	.btn-xs:hover {
	color: #337ab7 !important;
	background-color: rgba(0,0,0,0) !important;
	}
	.fa {
	cursor: pointer;
	}
	.fa-angle-down {
	    vertical-align: middle;
	    margin-top: 3px;
	}
	.collapse > td:first-child {
	padding-left: 30px !important; }
    </style>
    
 <section id="main-content">
      <section class="wrapper">
        <h3><i class="fa fa-angle-right"></i> 연간 보고서</h3>
        <!-- page start-->
        <div class="row mt">

          <aside class="col-lg-12 mt">
          
          <div class="showback">
          <table class="table">
          <tr>
          <th rowspan="2" style="width: 1%; white-space: nowrap;">
          <h3><i class="fa fa-chevron-left moveyear"></i>
          <span class="datespan">${det_date}년</span>
          <i class="fa fa-chevron-right moveyear"></i></h3>
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
                <h4><i class="fa fa-angle-right"></i> 연간 보고서 현황</h4>
               
               
             
               <table class="table table-hover table-bordered table-condensed" id="annualtable">
                  <tr>
                  <th style="width: 10%; white-space: nowrap;">기간</th>
                  <th>1월</th>
                  <th>2월</th>
                  <th>3월</th>
                  <th>4월</th>
                  <th>5월</th>
                  <th>6월</th>
                  <th>7월</th>
                  <th>8월</th>
                  <th>9월</th>
                  <th>10월</th>
                  <th>11월</th>
                  <th>12월</th>
                  </tr>
                
                <tr class="charttr">
                <td id="viewCate">분류</td>
                <td colspan="12">
                  <div id="annual_bar" style="min-height: 300px; width:100%; margin: 0 auto;"></div>
                </td>
                </tr>
                    <!-- ************************** 수입 시작 **************************-->
             <tr class="incometr">
             <th><button id="firstButton" class="btn btn-xs btn-default viewChart"><i class="fa fa-bar-chart-o"></i></button>수입 합계</th>
             <th class="numeric">0</th>
             <th class="numeric">0</th>
             <th class="numeric">0</th>
             <th class="numeric">0</th>
             
             <th class="numeric">0</th>
             <th class="numeric">0</th>
             <th class="numeric">0</th>
             <th class="numeric">0</th>
             
             
             <th class="numeric">0</th>
             <th class="numeric">0</th>
             <th class="numeric">0</th>
             <th class="numeric">0</th>
             </tr>
             
             <!-- 주수입, 부수입 -->
             <c:forEach items="${inlist}" var="list">
             <tr>
             <td>
             <input type="hidden" name="cate_code" value="${list.cate_code}">
             <button class="btn btn-xs btn-default viewChart"><i class="fa fa-bar-chart-o"></i></button>${list.cate_name}<i class="fa fa-angle-down pull-right" data-toggle="collapse" data-target="#${list.cate_name}" aria-controls="${list.cate_name}"></i>
             </td>
             <c:forEach items="${list.result}" var="result">
             	<td class="numeric">
             	<fmt:formatNumber value="${result}" />
             	</td>
             </c:forEach>
             </tr>
             </c:forEach>
             
             
             <!-- <tr class="collapse" id="주수입">
             <td><button class="btn btn-xs btn-default"><i class="fa fa-bar-chart-o"></i></button>급여</td>
             <td class="numeric">0</td>
             <td class="numeric">0</td>
             <td class="numeric">0</td>
             <td class="numeric">0</td>
             
             <td class="numeric">0</td>
             <td class="numeric">0</td>
             <td class="numeric">0</td>
             <td class="numeric">0</td>
             
             <td class="numeric">0</td>
             <td class="numeric">0</td>
             <td class="numeric">0</td>
             <td class="numeric">0</td>
             </tr> -->
             
             
             <!-- ************************** 지출 시작 **************************-->
             <tr class="expensetr">
             <th><button class="btn btn-xs btn-default viewChart"><i class="fa fa-bar-chart-o"></i></button>지출 합계</th>
             <th class="numeric">0</th>
             <th class="numeric">0</th>
             <th class="numeric">0</th>
             <th class="numeric">0</th>
             
             <th class="numeric">0</th>
             <th class="numeric">0</th>
             <th class="numeric">0</th>
             <th class="numeric">0</th>
             
             
             <th class="numeric">0</th>
             <th class="numeric">0</th>
             <th class="numeric">0</th>
             <th class="numeric">0</th>
             </tr>
             
             <!-- 지출 대분류시작 -->
             <c:forEach items="${exlist}" var="list">
             <tr>
             <td>
             <input type="hidden" name="cate_code" value="${list.cate_code}">
             <button class="btn btn-xs btn-default viewChart"><i class="fa fa-bar-chart-o"></i></button>${list.cate_name}<i class="fa fa-angle-down pull-right" data-toggle="collapse" data-target="#${list.cate_name}" aria-controls="${list.cate_name}"></i>
             </td>
             <c:forEach items="${list.result}" var="result">
             	<td class="numeric">
             	<fmt:formatNumber value="${result}" />
             	</td>
             </c:forEach>
             </tr>
             </c:forEach>
       </table>
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
    $("#ac_sub_annual").addClass("active");
    
    $(document).ready(function(){
    	var bars = $(".progress").find(".progress-bar"); 
    	bars.each(function(){
    		var width = $(this).attr('aria-valuenow') + '%';
        	$(this).css('width', width);
    	});
    	
    	
    	getAnnualSum();
    	viewYearChart($("#firstButton"));
    });
    
    $(".viewChart").click(function(){
    	viewYearChart($(this));
    });
    
    function viewYearChart(dom){

    	var tdyn = $(dom).closest("tr").children("td").length;
    	var td;
    	
    	if(tdyn == 0){
    		//th찾아야함
    		td = $(dom).closest("tr").children("th");
    	} else {
    		//td찾아야함
    		td = $(dom).closest("tr").children("td");
    	}
    	
    	var montharr = [0,0,0,0,0,0,0,0,0,0,0,0];
    	$(td).each(function(){
    		var idx = $(this).index();
    		if ( idx > 0){
    			var month = idx + "월";
				var val = uncommas($(this).text());
				montharr[idx-1] = val;
			} else {
				var val = $(this).text();
				if(val == "수입 합계" || val == "주수입" || val == "부수입"){
					yearChart.options.barColors = ['#4ECDC4'];
				} else {
					yearChart.options.barColors = ['#ac92ec'];
				}
				$("#viewCate").text(val);
			}
    	});
    	
    	 $.ajax({
       		headers: { 
	            Accept : "text/plain; charset=utf-8"
	        },
      		url : '/cally/acbook/tostring',
      		type : 'POST',
      		dataType : 'json',
      		data : { '1월' : montharr[0],
      			'2월' : montharr[1],
      			'3월' : montharr[2],
      			'4월' : montharr[3],
      			'5월' : montharr[4],
      			'6월' : montharr[5],
      			'7월' : montharr[6],
      			'8월' : montharr[7],
      			'9월' : montharr[8],
      			'10월' : montharr[9],
      			'11월' : montharr[10],
      			'12월' : montharr[11]
      		},
      		success : function(Data){
      		yearChart.setData(Data);
      		},
      		error : function(){
      			alert("실패");
      			}
      		}); 
    }
    
    function getAnnualSum(){
    	var rowCnt = 0;
		var insumMonth = [0,0,0,0,0,0,0,0,0,0,0,0];
		var exsumMonth = [0,0,0,0,0,0,0,0,0,0,0,0];
		$("#annualtable tbody tr").each(function(){
			if(rowCnt > 2 && rowCnt < 5){
				var td = $(this).children("td");
				$(td).each(function(){
					var idx = $(this).index();
					if ( idx > 0){
						var val = uncommas($(this).text());
						insumMonth[idx-1] += parseInt(val);
					}
				});
			} else if(rowCnt > 5){
				var td = $(this).children("td");
				$(td).each(function(){
					var idx = $(this).index();
					if ( idx > 0){
						var val = uncommas($(this).text());
						exsumMonth[idx-1] += parseInt(val);
					}
				});
			}
			rowCnt ++;
		});
		
		var inth = $(".incometr th");
    	$(inth).each(function(){
    		var idx = $(this).index();
    		if( idx > 0){ $(this).text(commas(insumMonth[idx-1])); }
    	});
    	
    	var exth = $(".expensetr th");
    	$(exth).each(function(){
    		var idx = $(this).index();
    		if( idx > 0){ $(this).text(commas(exsumMonth[idx-1])); }
    	});
    }
    
    var basicData = [
	    { month: '1월', value: 300 },
	    { month: '2월', value: 10 },
	    { month: '3월', value: 150 },
	    { month: '4월', value: 50 },
	    { month: '5월', value: 20 },
	    { month: '6월', value: 200 },
	    { month: '7월', value: 20 },
	    { month: '8월', value: 60 },
	    { month: '9월', value: 80 },
	    { month: '10월', value: 20 },
	    { month: '11월', value: 19 },
	    { month: '12월', value: 1 }
	  ];
	  
    var yearChart = Morris.Bar({
  	  // ID of the element in which to draw the chart.
  	  element: 'annual_bar',
  	  // Chart data records -- each entry in this array corresponds to a point on
  	  // the chart.
  	  data: basicData,
  	  // The name of the data record attribute that contains x-values.
  	  xkey: 'month',
  	  // A list of names of data record attributes that contain y-values.
  	  ykeys: ['value'],
  	  // Labels for the ykeys -- will be displayed when you hover over the
  	  // chart.
  	  labels: ['값'],
  	  //바 컬러
  	  barColors: ['#ac92ec'],
  	  //바 width
  	  barSizeRatio: 0.2,
  	  resize: true
  	});
	 
    
   $(".fa-angle-down").click(function(){
	   if($(this).hasClass("fa-angle-down")){
		   $(this).addClass("fa-angle-up");
		   $(this).removeClass("fa-angle-down"); 
	   } else if($(this).hasClass("fa-angle-up")){
		   $(this).addClass("fa-angle-down");
		   $(this).removeClass("fa-angle-up"); 
	   }
	  
   });

   $(".moveyear").click(function(){
	   var dateinput = $(this).parent().next();
	   var date =  parseInt($(dateinput).val());
	var plus = 0;
	   if($(this).hasClass("fa-chevron-left")){
		   //일년 전으로
		   plus = -1;
	   } else if($(this).hasClass("fa-chevron-right")){
		   //일년 후로
		   plus = 1;
	   }
	   var newdate = date + plus;
	   $(location).attr("href",
				getContextPath()+"/acbook/annual?det_date=" 
						+ newdate);
   });
    	
    </script>