<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <!-- 가계부 서브메뉴 인클루즈 -->
    <%@ include file="acbook_submenu.jspf" %>
    
    <style>
    span {
    margin-right: 3px;}
    
     .form-control {
    height: 22px;
    padding: 0px 5px;
    font-size: 1em;
    }
    
    input[type=text], input[type=number] {
    border: 0px;
    background-color: rgba(0,0,0,0);
    box-shadow: inset 0 0px 0px rgba(0,0,0,0);
    }
    
    
     .table  th:last-child {
    text-align: center;
    }
     .table tr td:last-child {
    text-align: center;
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
        			  
        			  <h2><span style="font-size: 0.7em;"><i class="fa fa-chevron-left"></i></span>
        			  ${year}년 ${month}월 ${day}일
          <span style="font-size: 0.7em;"><i class="fa fa-chevron-right"></i></span></h2>
        			  <hr style="margin-bottom: 10px;">
        			 <span class="badge bg-theme">수입합계</span> 80,000  
        			   <span class="badge bg-theme02" style="margin-left: 5px;">지출합계</span> 55,000<br>
        			   <div style="height:10px;"></div>
        			   <form method="get" action="/cally/acbook/memo_in" name="memo_form">
        			   <input type="hidden" name="memo_date" value="${memo_date}">
        			  <textarea rows="4" cols="60" name="memo_value">${memo_value}</textarea>
        			  <div>
        			  <button class="btn btn-theme btn-sm" type="submit">메모 저장</button>
        			  <button class="btn btn-theme02 btn-sm" type="reset" onclick="tomemolist()">메모 목록</button>
        			  </div>
        			  </form>
        			  
        			  
        			  </div>
			<!-- 오늘의 수입패널 -->
			
              <div class="showback">
              <h4><i class="fa fa-angle-right"></i> 오늘의 수입</h4>
               <table class="table table-bordered table-hover table-striped table-condensed">
               <tr>
            

               <th>내역</th>
               <th class="numeric">금액</th>
               <th>입금통장</th>
               <th colspan="2">분류</th>
               <th></th>
               </tr>
               <tr>
               
               
               <td>용돈</td>
               <td class="numeric">30000</td>
               <td><span class="label label-success label-mini">적금</span>우리적금통장</td>
               <td colspan="2">부수입>용돈</td>
               <td> <button class="btn btn-danger btn-xs"><i class="fa fa-trash-o "></i></button></td>
               </tr>
               <tr>
               
               
               <td>용돈</td>
               <td class="numeric">30000</td>
               <td><span class="label label-info label-mini">현금</span>지갑속현금</td>
               <td colspan="2">부수입>용돈</td>
               <td> <button class="btn btn-danger btn-xs"><i class="fa fa-trash-o "></i></button></td>
               </tr>
               <tr>
               
               
               <td>용돈</td>
               <td class="numeric">30000</td>
               <td><span class="label label-info label-mini">현금</span>지갑속현금</td>
               <td colspan="2">부수입>용돈</td>
               <td> <button class="btn btn-danger btn-xs"><i class="fa fa-trash-o "></i></button></td>
               </tr>
               
               <!-- ****************** 입력줄 ****************-->
                <tr>
            
               <td><input type="text" class="form-control"></td>
               <td class="numeric"><input type="number" class="form-control">
</td>
               <td> <select class="form-control">
               <option>현금</option>
               <option>우리입출금통장</option>
               <option>국민통장</option>
               </select>
</td>
               <td><select class="form-control">
               <option>주수입</option>
               <option>부수입
               </option>
               </select></td><td>
               <select class="form-control">
               <option>용돈</option>
               <option>기타
               </option>
               </select></td>
               <td><button class="btn btn-success btn-xs"><i class="fa fa-check"></i></button>
               </td>
               </tr>
               </table>
          
              </div>
			<!-- 오늘의 지출패널 -->
			<div class="showback">
			   <h4><i class="fa fa-angle-right"></i> 오늘의 지출</h4>

               <table class="table table-bordered table-hover table-striped table-condensed">
               <tr>
              
               
               <th>내역</th>
               <th class="numeric">금액</th>
               <th>출금통장</th>
               <th colspan="2">분류</th>
               <th></th>
               </tr>
               <tr>
               
               
               <td>파스타</td>
               <td class="numeric">30000</td>
               <td><span class="label label-success label-mini">적금</span>우리적금통장</td>
               <td colspan="2">식비>식사</td>
               <td> <button class="btn btn-danger btn-xs"><i class="fa fa-trash-o "></i></button></td>
               </tr>
               <tr>
               
               
               <td>간식</td>
               <td class="numeric">30000</td>
               <td><span class="label label-info label-mini">현금</span>지갑속현금</td>
               <td colspan="2">식비>간식</td>
               <td> <button class="btn btn-danger btn-xs"><i class="fa fa-trash-o "></i></button></td>
               </tr>
               <tr>
               
               
               <td>칫솔</td>
               <td class="numeric">5000</td>
               <td><span class="label label-info label-mini">현금</span>지갑속현금</td>
               <td colspan="2">생활비>생활용품</td>
               <td> <button class="btn btn-danger btn-xs"><i class="fa fa-trash-o "></i></button></td>
               </tr>
               
               <!-- ****************** 입력줄 ****************-->
               
                <tr>
               
               <td><input type="text" class="form-control"></td>
               <td class="numeric"><input type="number" class="form-control">
</td>
               <td> <select class="form-control">
               <option>현금</option>
               <option>우리입출금통장</option>
               <option>국민통장</option>
               </select>
</td>
               <td><select class="form-control">
               <option>주수입</option>
               <option>부수입
               </option>
               </select></td><td>
               <select class="form-control">
               <option>용돈</option>
               <option>기타
               </option>
               </select></td>
               <td><button class="btn btn-success btn-xs"><i class="fa fa-check"></i></button>
               </td>
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
    <script>
    function tomemolist(){
    	window.location.href = "/cally/acbook/memolist";
    }
    </script>