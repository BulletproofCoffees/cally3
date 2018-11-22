<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.main-chart{
width:80%;
margin:0% 5% 0% 10%;
}
.contTotal{
padding:0px 10%;
}
.callymenu{
	color: #666666 !important;
}
.c_tbooking{
	color: #4ECDC4 !important;
}
</style>
<%@ include file="/view/tbooking/sidebar.jsp" %>
    <!-- **********************************************************************************************************************************************************
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->
    <!--main content start-->
<section id="main-content">
	<section class="wrapper">
		<div class="row">
			<div class="col-lg-9 main-chart">
				<div id="container">
<!-- 여기서부터 시작이라고 보면 됨 -->
    <div class="contTotal">
        <h3><i class="fa fa-angle-right"></i> 열차예매</h3>
        <!-- page start-->
        <div class="row mt">
          <aside class="col-lg-9 mt">
            <section class="panel">
              <div class="panel-body">
                <div id="calendar" class="has-toolbar"></div>
              </div>
            </section>
          </aside>
        </div>
    </div>
<!-- 여기까지가 끝이라고 보면 됨 -->
				</div>
			</div>
		</div>
	</section>
</section>
    <%@ include file="js.jspf" %>