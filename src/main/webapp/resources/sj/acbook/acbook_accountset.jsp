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
        <h3><i class="fa fa-angle-right"></i> 통장 관리</h3>
        <!-- page start-->
        <div class="row mt">

          <aside class="col-lg-12 mt">
            <section class="panel">
              <div class="panel-body">
                    <button class="btn btn-theme03 btn-xs pull-right" style="margin-bottom: 5px;"><i class="fa fa-plus"></i> 새 통장 추가</button>
               <table class="table table-hover table-bordered table-condensed">
              <tr>
              <th>통장명</th>
              <th>자산속성</th>
              <th>시작금액 설정</th>
              <th>생성 날짜</th>
              <th>사용함</th>
              <th>삭제</th>
              </tr>
              
              <tr>
             <td><input type="text" class="form-control" value="지갑속현금"></td>
             <td>
             <select class="form-control">
             <option>현금</option>
             <option>자유입출금</option>
             <option>예금</option>
             <option>적금</option>
             <option>주식</option>
             <option>펀드</option>
             <option>보험</option>
             <option>부동산</option>
             <option>금</option>
             <option>기타자산</option>
             <option>대출</option>
             <option>기타부채</option>
             </select>
             </td> 
             <td><input type="number" class="form-control"></td>
             <td><input class="form-control form-control-inline input-medium default-date-picker" type="text" value=""></td>
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