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
   
    </style>
    
    
 <section id="main-content">
      <section class="wrapper">
        <h3><i class="fa fa-angle-right"></i> 카드 관리</h3>
        <!-- page start-->
        <div class="row mt">

          <aside class="col-lg-12 mt">
            <section class="panel">
              <div class="panel-body">
                   <button class="btn btn-theme03 btn-xs pull-right" style="margin-bottom: 5px;"><i class="fa fa-plus"></i> 새 카드 추가</button>
               <table class="table table-hover table-bordered table-condensed">
              <tr>
              <th>카드사</th>
              <th colspan="2">카드명</th>
              <th>연계계좌</th>
              <th>결제일</th>
              <th>이용기간</th>
              <th>사용함</th>
              <th>삭제</th>
              </tr>
              
              <tr>
             
             <td>
             <select class="form-control">
             <option>경남</option>
             <option>광주</option>
             <option>국민</option>
             <option>기업</option>
             <option>농협</option>
             <option>대구</option>
             <option>롯데</option>
             <option>부산</option>
             <option>비씨</option>
             <option>산업</option>
             <option>삼성</option>
             <option>상호</option>
             </select>
             </td> 
             
             <td><input type="text" class="form-control" value="우리원카드"></td>
             <td>
             <input type="checkbox">체크카드
             </td>
           	<td>
           	<select class="form-control">
           	<option>미지정</option>
           	<option>지갑속현금</option>
           	<option>어쩌구</option>
           	<option>저쩌구</option>
           	</select>
           	</td>
           	<td>
             <select class="form-control">
             <option>1일</option>
             <option>28일</option>
             </select>
             </td>
             <td>
             전전월 17일~전월 16일까지
             </td>
             
             <td>
                    <input type="checkbox" checked=""/>
                         </td>
             <td><button class="btn btn-danger btn-xs"><i class="fa fa-trash-o "></i></button></td>
              </tr>
               </table>
               <div class="text-center">
          	<button class="btn btn-theme02">저장하기</button>
          </div>
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