<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="submenu.jspf" %>



    <section id="main-content">
      <section class="wrapper">
	<div class="col-lg-12 main-chart js_hame  ">
<div class="col-lg-12 showback">

				<p class="col-md-4">${sessionScope.loginUser.mem_name}</p>
				<div class="col-md-3 col-md-offset-5">
				<c:forEach items="${average}" var="average">
					<b>일일 섭취 권장량( ${average.M_CAL}cal )</b>
					</c:forEach>
					<button  class="btn btn-primary" onclick="location.href='changingcal'">변경하기</button>
				</div>

			</div>
<div class="col-lg-12 ds" >

<%@ include file="piece/Pie_Chart.jsp" %>


<!--막대그래프  ----------------------------------------------->
<div class="col-md-12 showback">
<%@ include file="piece/Column_and_Line.jsp" %>
</div>
<!--/막대그래프  ----------------------------------------------->




</div>


		</div>
	</section>
      </section>
       <%@ include file="js/js.jspf" %>   
