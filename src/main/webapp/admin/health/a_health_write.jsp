<%@ include file="a_submenu.jspf" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section id="main-content">
      <section class="wrapper">
      <form method="post" action="/cally/admin/health/a_health_write">
<table class="table table-hover table-bordered table-condensed mt">
<tr>

<th>이미지</th>
<th>운동설명</th>
<th>운동이름</th>
<th>운동칼로리</th>
<th>유튜브 키</th>
<th>운동분류</th>
<th>유튜브 제목</th>
</tr>

<tr>

<td><input type="file" name="E_IMG"></td>
<td><textarea name="H_COMMENT" rows="5" cols="40"></textarea></td>
<td><input type="text" name="E_NAME"></td>
<td><input type="text" name="H_CALORIE"></td>
<td><input type="text" name="H_KEY"></td>
<td>
<select name="HH_CODE">
<c:forEach items="${exercise_code}" var="ec">
<option value="${ec.HH_CODE}">${ec.HH_NAME}</option>
</c:forEach>
</select>
</td>
<td><input type="text" name="H_TITLE"></td>
</tr>

</table>

<center>
<button class="btn btn-info btn-lg" type="submit">등록하기</button>
</center>
</form>
</section>
</section>