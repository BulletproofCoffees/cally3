<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
            <!-- 가계부 서브메뉴 인클루즈 -->
    <%@ include file="acbook_submenu.jspf" %>
    
    
<section id="main-content">
      <section class="wrapper">
        <h3><i class="fa fa-angle-right"></i> 가격정보 검색</h3>
        <!-- page start-->
        <div class="row mt">
        
          <aside class="col-lg-12 mt">
           <section class="panel">
              <div class="panel-body">
              <input type="text">
              <button class="btn btn-theme03"><i class="fa fa-search"></i></button>
              </div>
              </section>
          
          
            <section class="panel">
              <div class="panel-body">
              
              [<strong>${query}</strong>] 검색 결과입니다 (총 ${total} 건)
              <input type="hidden" value="${query}" name="query">
              <input type="hidden" value="1" name="start">
              <input type="hidden" value="" name="sort">
              
              <div id="nresult"></div>
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