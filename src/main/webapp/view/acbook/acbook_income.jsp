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
    
    
     .table  th:first-child, .table  th:last-child {
    text-align: center;
    }
    .table tr td:first-child, .table tr td:last-child {
    text-align: center;
    }

	.fromto {
	display : inline-block !important;
	}
    </style>
    
    
 <section id="main-content">
      <section class="wrapper">
        <h3><i class="fa fa-angle-right"></i> 수입 쓰기</h3>
        <!-- page start-->
        <div class="row mt">
        
          <aside class="col-lg-12 mt">
            <section class="panel">
              <div class="panel-body">
              
              <!-- 날짜 검색 -->
              					<div class="text-center" data-date-format="yyyy/mm/dd">
					<form method="get" autocomplete="off">
					<span> 기간 </span>
						<input type="text" value="${from}" class="form-control fromto dpd1" name="from"
							style="width: 110px;"> <span> ~ </span>
						<input type="text" value="${to}" class="form-control fromto dpd2" name="to"
							style="width: 110px;">
							<button class="btn btn-theme">조회</button>
							</form>
							<br>
							<span class="badge bg-theme">수입합계</span> <fmt:formatNumber type="number" value="${sum_in}" />원
					</div>
              <div style="height: 15px;"></div>
              <div style="max-height: 500px; overflow-y : scroll; margin-bottom: 10px;">
               <table class="table table-bordered table-hover table-striped table-condensed">
               <tr>
               <th><input type="checkbox" class="allcheck"></th>
               <th>날짜</th>
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
               <td><fmt:formatDate value="${list.DET_DATE}" pattern="yyyy/MM/dd"/></td>
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
               <td colspan="8">수입 내역이 없습니다.</td>
               </tr>
               </c:if>
               
               <!-- ****************** 입력줄 ****************-->
               <tr>
            
               <td><i class="fa fa-plus"></i>
               </td>
               <td>
               <div>
               <input class="form-control in-table form-control-inline input-medium callydate default-date-picker callydate" size="3"  type="text" name="det_date">
               </div>
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
               </table>
               </div>
                <button class="btn btn-sm delDetail">선택삭제</button>
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
     $("#ac_sub_1").addClass("active");
     $("#ac_sub_income").addClass("active");
     
    $(document).ready(function(){
    	cate_ajax(1, $("select[name='cate_code']"));
    });
    
   
    </script>