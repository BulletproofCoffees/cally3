<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <!-- 가계부 서브메뉴 인클루즈 -->
    <%@ include file="acbook_submenu.jspf" %>
    
    <style>
    
    
    .in-table {
    height: 22px;
    padding: 0px 5px;
    font-size: 1em;
    }
    
     .table  th:last-child, .table  th:first-child {
    text-align: center;
    }
     .table tr td:last-child,  .table tr td:first-child {
    text-align: center;
    }
    
    .moveday {
    cursor : pointer;
    }
    
    .moveday:hover {
    color: #ac92ec;
    }
    </style>
    
    
 <section id="main-content">
      <section class="wrapper">
        <h3><i class="fa fa-angle-right"></i> 하루 수입/지출 쓰기</h3>
        <!-- page start-->
        <div class="row mt">
        
          <aside class="col-lg-12 mt">
			<!-- 날짜 및 메모 패널 -->
			
			 <div class="showback text-center">
        			  <input type="hidden" name="year" value="${year}">
        			  <input type="hidden" name="month" value="${month}">
        			  <input type="hidden" name="day" value="${day}">
        			  <h2><span style="font-size: 0.7em;"><i class="fa fa-chevron-left moveday"></i></span>
        			  ${year}년 ${month}월 ${day}일
          <span style="font-size: 0.7em;"><i class="fa fa-chevron-right moveday"></i></span></h2>
        			  <hr style="margin-bottom: 10px;">
        			 <span class="badge bg-theme">수입합계</span> <fmt:formatNumber type="number" value="${sum_in}" />
        			   <span class="badge bg-theme02" style="margin-left: 5px;">지출합계</span> <fmt:formatNumber type="number" value="${sum_ex}" /><br>
        			   <div style="height:10px;"></div>
        			   
        			   <input type="hidden" name="memo_date" value="${memo_date}">
        			  <textarea rows="4" cols="60" name="memo_value">${memo_value}</textarea>
        			  <div>
        			  <button class="btn btn-theme btn-sm" id="memoin">메모 저장</button>
        			  <button class="btn btn-theme02 btn-sm" type="reset" onclick="tomemolist()">메모 목록</button>
        			  </div>
        			  
        			  
        			  
        			  </div>
			<!-- 오늘의 수입패널 -->
			
              <div class="showback">
              <h4><i class="fa fa-angle-right"></i> 오늘의 수입</h4>
<div style="max-height: 500px; overflow-y : scroll; margin-bottom: 10px;">
               <table class="table table-bordered table-hover table-striped table-condensed">
               <tr>    
			<th><input type="checkbox" class="allcheck"></th>
               <th>내역</th>
               <th>금액</th>
               <th>입금통장</th>
               <th colspan="2">분류</th>
               <th></th>
               </tr>
               
               
               <!-- 수입 내역출력 -->
               <c:forEach items="${inlist}" var="list">
               <tr>
               <td>
               <input type="checkbox" name="det_code" value="${list.DET_CODE}">
               </td>
               <td>${list.DET_CONTENT}</td>
               <td class="numeric">
               <fmt:formatNumber type="number" value="${list.DET_MONEY}" />
               </td>
               <td>
               <c:choose>
               <c:when test="${list.ACCPROP_CODE < 3}">
               <span class="label label-mini label-info">현금</span>
               </c:when>
               <c:when test="${list.ACCPROP_CODE > 2 && list.ACCPROP_CODE < 8}">
               <span class="label label-mini label-warning">투자</span>
               </c:when>
               <c:when test="${list.ACCPROP_CODE > 7 && list.ACCPROP_CODE < 11}">
               <span class="label label-mini label-success">기타자산</span>
               </c:when>
               <c:when test="${list.ACCPROP_CODE == 11}">
               <span class="label label-mini label-danger">부채</span>
               </c:when>
               <c:when test="${list.ACCPROP_CODE == 12}">
               <span class="label label-mini label-primary">기타부채</span>
               </c:when>
               </c:choose>
               ${list.ACC_NAME}</td>
               <td colspan="2">${list.CATE_NAME}>${list.SUB_NAME}</td>
               <td></td>
               </tr>
               </c:forEach>
               
               <!-- 내역 없을때 -->
               <c:if test="${empty inlist}">
               <tr>
               <td colspan="7">수입 내역이 없습니다.</td>
               </tr>
               </c:if>
               
               <!-- ****************** 수입 입력줄 ****************-->
                <tr>
            
               <td><i class="fa fa-plus"></i>
               <input type="hidden" name="det_date" value="${memo_date}">
               </td>
               <td>
               <input type="text" class="form-control in-table" name="det_content"></td>
               <td class="numeric"><input type="number" value="0" name="det_money" class="form-control in-table numeric">
</td>
               <td> <select class="form-control in-table" name="acc_code">
               <c:forEach items="${accolist}" var="acc">
               <option value="${acc.ACC_CODE}">${acc.ACC_NAME}</option>
               </c:forEach>
               </select>
</td>
               <td style="width: 150px;">
               <select class="form-control in-table cate_code" name="cate_code">
               <option value="1">주수입</option>
               <option value="2">부수입
               </option>
               </select></td>
               <td style="width: 150px;">
               <select class="form-control in-table" name="sub_code">
  
               </select></td>
               <td><button class="btn btn-success btn-xs inSubmit"><i class="fa fa-check"></i></button>
               </td>
               </tr>
               </table></div>
                         <button class="btn btn-sm delDetail">선택삭제</button>
                    
              </div>
			<!-- 오늘의 지출패널 -->
			<div class="showback">
			   <h4><i class="fa fa-angle-right"></i> 오늘의 지출</h4>
<div style="max-height: 500px; overflow-y : scroll; margin-bottom: 10px;">
               <table class="table table-bordered table-hover table-striped table-condensed">
               <tr>
              
               <th><input type="checkbox" class="allcheck"></th>
               <th>내역</th>
               <th>금액</th>
               <th>출금통장</th>
               <th>출금카드</th>
               <th colspan="2">분류</th>
               <th></th>
               </tr>
               
               
               <!-- 지출내역 출력 -->
               <c:forEach items="${exlist}" var="list">
               <tr>
               <td>
               <input type="checkbox" name="det_code" value="${list.DET_CODE}">
               </td>
               <td>${list.DET_CONTENT}</td>
               <td class="numeric">
               <fmt:formatNumber type="number" value="${list.DET_MONEY}" />
               </td>
               <td>
               <c:choose>
               <c:when test="${list.ACCPROP_CODE < 3}">
               <span class="label label-mini label-info">현금</span>
               </c:when>
               <c:when test="${list.ACCPROP_CODE > 2 && list.ACCPROP_CODE < 8}">
               <span class="label label-mini label-warning">투자</span>
               </c:when>
               <c:when test="${list.ACCPROP_CODE > 7 && list.ACCPROP_CODE < 11}">
               <span class="label label-mini label-success">기타자산</span>
               </c:when>
               <c:when test="${list.ACCPROP_CODE == 11}">
               <span class="label label-mini label-danger">부채</span>
               </c:when>
               <c:when test="${list.ACCPROP_CODE == 12}">
               <span class="label label-mini label-primary">기타부채</span>
               </c:when>
               </c:choose>
               ${list.ACC_NAME}</td>
               <td>${list.CARD_NAME}</td>
               <td colspan="2">${list.CATE_NAME}>${list.SUB_NAME}</td>
               <td></td>
               </tr>
               </c:forEach>
               
                     <!-- 내역 없을때 -->
               <c:if test="${empty exlist}">
               <tr>
               <td colspan="8">지출 내역이 없습니다.</td>
               </tr>
               </c:if>
               
               <!-- ****************** 지출 입력줄 ****************-->
               
                <tr>
               
               <td><i class="fa fa-plus"></i>
                <input type="hidden" name="det_date" value="${memo_date}">
                </td>
                <td>
               <input type="text" class="form-control in-table excontent" name="det_content"></td>
               <td><input type="number" value="0" name="det_money" class="form-control in-table numeric exmoney">
</td>
               <td> <select class="form-control in-table exacc" name="acc_code">
               <option value="0">없음</option>
              <c:forEach items="${accolist}" var="acc">
              <option value="${acc.ACC_CODE}">${acc.ACC_NAME}</option>
              </c:forEach>
               </select>
			</td>

				<td><select class="form-control in-table excard" name="card_code">
				<option value="0">없음</option>
				 <c:forEach items="${cardlist}" var="card">
              <option value="${card.CARD_CODE}">${card.CARD_NAME}</option>
              </c:forEach>
				</select>
				</td>

               <td style="width: 150px;"><select class="form-control in-table cate_code excate" name="cate_code">
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
               <option value="13">이체/대체</option>
               <option value="14">카드대금</option>
               </select></td>
               
               <td  style="width: 150px;">
               <select class="form-control in-table exsub" id="sub_code" name="sub_code">      
               </select></td>
               <td><button class="btn btn-success btn-xs exSubmit"><i class="fa fa-check"></i></button>
               </td>
               </tr>
               </table></div>
                              <button class="btn btn-sm delDetail">선택삭제</button>
                               <button id="cardCharge" class="btn btn-sm " data-toggle="popover" data-trigger="hover" title="카드정산" data-content="새 입력줄에서 카드대금-신용카드를 선택한 후 카드정산 버튼을 누르면 해당 카드의 미납분이 계산되어 입력됩니다.">카드정산 <i class="fa fa-question-circle"></i></button>
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
    		var cate1 = $("select[name='cate_code']").eq(0);
    		var cate2 = $("select[name='cate_code']").eq(1);
    		cate_ajax(1, $(cate1));
        	cate_ajax(3, $(cate2));
        	
        	 $('[data-toggle="popover"]').popover();   
        });
    function tomemolist(){
    	window.location.href = "/cally/acbook/memolist";
    }
   $("#memoin").click(function(){
	   var memo_date = $("input[name='memo_date']").val();
	   var memo_value = $("textarea[name='memo_value']").val();
	   $.ajax({
		   type : 'GET',
	    	 url : '/cally/acbook/memo_in', 
	    	 data : {
	    		 'memo_date' : memo_date,
	    		 'memo_value' : memo_value
	    	 }
	   });
	   
   });
    
    $(".moveday").click(function(){
    	var now = $("input[name='memo_date']").val();
    	var year = $("input[name='year']").val();
    	var month = $("input[name='month']").val();
    	var day = $("input[name='day']").val();
    	
    	var moveday = new Date(year,month-1,day);
    	//threeDaysAgo.setDate(threeDaysAgo.getDate() - 3); 
    	// 2014-02-26 => 3일전으로~
    	var plus = 0;
    	if($(this).hasClass("fa-chevron-left")){
    		//하루 전으로 이동한다.
    		plus = -1;
    	} else if($(this).hasClass("fa-chevron-right")) {
    		//하루 후로 이동한다.
    		plus = 1;
    	}
    	moveday.setDate(moveday.getDate() + plus);
    	year = moveday.getFullYear();
    	month = moveday.getMonth() + 1;
    	day = moveday.getDate();

    	$(location).attr("href",getContextPath()+"/acbook/dailypage?year=" + year +"&month=" + month + "&day=" + day);
    
    });
    </script>