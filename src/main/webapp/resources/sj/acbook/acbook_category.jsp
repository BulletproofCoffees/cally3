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
    }
    
    .subcategory td:last-child, .subcategory th:last-child {
    text-align: center;
    width: 20%;
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
              <!-- 소분류 테이블 -->
               <table class="table table-hover table-bordered table-condensed">
               <tr>
               <th>수입 대분류</th>
               </tr>       
               <tr><td>주수입</td></tr>
               <tr><td>부수입</td></tr>
               <tr><td>전월이월</td></tr>
               <tr><td>저축/보험</td></tr>
               
               
               
                 <tr><th>지출 대분류</th></tr>
               
               <tr><td>식비</td></tr>
               <tr><td>주거/통신</td></tr>
               <tr><td>생활용품</td></tr>
               <tr><td>의복/미용</td></tr>
               <tr><td>건강/문화</td></tr>
               <tr><td>교육/육아</td></tr>
               <tr><td>교통/차량</td></tr>
               <tr><td>경조사/회비</td></tr>
               <tr><td>세금/이자</td></tr>
               <tr><td>용돈/기타</td></tr>
               <tr><td>카드대금</td></tr>
               <tr><td>저축/보험</td></tr>
               <tr><td>이체/대체</td></tr>
               
               </table>
               
              </div>
            </section>
          </aside>
          
            <aside class="col-lg-4 mt">
            <section class="panel">
              <div class="panel-body">
              <!-- 소분류 테이블 -->
               <table class="subcategory table table-hover table-bordered table-condensed">
               <tr>
               <th colspan="2">선택한 대분류</td>
               </tr>
               <tr>
               <td colspan="2">식비</td>
               </tr>
               
               <tr>
               <th>소분류</th><th>삭제/추가</th>
               </tr>       
               <tr><td>주식</td><td><button class="btn btn-danger btn-xs"><i class="fa fa-trash-o "></i></button></td></tr>
               <tr><td>부식</td><td><button class="btn btn-danger btn-xs"><i class="fa fa-trash-o "></i></button></td></tr>
               <tr><td>간식</td><td><button class="btn btn-danger btn-xs"><i class="fa fa-trash-o "></i></button></td></tr>
               <tr><td>외식</td><td><button class="btn btn-danger btn-xs"><i class="fa fa-trash-o "></i></button></td></tr>
               <tr><td><input type="text" class="form-control"></td><td><button class="btn btn-success btn-xs"><i class="fa fa-check "></i></button></td></tr>
               
               </table>
               <hr>
               -소분류는 각 대분류 당 최대 20개까지 추가할 수 있습니다.<br>
               -소분류를 삭제 할 경우 이전의 내역들은 '기타'로 변경됩니다.<br>
               -사용자가 추가하지 않은 기본 소분류는 삭제/수정할 수 없습니다.
               
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