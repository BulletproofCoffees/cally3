<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <!-- 가계부 서브메뉴 인클루즈 -->
    <%@ include file="acbook_submenu.jspf" %>
    
    <style>
    
    table th {
    background-color: #f9f9f9;
    text-align: center;
    }
    
    .subcategory td:last-child, .subcategory th:last-child {
    width: 20%;
    }
    
    #catetable td {
    cursor: pointer;
    }
   
    </style>
    
    
 <section id="main-content">
      <section class="wrapper">
        <h3><i class="fa fa-angle-right"></i> 분류 관리</h3>
        <!-- page start-->
        <div class="row mt">
        
          <aside class="col-lg-3 mt"></aside>
        
        
          
        
          <aside class="col-lg-2 mt">
            <section class="panel">
              <div class="panel-body">
              <!-- 대분류 테이블 -->
            
               <table id="catetable" class="table table-hover table-bordered centered table-condensed">
               <tr>
               <th>수입 대분류</th>
               </tr>       
               <tr><td onclick="location.href='?cate_code=1'">주수입</td></tr>
               <tr><td onclick="location.href='?cate_code=2'">부수입</td></tr>
               
                 <tr><th>지출 대분류</th></tr>
               
               <tr><td onclick="location.href='?cate_code=3'">식비</td></tr>
               <tr><td onclick="location.href='?cate_code=4'">주거/통신</td></tr>
               <tr><td onclick="location.href='?cate_code=5'">생활용품</td></tr>
               <tr><td onclick="location.href='?cate_code=6'">의복/미용</td></tr>
               <tr><td onclick="location.href='?cate_code=7'">건강/문화</td></tr>
               <tr><td onclick="location.href='?cate_code=8'">교육/육아</td></tr>
               <tr><td onclick="location.href='?cate_code=9'">교통/차량</td></tr>
               <tr><td onclick="location.href='?cate_code=10'">경조사/회비</td></tr>
               <tr><td onclick="location.href='?cate_code=11'">세금/이자</td></tr>
               <tr><td onclick="location.href='?cate_code=12'">용돈/기타</td></tr>
               <tr><td onclick="location.href='?cate_code=13'">이체/대체</td></tr>             
               <tr><td onclick="location.href='?cate_code=14'">카드대금</td></tr>
               </table>
               
              </div>
            </section>
          </aside>
          
            <aside class="col-lg-4 mt">
            <section class="panel">
              <div class="panel-body">
              <!-- 소분류 테이블 -->
               <table class="subcategory table table-hover table-bordered table-condensed centered">
               <tr>
               <th colspan="2">선택한 대분류</th>
               </tr>
               <tr>
               <td colspan="2">${cate_name}</td>
               </tr>
               
               <tr>
               <th>소분류</th><th>수정/삭제/추가</th>
               </tr>
               <c:choose>
               
               <c:when test="${cate_code > 12}">
               <c:forEach items="${userlist}" var="list">
               <tr>
               <td>${list.sub_name}</td>
               <td></td>
               </tr>
               </c:forEach>
               </c:when>
               <c:otherwise>
               <c:forEach items="${basiclist}" var="list">
               <tr>
               <td>${list.sub_name}</td>
               <td></td>
               </tr>
               </c:forEach>
               <c:forEach items="${userlist}" var="list">
               <tr>
               <td><input type="hidden" name="cate_code" value="${cate_code}"><input type="hidden" name="sub_code" value="${list.sub_code}"><input type="text" name="sub_name" value="${list.sub_name}" class="form-control in-table centered"></td>
               <td><button class="btn btn-info btn-xs rowUpdate"><i class="fa fa-pencil"></i></button>
               <button class="btn btn-danger btn-xs rowDelete"><i class="fa fa-trash-o"></i></button></td>
               </tr>
               </c:forEach>  
               
               <!-- ===============새로 추가하는 입력창=============== -->
               <tr><td><input type="text" name="sub_name" value="" class="form-control in-table"><input type="hidden" name="cate_code" value="${cate_code}"><td><button class="btn btn-success btn-xs rowSubmit"><i class="fa fa-check "></i></button></td></tr>
               </c:otherwise>
               </c:choose>
               </table>
               <hr>
               -소분류는 각 대분류 당 최대 15개까지 추가할 수 있습니다.<br>
               -사용자가 추가하지 않은 기본 소분류는 삭제/수정할 수 없습니다.<br>
               -소분류를 삭제 할 경우 해당 내역들은 '부수입-기타' 혹은 '용돈/기타-기타'로 변경됩니다.<br>
               -이체/대체의 소분류는 통장관리에서 변경할 수 있습니다.<br>
               -카드대금의 소분류는 카드관리에서 변경할 수 있습니다.
              </div>
            </section>
          </aside>
<aside class="col-lg-3 mt"></aside>
          
     
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
    $("#ac_sub_category").addClass("active");
    
    $(".rowSubmit").click(function(){	
    			 var cate_code = $("input[name='cate_code']").val();
    			
    			 var serialized = rowSubmit($(this));
    		     
     		     $.ajax({
     		    	 headers: { 
     		            Accept : "text/plain; charset=utf-8"
     		        },
     		    	 type : 'POST',
     		    	 url : '/cally/acbook/subclass_in', 
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
	    	 url : '/cally/acbook/subclass_up', 
	    	 data : serialized,
		   	success : function(data){
 		    		 alert(data);
 		    		 window.location.reload();
 		    	 }
	     });
    });
    
 $(".rowDelete").click(function(){
    	var serialized = rowSubmit($(this));
    	$.ajax({
	    	 type : 'POST',
	    	 url : '/cally/acbook/subclass_del', 
	    	 data : serialized
	     });
    	window.location.reload();
    });
    </script>