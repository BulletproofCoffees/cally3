<%@ include file="a_submenu.jspf" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section id="main-content">
      <section class="wrapper">
      <form method="post" action="/cally/admin/health/a_calculator_write">
<table class="table table-hover table-bordered table-condensed mt">
<tr>
<th>운동이름</th>
<th>운동세기</th>
<th>운동강도</th>
</tr>

<tr>
<td>
<select name="H_KIND">
<c:forEach items="${exercise}" var="ex">
<option value="${ex.H_KIND}">${ex.H_KIND}:${ex.E_NAME}</option>
</c:forEach>
</select>
</td>
<td>
<select name="HM_CODE">
<c:forEach items="${exercise_met_code}" var="emc">
<option value="${emc.HM_CODE}">${emc.HM_NAME}</option>
</c:forEach>
</select>
</td>
<td><input type="text" name="H_MET"></td>
</tr>
</table>
<center>
<button class="btn btn-info btn-lg" type="submit">등록하기</button>
</center>
</form>
</section>
</section>