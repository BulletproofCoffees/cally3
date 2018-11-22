<%@ include file="a_submenu.jspf" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section id="main-content">
      <section class="wrapper">
<table class="table table-hover table-bordered table-condensed mt">
<tr>
<th>운동코드</th>
<th>이미지</th>
<th>운동분류</th>
<th>운동이름</th>
<th>운동설명</th>
<th>운동칼로리</th>
<th>유튜브 키</th>
<th>유튜브 제목</th>
</tr>
<c:forEach items="${exercise}" var="ex">
<tr>
<td>${ex.H_KIND}</td>
<td>${ex.E_IMG}</td>
<td>${ex.HH_NAME}</td>
<td>${ex.E_NAME}</td>
<td>${ex.H_COMMENT}</td>
<td>${ex.H_CALORIE}</td>
<td>${ex.H_KEY}</td>
<td>${ex.H_TITLE}</td>
</tr>
</c:forEach>
</table>
<center>
<button class="btn btn-info btn-lg" onclick="location.href='/cally/admin/health/a_health_write'">등록하러가기</button>
</center>
</section>
</section>