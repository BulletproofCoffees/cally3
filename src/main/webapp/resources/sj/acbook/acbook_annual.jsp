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
   .numeric {
   text-align: right;}

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
          <h3><span style="font-size: 0.7em;"><i class="fa fa-chevron-left"></i></span> 2018년
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
                <h4><i class="fa fa-angle-right"></i> 연간 보고서 현황</h4>
               
               
             
               <table class="table table-hover table-bordered table-condensed">
                  <tr>
                  <th style="width: 10%; white-space: nowrap;">기간</th>
                  <th>2018.1월</th>
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
                <td>분류</td>
                <td colspan="12">
                  <div id="annual_bar" style="min-height: 300px; width:100%; margin: 0 auto;"></div>
                </td>
                </tr>
                    <!-- ************************** 수입 시작 **************************-->
             <tr class="incometr">
             <th><button class="btn btn-xs btn-default"><i class="fa fa-bar-chart-o"></i></button>수입 합계</th>
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
             <tr>
             <td><button class="btn btn-xs btn-default"><i class="fa fa-bar-chart-o"></i></button>주수입<i class="fa fa-angle-down pull-right" data-toggle="collapse" data-target="#주수입" aria-controls="주수입"></i></td>
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
             </tr>
             <tr class="collapse" id="주수입">
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
             </tr>
             <tr class="collapse" id="주수입">
             <td><button class="btn btn-xs btn-default"><i class="fa fa-bar-chart-o"></i></button>상여</td>
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
             </tr>
            <tr class="collapse" id="주수입">
             <td><button class="btn btn-xs btn-default"><i class="fa fa-bar-chart-o"></i></button>사업소득</td>
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
             </tr>
            <tr class="collapse" id="주수입">
             <td><button class="btn btn-xs btn-default"><i class="fa fa-bar-chart-o"></i></button>기타</td>
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
             </tr>
             
             
             <tr>
             <td><button class="btn btn-xs btn-default"><i class="fa fa-bar-chart-o"></i>
             </button>부수입<i data-toggle="collapse" data-target="#부수입" aria-controls="부수입" class="fa fa-angle-down pull-right"></i></td>
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
             </tr>
             <tr class="collapse" id="부수입">
             <td><button class="btn btn-xs btn-default"><i class="fa fa-bar-chart-o"></i></button>이자/배당금</td>
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
             </tr>
             <tr class="collapse" id="부수입">
             <td><button class="btn btn-xs btn-default"><i class="fa fa-bar-chart-o"></i></button>기타</td>
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
             </tr>
             
             
             
             <!-- ************************** 지출 시작 **************************-->
             <tr class="expensetr">
             <th><button class="btn btn-xs btn-default"><i class="fa fa-bar-chart-o"></i></button>지출 합계</th>
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
             
             <tr>
            <td><button class="btn btn-xs btn-default"><i class="fa fa-bar-chart-o"></i></button>식비<i class="fa fa-angle-down pull-right"></i></td>
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
             </tr>
             <tr>
             <td><button class="btn btn-xs btn-default"><i class="fa fa-bar-chart-o"></i></button>주거/통신<i class="fa fa-angle-down pull-right"></i></td>
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
             </tr>
             <tr>
             <td><button class="btn btn-xs btn-default"><i class="fa fa-bar-chart-o"></i></button>생활용품<i class="fa fa-angle-down pull-right"></i></td>
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
             </tr>
             <tr>
             <td><button class="btn btn-xs btn-default"><i class="fa fa-bar-chart-o"></i></button>의복/미용<i class="fa fa-angle-down pull-right"></i></td>
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
             </tr>
             <tr>
             <td><button class="btn btn-xs btn-default"><i class="fa fa-bar-chart-o"></i></button>건강/문화<i class="fa fa-angle-down pull-right"></i></td>
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
             </tr>
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
    var mdata = [
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
	    
	  ],
	  config = {
	    	  // ID of the element in which to draw the chart.
	    	  element: 'annual_bar',
	    	  // Chart data records -- each entry in this array corresponds to a point on
	    	  
	    	  // the chart.
	    	  data: mdata,
	    	  // The name of the data record attribute that contains x-values.
	    	  xkey: 'month',
	    	  // A list of names of data record attributes that contain y-values.
	    	  ykeys: ['value'],
	    	  // Labels for the ykeys -- will be displayed when you hover over the
	    	  // chart.
	    	  labels: ['Value'],
	    	  //바 컬러
	    	  barColors: ['#4ECDC4', '#ac92ec'],
	    	  //바 width
	    	  barSizeRatio: 0.2,
	    	  resize: true
	    	}
    new Morris.Bar(config);
    
    
   $(".fa-angle-down").click(function(){
	   if($(this).hasClass("fa-angle-down")){
		   $(this).addClass("fa-angle-up");
		   $(this).removeClass("fa-angle-down"); 
	   } else if($(this).hasClass("fa-angle-up")){
		   $(this).addClass("fa-angle-down");
		   $(this).removeClass("fa-angle-up"); 
	   }
	  
   });

    	
    </script>