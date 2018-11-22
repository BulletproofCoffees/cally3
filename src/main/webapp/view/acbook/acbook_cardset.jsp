<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <!-- 가계부 서브메뉴 인클루즈 -->
    <%@ include file="acbook_submenu.jspf" %>
    
    <style>
    
    table {
    text-align: center;
    }
    
    table th {
    background-color: #f9f9f9;
     text-align: center;
    }
    
    .cardtable td:last-child, .cardtable th:last-child {
    text-align: center;
    width: 8%;
    }
   tr.newtr {
   	display: none;
   	}
   	
   	.in-table {
   	    height: 18px;
   	    
   	    }
    </style>
    
    
 <section id="main-content">
      <section class="wrapper">
        <h3><i class="fa fa-angle-right"></i> 카드 관리</h3>
        <!-- page start-->
        <div class="row mt">

          <aside class="col-lg-12 mt">
            <section class="panel">
              <div class="panel-body">
                   <button class="btn btn-theme03 btn-xs pull-right newcard" style="margin-bottom: 5px;"><i class="fa fa-plus"></i> 새 카드 추가</button>
               <table class="table table-hover table-bordered table-condensed cardtable">
              <tr>
              <th>카드사</th>
              <th colspan="2">카드명</th>
              <th>연계계좌</th>
              <th>이용기간</th>
              <th>사용함</th>
              <th>수정/삭제</th>
              </tr>
              
              <c:forEach items="${cardlist}" var="list">
              <tr>
              <td>
              <select name="cardcom_code" class="form-control in-table">
              <c:forEach items="${cardcomlist}" var="com">
              <c:choose>
              <c:when test="${com.CARDCOM_CODE == list.CARDCOM_CODE}">
              <option value="${com.CARDCOM_CODE}" selected>${com.CARDCOM_NAME}</option>
              </c:when>
              <c:otherwise>
              <option value="${com.CARDCOM_CODE}">${com.CARDCOM_NAME}</option>
              </c:otherwise>
              </c:choose>
              </c:forEach>
              </select>
              </td>
              <td>
              <input type="text" name="card_name" class="form-control in-table" value="${list.CARD_NAME}">
              <input type="hidden" name="card_code" value="${list.CARD_CODE}">
              </td>

              <c:choose>
              <c:when test="${list.CHECK_YN == 'y '}">
              <td>체크카드</td>
              <td>
              <select name="acc_code" class="form-control in-table">
              <c:forEach items="${accolist}" var="acc">
              <c:choose>
              <c:when test="${list.ACC_CODE == acc.ACC_CODE}">
              <option value="${acc.ACC_CODE}" selected>${acc.ACC_NAME}</option>
              </c:when>
              <c:otherwise>
              <option value="${acc.ACC_CODE}">${acc.ACC_NAME}</option>
              </c:otherwise>
              </c:choose>
              </c:forEach>
              </select>
              </td>
              </c:when>
              <c:otherwise>
              <td>신용카드</td>
              <td>-</td>
              </c:otherwise>
              </c:choose>
				<td>
				 <select name="card_day" class="form-control in-table">
				 <c:choose>
				 <c:when test="${list.CARD_DAY == 1}">
				 <option value="1" selected>전월 1일 ~ 전월 말일까지</option>
				 </c:when>
				 <c:otherwise>
              <option value="1">전월 1일 ~ 전월 말일까지</option>
              </c:otherwise>
              </c:choose>
              <c:forEach begin="2" end="27" var="i">
              <c:choose>
              <c:when test="${list.CARD_DAY == i}">
             	 <option value="${i}" selected>전전월 ${i}일 ~ 전월 ${i-1}일까지</option>
              </c:when>
              <c:otherwise>
              <option value="${i}">전전월 ${i}일 ~ 전월 ${i-1}일까지</option>
              </c:otherwise>
              </c:choose>
              </c:forEach>
              </select>
				
				</td>
              <td>
              <c:choose>
              <c:when test="${list.CARD_USEYN == 'y '}">
              <input type="checkbox" name="card_useyn" value="y" checked>
              </c:when>
              <c:otherwise>
              <input type="checkbox" name="card_useyn" value="y">
              </c:otherwise>
              </c:choose>
              </td>
              
               <td>
               <button class="btn btn-info btn-xs rowUpdate"><i class="fa fa-pencil"></i></button>
               <button class="btn btn-danger btn-xs rowDelete"><i class="fa fa-trash-o "></i></button></td>
              </tr>
              </c:forEach>
             
             <!--******************** 입력줄 ******************** --> 
              <tr class="newtr">
              <td>
             <select name="cardcom_code" class="form-control in-table">
              <c:forEach items="${cardcomlist}" var="com">
              <option value="${com.CARDCOM_CODE}">${com.CARDCOM_NAME}</option>
              </c:forEach>
              </select>
              </td>
              <td><input type="text" name="card_name" class="form-control in-table" value=""></td>
             <td>
             <input type="checkbox" name="check_yn" checked>체크카드
             </td>
              <td>
              <select name="acc_code" class="form-control in-table">
              <c:forEach items="${accolist}" var="acc">
              <option value="${acc.ACC_CODE}">${acc.ACC_NAME}</option>
              </c:forEach>
              </select>
              </td>
              <td>
              <select name="card_day" class="form-control in-table">
              <option value="1">전월 1일 ~ 전월 말일까지</option>
              <c:forEach begin="2" end="27" var="i">
              <option value="${i}">전전월 ${i}일 ~ 전월 ${i-1}일까지</option>
              </c:forEach>
              </select>
              </td>
              <td><input type="checkbox" name="card_useyn" value="y" checked=""/></td>
              <td><button class="btn btn-success btn-xs rowSubmit"><i class="fa fa-check "></i></button></td>
              </tr>
              
              
               </table>
               
-체크카드를 삭제하면 기존 지출내역은 연계통장으로 변경됩니다.<br>
-신용카드를 삭제하면 기존 지출내역은 지갑속현금으로 변경되며 카드대금 지불내역은 삭제됩니다.
이는 많은 통장 잔액을 바꾸므로 <span class="c-theme02"><strong>삭제보다 사용안함 설정을 권장</strong></span>합니다.<br>
             
              </div>
            </section>
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
     $("#ac_sub_4").addClass("active");
     $("#ac_sub_cardset").addClass("active");
     
    $(".newcard").click(function(){
    	if($(".newtr").css("display") == 'none'){
    		$(this).removeClass("btn-theme03");
    		$(this).addClass("btn-theme04");
    		$(this).html('<i class="fa fa-minus"></i> 새 카드 추가');
    	} else {
    		$(this).addClass("btn-theme03");
    		$(this).removeClass("btn-theme04");
    		$(this).html('<i class="fa fa-plus"></i> 새 카드 추가');
    	}
    	$(".newtr").toggle();
    });
    
    $("input[name='check_yn']").change(function(){
    	//체크가 풀리면 연계계좌 disalbe
    	//체크가 되면 연계계좌 할수있게
    	var accsel = $(this).closest('tr').find('select[name="acc_code"]');
    	if($(this).is(":checked")){
    		$(accsel).prop('disabled', false);
    	} else {
    		$(accsel).prop('disabled', true);
    	}
    	
    
    });
    
    $(".rowSubmit").click(function(){
    	var card_name = $(this).closest('tr').find("input[name='card_name']").val();
    	if(card_name == ""){
    		alert("카드 이름을 입력하세요.");
    		return false;
    	}
    	var serialized = rowSubmit($(this));
    	  $.ajax({
		    	 headers: { 
		            Accept : "text/plain; charset=utf-8"
		        },
		    	 type : 'POST',
		    	 url : '/cally/acbook/card_in', 
		    	 data : serialized,
		    	 success : function(data){
		    		 alert(data);
		    		 window.location.reload();
		    	 }
		     });
    });
    
    $(".rowUpdate").click(function(){
    	var serialized = rowSubmit($(this));
    	$.ajax({
	    	 type : 'POST',
	    	 url : '/cally/acbook/card_up', 
	    	 data : serialized,
	    		success : function(data){
		    		 alert(data);
		    		 window.location.reload();
	    		}
	     });
    });
    
    $(".rowDelete").click(function(){
    	if(!confirm('정말 카드를 삭제하시겠습니까?')){
    		return false;
    	} else {
    	var serialized = rowSubmit($(this));
    	$.ajax({
	    	 type : 'POST',
	    	 url : '/cally/acbook/card_del', 
	    	 data : serialized,
	    		success : function(data){
		    		 alert(data);
		    		 window.location.reload();
	    		}
	     });
    	}
    });
    </script>