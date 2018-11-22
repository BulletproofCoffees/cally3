<%@ include file="a_submenu.jspf" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section id="main-content">
      <section class="wrapper">
<table class="table table-hover table-bordered table-condensed mt">
<tr>
<th>운동코드</th>
<th>운동이름</th>
<th>운동이미지</th>
<th>운동설명</th>
<th>운동세기</th>
<th>운동강도</th>
<th>유튜브아이디</th>
</tr>
<c:forEach items="${exercise_met}" var="em">
<tr>
<td>${em.H_KIND}</td>
<td>${em.E_NAME}</td>
<td>${em.E_IMG}</td>
<td>${em.H_COMMENT}</td>
<td>${em.HM_NAME}</td>
<td>${em.H_MET}</td>
<td>${em.H_KEY}</td>
</tr>
</c:forEach>
</table>
<center>
<button class="btn btn-info btn-lg" onclick="location.href='/cally/admin/health/a_calculator_write'">등록하러가기</button>
</center>
</section>
</section>