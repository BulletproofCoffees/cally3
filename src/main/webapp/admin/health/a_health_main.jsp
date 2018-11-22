<%@ include file="a_submenu.jspf" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.center{
text-align: center;
}
</style>
<section id="main-content">
      <section class="wrapper">

<div class="center">
<button class="btn btn-info btn-lg" onclick="location.href='/cally/admin/health/a_health_exercise'">운동영상 업로드</button>
<button class="btn btn-info btn-lg" onclick="location.href='/cally/admin/health/a_health_calculator'">운동별 칼로리 계산기</button>
</div>


</section>
</section>
 <%@ include file="/admin/incs/bottom.jspf"%>