<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <!-- 가계부 서브메뉴 인클루즈 -->
    <%@ include file="acbook_submenu.jspf" %>
    
    <style>
    span {
    margin-right: 3px;}

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
    .numeric {
    text-align: right;
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
              <!-- 지난 예산 테이블 -->
               <table class="table table-hover table-bordered table-condensed viewtable">
               <tr>
               <td style="height: 80px;"></td>
               <td colspan="3">
               <h3 class="centered"><i class="fa fa-angle-left c-theme02"></i>
               <span class="datespan1">2018년 9월</span>
               <i class="fa fa-angle-right c-theme02"></i></h3>
               <input type="hidden" value="${last}" name="last">
               </td>
               </tr>
               <tr>
               
               <th style="width: 16%;">분류</th>
               <th style="width: 28%;">예산</th>
               <th style="width: 28%;">지출</th>
               <th style="width: 28%;">남은돈</th>
               </tr>       
               
                <c:if test="${not empty emptytable1}">
               <c:forEach items="${emptytable1}" var="emp" varStatus="status">
               <tr>
               <td> <c:out value="${emp}" /></td>
               <td class="numeric lastbd">0</td>
               <td class="numeric">0</td>
               <td class="numeric">0</td>
               </tr>
               </c:forEach>
               </c:if>
               
               
               <c:if test="${not empty lasttable}">
               <c:forEach var="b" items="${lasttable}">
               <tr>
               <td>${b.cate_name}</td>
               <td class="numeric">${b.budget_value}</td>
               <td class="numeric">0</td>
               <td class="numeric">0</td>
               </tr>
               </c:forEach>
               </c:if>
               
               <tr>
               <th>합계</th>
               <th class="numeric last_sumbd">0</th>
               <th class="numeric last_sumex">0</th>
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
               <table class="table table-hover table-bordered table-condensed inputtable">
                 <tr>
               <td style="height: 80px;"></td>
               <td colspan="3">
               <h3 class="centered"><i class="fa fa-angle-left c-theme02"></i>
               <span class="datespan2">2018년 11월</span>
               <i class="fa fa-angle-right c-theme02"></i></h3>
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
               <c:if test="${not empty emptytable2}">
               <c:forEach items="${emptytable2}" var="emp" varStatus="status">
               <tr>
               <td> <c:out value="${emp}" /></td>
               <td class="numeric budgettd"><input type="number" name="budget_value" class="form-control numeric" min="0" value="0"></td>
               <td class="numeric">0</td>
               <td class="numeric">0</td>
               </tr>
               </c:forEach>
               </c:if>
               
               <c:if test="${not empty inputtable}">
               <c:forEach var="b" items="${inputtable}">
               <tr>
               <td>${b.cate_name}</td>
               <td class="numeric budgettd">
               <input type="number" name="budget_value" class="form-control numeric"
               min="0" value="${b.budget_value}">
               </td>
               <td class="numeric">0</td>
               <td class="numeric">0</td>
               </tr>
               </c:forEach>
               </c:if>
               
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
    $(document).ready(function(){
    	var last = $("input[name='last']").val().split("/");
    	$(".datespan1").text(last[0] + "년 " + last[1] + "월");
    	
    	var today = $("input[name='today']").val().split("/");
    	$(".datespan2").text(today[0] + "년 " + today[1] + "월");
    	
    	/* 지난 예산테이블의 예산총합 구하기 */
    	/* var lastbd = $(".lastbd");
    	var sum = 0;
    	for(var i=0; i < lastbd.length; i++){
    		alert(lastbd[i].text());
    	} */
    	
    });
    
    $("input[name='budget_value']").blur(function(){
    	if( $(this).val() == ""){
    		$(this).val(0);
    	}
    	
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
    }
    /* $(".budgettd").change(function(){
    	
    });
    
    function viewAjax(){
    	$.ajax({
    		url : '',
    		type : 'post',
    		date : {
    			
    		},
    		success : function(){
    			
    		}
    	});
    } */
    </script>