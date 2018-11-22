<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="acbook_submenu.jspf" %>
    
    <style>
   
    </style>
    
    
 <section id="main-content">
      <section class="wrapper">
        <h3><i class="fa fa-angle-right"></i> Cally 가계부를 시작해보세요.</h3>
        <!-- page start-->
        <div class="row mt">

          <aside class="col-lg-12 mt">
            <section class="panel">
              <div class="panel-body">
              <center>
              
              <c:url value="/img/logo.png" var="logoUrl" />
              <img src=${logoUrl}>
             	<h3>${sessionScope.loginUser.mem_name}님, 새로 오셨군요!</h3>
             	<p>환영합니다. Cally 가계부는 자산관리를 위한 웹 애플리케이션입니다.</p>
             	<p>예산, 통장/카드, 자산/부채까지 아우르는 다양한 분석 보고서가 제공됩니다.</p>
             	<p>Cally 가계부로 효율적인 자산관리를 시작하세요.</p>
             	<form method="post" action="/cally/acbook/newform">
             	<button class="btn btn-theme">가계부 시작하기</button>
             	</form>
             	</center>
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
  <script>
  window.onload = function(){
	  var side = document.getElementById("sidebar");
	  side.innerHTML = '<ul class="sidebar-menu" id="nav-accordion">' 
          + '<br><li><h5 class="centered">${sessionScope.loginUser.mem_name}님</h5></li><br>'
          +'</ul>';
  }
  </script>