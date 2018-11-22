<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <!-- 가계부 서브메뉴 인클루즈 -->
    <%@ include file="acbook_submenu.jspf" %>
    
    <style>

    .form-control {
    height: 18px;
    padding: 0px 5px;
    font-size: 1em;
    border: 0px;
    background-color: rgba(0,0,0,0);
    box-shadow: inset 0 0px 0px rgba(0,0,0,0);
    }
    
    .budgettd {
    background-color: rgba(78,205,196,0.15);
    }
    
    table th {
    background-color: #f9f9f9;
    text-align: center;
    }
    
    table tr:last-child {
    font-weight: 900;
    font-size: 1.2em;
    }
    
    table tr:first-child:hover {
    background-color: #fff !important;
    }
    

    
    </style>
    
    
 <section id="main-content">
      <section class="wrapper">
        <h3><i class="fa fa-angle-right"></i> 예산 쓰기</h3>
        <!-- page start-->
        <div class="row mt">
        <aside class="col-lg-6 mt">
            <section class="panel">
              <div class="panel-body">
              <!--******************** 지난 예산 테이블 ********************-->
               <table class="table table-hover table-bordered table-condensed" id="viewtable">
               <tr>
               <td style="height: 80px; text-align: center;">비교용</td>
               <td colspan="3">
               <h3 class="centered"><i class="fa fa-chevron-left movemonth"></i>
               <span class="datespan1">2018년 9월</span>
               <i class="fa fa-chevron-right movemonth"></i></h3>
               <input type="hidden" value="${last}" name="last">
               </td>
               </tr>
               <tr>
               
               <th style="width: 16%;">분류</th>
               <th style="width: 28%;">예산</th>
               <th style="width: 28%;">지출</th>
               <th style="width: 28%;">남은돈</th>
               </tr>       
               


               <c:forEach var="list" items="${left_list}">
               <tr>
               <td>${list.CATE_NAME}</td>
               <td class="numeric"><fmt:formatNumber value="${list.BUDGET_VALUE}" /></td>
               <td class="numeric"><fmt:formatNumber value="${list.DET_MONEY}" /></td>
                <c:choose>
               <c:when test="${list.BUDGET_VALUE - list.DET_MONEY < 0}">
                <td class="numeric c-danger"><fmt:formatNumber value="${list.BUDGET_VALUE - list.DET_MONEY}" /></td>
               </c:when>
               <c:otherwise>
                <td class="numeric"><fmt:formatNumber value="${list.BUDGET_VALUE - list.DET_MONEY}" /></td>
               </c:otherwise>
               </c:choose>
               </tr>
               </c:forEach>
               
               <tr>
               <th>합계</th>
               <th class="numeric">0</th>
               <th class="numeric">0</th>
               <th class="numeric">0</th>
               </tr>
               </table>
              </div>
            </section>
          </aside>
          <aside class="col-lg-6 mt">
            <section class="panel">
              <div class="panel-body">
              <!-- ********************작성할 예산 테이블******************** -->
              
              <form action="/cally/acbook/budget_in" id="budget_form" method="post">
               <table id="inputtable" class="table table-hover table-bordered table-condensed">
                 <tr>
               <td style="height: 80px; text-align: center;">작성용</td>
               <td colspan="3">
               <h3 class="centered"><i class="fa fa-chevron-left movemonth"></i>
               <span class="datespan2">2018년 11월</span>
               <i class="fa fa-chevron-right movemonth"></i></h3>
               <input type="hidden" value="${today}" name="today">
               </td>
               </tr>
               
               
               <tr>
              
               <th style="width: 16%;">분류</th>
               <th style="width: 28%;">예산</th>
               <th style="width: 28%;">지출</th>
               <th style="width: 28%;">남은돈</th>
               </tr>
               
               <!-- ****************** 입력줄 ****************-->
             
               <c:forEach var="list" items="${right_list}">
               <tr>
               <td>${list.CATE_NAME}</td>
               <td class="budgettd">
               <input type="number" name="budget_value" class="form-control numeric"
               min="0" value="${list.BUDGET_VALUE}">
               </td>
               <td class="numeric"><fmt:formatNumber value="${list.DET_MONEY}" /></td>
               <c:choose>
               <c:when test="${list.BUDGET_VALUE - list.DET_MONEY < 0}">
                <td class="numeric c-danger"><fmt:formatNumber value="${list.BUDGET_VALUE - list.DET_MONEY}" /></td>
               </c:when>
               <c:otherwise>
                <td class="numeric"><fmt:formatNumber value="${list.BUDGET_VALUE - list.DET_MONEY}" /></td>
               </c:otherwise>
               </c:choose>
              
               </tr>
               </c:forEach>
             
               
               <tr>
               <th>합계</th>
               <th class="numeric">0</th>
               <th class="numeric">0</th>
               <th class="numeric">0</th>
               </tr>
               </table>
               </form>
              </div>
            </section>
          </aside>
       <div class="text-center">
               <button class="btn btn-theme02" onclick="insertBudget()">저장하기</button>
               </div>
               
        </div>
        <!-- page end-->
      </section>
      <!-- /wrapper -->
    </section>
    <!-- /MAIN CONTENT -->
    
      <!-- 가계부 자바스크립트 인클루드 -->
    <%@ include file="acbook_js.jspf" %>
    <script>
    $("#ac_sub_3").addClass("active");
    
    $(document).ready(function(){
    	var last = $("input[name='last']").val().split("/");
    	$(".datespan1").text(last[0] + "년 " + last[1] + "월");
    	
    	var today = $("input[name='today']").val().split("/");
    	$(".datespan2").text(today[0] + "년 " + today[1] + "월");
    	
    	getBudgetSum1();
    	getBudgetSum2();
    	
    });
   
   
   $(".movemonth").click(function(){
	   //화살표를 눌러 달을 움직인다.
		var dateinput = $(this).parent().next();
    	movemonth($(this), $(dateinput));
	    
		var last = $("input[name='last']").val();
		var today = $("input[name='today']").val();
		$(location).attr("href",
				getContextPath()+"/acbook/budget?last=" 
						+ last +"&today=" + today);
   });
    
    function insertBudget(){
    	var form = $("#budget_form");
    	var to_url = form.attr("action");
    	$.ajax({
    		type : form.attr("method"),
    		url : to_url,
    		data : form.serialize()
    	});
    	alert("예산이 등록되었습니다.");
    	window.location.reload();
    }
    
    $("input[name='budget_value']").bind('keyup mouseup', function () {
    	getBudgetSum2();
    });
    
    function getBudgetSum1(){
    	var rowCnt = 0;
		var budgetsum = 0;
		var expensesum = 0;
    	$("#viewtable tbody tr").each(function(){
    		if( rowCnt > 1 && rowCnt < 12){
    			var td = $(this).children("td");
    			$(td).each(function(){
    				var idx = $(this).index();
    				
    				if( idx == 1 ){
    					var val = uncommas($(this).text());
    					budgetsum += parseInt(val); 
    				}else if(idx == 2){
    					var val = uncommas($(this).text());
    					expensesum += parseInt(val);
    				}  		});
    		} else if (rowCnt == 12){
    			var th = $(this).children("th");
    			$(th).each(function(){
    				var idx = $(this).index();
    				if (idx == 1){
    					$(this).text(commas(budgetsum));
    					
    				}else if(idx == 2){
    					$(this).text(commas(expensesum));
    				}else if(idx == 3){
    					$(this).text(commas(budgetsum - expensesum));
    					if(budgetsum - expensesum < 0){
    						$(this).addClass("c-danger");
    					}
    				}
    			});
    		}
    		rowCnt ++;
    	});    
    	
    }
    
    function getBudgetSum2(){
    	var rowCnt = 0; // 행 카운트
		var budgetsum = 0; // 예산 합
		var expensesum = 0; // 지출 합
    	$("#inputtable tbody tr").each(function(){
    		if( rowCnt > 1 && rowCnt < 12){
    			var td = $(this).children("td");
    			$(td).each(function(){
    				var idx = $(this).index();
    				if( idx == 1 ){
    					var val = $(this).find("input[name='budget_value']").val();
    					budgetsum += parseInt(val); 
    				} else if(idx == 2){
    					var val = uncommas($(this).text());
    					expensesum += parseInt(val);
    				}  		});
    		} else if (rowCnt == 12){
    			var td = $(this).children("th");
    			$(td).each(function(){
    				var idx = $(this).index();
    				if (idx == 1){
    					$(this).text(commas(budgetsum));
    					
    				}else if(idx == 2){
    					$(this).text(commas(expensesum));
    				}else if(idx == 3){
    					$(this).text(commas(budgetsum - expensesum));
    					if(budgetsum - expensesum < 0 ){
    						$(this).addClass("c-danger");
    					}
    				}
    			});
    		}
    		rowCnt ++;
    	});    
    	
    }
    
   
    
    </script>