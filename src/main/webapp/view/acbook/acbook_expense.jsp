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
	
	[date-togle]:hover{
	position:relative !important;
	}
    </style>
 
    
 <section id="main-content">
      <section class="wrapper">
        <h3><i class="fa fa-angle-right"></i> 지출 쓰기</h3>
        <!-- page start-->
        <div class="row mt">
        
          <aside class="col-lg-12 mt">
            <section class="panel">
              <div class="panel-body">
              
               <!-- 날짜 검색 -->
              					<div class="text-center" data-date-format="yyyy/mm/dd">
										<form autocomplete="off" method="get">
					<span> 기간 </span>
						<input type="text" value="${from}" class="form-control fromto dpd1" name="from"
							style="width: 110px;"> <span> ~ </span>
						<input type="text" value="${to}" class="form-control fromto dpd2" name="to"
							style="width: 110px;">
							<button class="btn btn-theme">조회</button>
					</form><br>
					<span class="badge bg-theme02" style="margin-left: 5px;">지출합계</span> <fmt:formatNumber type="number" value="${sum_ex}" />원
					</div>
              <div style="height: 15px;"></div>
              <div style="max-height: 500px; overflow-y : scroll; margin-bottom: 10px;">
               <table class="table table-bordered table-hover table-striped table-condensed">
               <tr>
               <th><input type="checkbox" class="allcheck"></th>
               <th>날짜</th>
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
               
               <!-- ****************** 입력줄 ****************-->
               
                 <tr>
               <td><i class="fa fa-plus"></i>
                </td>
                <td>
               <input name="det_date" class="form-control in-table form-control-inline input-medium callydate default-date-picker" size="3"  type="text" name="det_date">
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
			
               
               <hr>
               -계좌간 이체방법 : A통장에서 B통장으로 이체시, '출금통장'은 A통장으로 '분류'는 '이체/대체>B통장' 선택
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
    $("#ac_sub_expense").addClass("active");
    
    $(document).ready(function(){
    	cate_ajax(3, $("select[name='cate_code']"));
        $('[data-toggle="popover"]').popover();   
    });
    
    </script>
