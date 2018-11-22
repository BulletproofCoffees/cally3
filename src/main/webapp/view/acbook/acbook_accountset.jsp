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
    
    .subcategory td:last-child, .subcategory th:last-child {
    text-align: center;
    width: 20%;
    }
   
   	tr.newtr {
   	display: none;
   	}
    </style>
    
    
 <section id="main-content">
      <section class="wrapper">
        <h3><i class="fa fa-angle-right"></i> 통장 관리</h3>
        
        <!-- page start-->
        <div class="row mt">

          <aside class="col-lg-12 mt">
            <section class="panel">
              <div class="panel-body">
                    <button class="btn btn-theme03 btn-xs pull-right newacco" style="margin-bottom: 5px;"><i class="fa fa-plus"></i> 새 통장 추가</button>
               <table class="table table-hover table-bordered table-condensed accotable">
              <tr>
              <th>통장명</th>
              <th>자산속성</th>
              <th>생성 날짜</th>
              <th>사용함</th>
              <th>수정/삭제</th>
              </tr>
              
              <c:forEach items="${accolist}" var="acc">
              	<tr>
              	<td>
              	<input type="hidden" name="acc_code" value="${acc.ACC_CODE}">
              	<input type="text" name="acc_name" class="form-control in-table" value="${acc.ACC_NAME}"></td>
    			<td>
    	
    			<select name="accprop_code" class="form-control in-table">
    
    			<c:choose>
    			<c:when test="${acc.ACCPROP_CODE == 1}">
    			<option value="1" selected>현금</option>
    			</c:when>
    			<c:otherwise>
    			<option value="1">현금</option>
    			</c:otherwise>
    			</c:choose>
    			
    			<c:choose>
    			<c:when test="${acc.ACCPROP_CODE == 2}">
    			<option value="2" selected>자유입출금</option>
    			</c:when>
    			<c:otherwise>
    			<option value="2">자유입출금</option>
    			</c:otherwise>
    			</c:choose>
    			
    			<c:choose>
    			<c:when test="${acc.ACCPROP_CODE == 3}">
    			<option value="3" selected>예금</option>
    			</c:when>
    			<c:otherwise>
    			<option value="3">예금</option>
    			</c:otherwise>
    			</c:choose>
    			
    			<c:choose>
    			<c:when test="${acc.ACCPROP_CODE == 4}">
    			<option value="4" selected>적금</option>
    			</c:when>
    			<c:otherwise>
    			<option value="4">적금</option>
    			</c:otherwise>
    			</c:choose>
    			
    			<c:choose>
    			<c:when test="${acc.ACCPROP_CODE == 5}">
    			<option value="5" selected>주식</option>
    			</c:when>
    			<c:otherwise>
    			<option value="5">주식</option>
    			</c:otherwise>
    			</c:choose>
    			
    			<c:choose>
    			<c:when test="${acc.ACCPROP_CODE == 6}">
    			<option value="6" selected>펀드</option>
    			</c:when>
    			<c:otherwise>
    			<option value="6">펀드</option>
    			</c:otherwise>
    			</c:choose>
    			
    			<c:choose>
    			<c:when test="${acc.ACCPROP_CODE == 7}">
    			<option value="7" selected>보험</option>
    			</c:when>
    			<c:otherwise>
    			<option value="7">보험</option>
    			</c:otherwise>
    			</c:choose>
    			
    			<c:choose>
    			<c:when test="${acc.ACCPROP_CODE == 8}">
    			<option value="8" selected>부동산</option>
    			</c:when>
    			<c:otherwise>
    			<option value="8">부동산</option>
    			</c:otherwise>
    			</c:choose>
    			
    			<c:choose>
    			<c:when test="${acc.ACCPROP_CODE == 9}">
    			<option value="9" selected>금</option>
    			</c:when>
    			<c:otherwise>
    			<option value="9">금</option>
    			</c:otherwise>
    			</c:choose>
    			
    			<c:choose>
    			<c:when test="${acc.ACCPROP_CODE == 10}">
    			<option value="10" selected>기타자산</option>
    			</c:when>
    			<c:otherwise>
    			<option value="10">기타자산</option>
    			</c:otherwise>
    			</c:choose>
    			
    			<c:choose>
    			<c:when test="${acc.ACCPROP_CODE == 11}">
    			<option value="11" selected>부채</option>
    			</c:when>
    			<c:otherwise>
    			<option value="11">부채</option>
    			</c:otherwise>
    			</c:choose>
    			
    			<c:choose>
    			<c:when test="${acc.ACCPROP_CODE == 12}">
    			<option value="12" selected>기타부채</option>
    			</c:when>
    			<c:otherwise>
    			<option value="12">기타부채</option>
    			</c:otherwise>
    			</c:choose>
    			</select>
    			
    			
    			
    			<td><input class="form-control form-control-inline input-medium default-date-picker in-table" name="acc_credate" type="text" value="${acc.ACC_CREDATE}"></td>
    			<td>
    			<c:choose>
    			<c:when test="${acc.ACC_USEYN == 'y '}">
    			    			<input type="checkbox" name="acc_useyn" value="y" checked>
    			</c:when>
    			<c:otherwise>
    			    			<input type="checkbox" name="acc_useyn" value="y">
    			</c:otherwise>
    			</c:choose>

    			</td>
    			<c:choose>
    			<c:when test="${acc.ACC_NAME == '지갑속현금'}">
    			<td></td>
    			</c:when>
    			<c:otherwise>
    			<td><button class="btn btn-info btn-xs rowUpdate"><i class="fa fa-pencil"></i></button>
    			<button class="btn btn-danger btn-xs rowDelete"><i class="fa fa-trash-o "></i></button>
    			</td>
    			</c:otherwise>
    			</c:choose>
    			
    			</tr>
              </c:forEach>
              
              <tr class="newtr">
              <td><input type="text" name="acc_name" class="form-control"></td>
    			<td><select name="accprop_code" class="form-control">
    			<option value="1">현금</option>
    			<option value="2">자유입출금</option>
    			<option value="3">예금</option>
    			<option value="4">적금</option>
    			<option value="5">주식</option>
    			<option value="6">펀드</option>
    			<option value="7">보험</option>
    			<option value="8">부동산</option>
    			<option value="9">금</option>
    			<option value="10">기타자산</option>
    			<option value="11">부채</option>
    			<option value="12">기타부채</option>
    			</select></td>
    			
    			<td><input name="acc_credate" class="form-control form-control-inline input-medium default-date-picker" type="text" value=""></td>
    			<td><input type="checkbox" name="acc_useyn" value="y"></td>
    			<td><button class="btn btn-success btn-xs rowSubmit"><i class="fa fa-check "></i></button></td>
    			</tr>
              
               </table>
                -지갑속현금 통장은 기본현금통장으로 수정/삭제 할 수 없습니다.<br>
                -통장 삭제 시 기존 내역은 모두 지갑속현금 통장으로 이동됩니다. <span class="c-theme02"><strong>삭제보다 사용안함 설정을 권장합니다.</strong></span>
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
    $("#ac_sub_accountset").addClass("active");
    
    $(".newacco").click(function(){
    	if($(".newtr").css("display") == 'none'){
    		$(this).removeClass("btn-theme03");
    		$(this).addClass("btn-theme04");
    		$(this).html('<i class="fa fa-minus"></i> 새 통장 추가');
    	} else {
    		$(this).addClass("btn-theme03");
    		$(this).removeClass("btn-theme04");
    		$(this).html('<i class="fa fa-plus"></i> 새 통장 추가');
    	}
    	$(".newtr").toggle();
    });
    
    $(".rowSubmit").click(function(){
    	var serialized = rowSubmit($(this));
    	
    	  $.ajax({
		    	 headers: { 
		            Accept : "text/plain; charset=utf-8"
		        },
		    	 type : 'POST',
		    	 url : '/cally/acbook/account_in', 
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
	    	 url : '/cally/acbook/account_up', 
	    	 data : serialized,
	    		success : function(data){
		    		 alert(data);
		    		 window.location.reload();
	    		}
	     });
    });
    
    $(".rowDelete").click(function(){
    	if(!confirm('정말 통장을 삭제하시겠습니까?')){
    		return false;
    	} else {
    	var serialized = rowSubmit($(this));
    	$.ajax({
	    	 type : 'POST',
	    	 url : '/cally/acbook/account_del', 
	    	 data : serialized,
	    		success : function(data){
		    		 alert(data);
		    		 window.location.reload();
	    		}
	     });
    	}
    });
    
    </script>