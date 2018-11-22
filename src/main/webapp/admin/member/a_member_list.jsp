<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>   
 <%@ include file="/admin/incs/top.jspf"%>
<%@ include file="a_member_submenu.jspf"%>
<style>
.table th{
text-align: center;
}

.table tr > td:first-child, .table tr > td:last-child {
text-align: center;
}
</style>
 <section id="main-content">
      <section class="wrapper">
        <h3><i class="fa fa-angle-right"></i> 회원 리스트</h3>
        <!-- page start-->
        <div class="row mt">
        
          <aside class="col-lg-12 mt">
            <section class="panel">
              <div class="panel-body">

<form action="/cally/admin/member" method="get">
<input type="hidden" value=0 name="mem_num" id="mem_num">
회원번호: <input type="number" min="1" onkeyup="val_num(this.value)">
아이디: <input type="text" name="mem_id">
이름: <input type="text" name="mem_name">
이메일: <input type="text" name="mem_email">
회원상태 : <select name="mem_state">
<option value="all">전체</option>
<option value="y">활동회원</option>
<option value="n">탈퇴회원</option>
</select>
<button type="submit" type="submit">검색</button>
</form>

<table class="table table-hover table-bordered table-condensed mt">
<tr>
<th>회원번호</th>
<th>회원아이디</th>
<th>회원비밀번호</th>
<th>회원이름</th>
<th>회원이메일</th>
<th>회원상태</th>
</tr>
<c:forEach items="${memberlist}" var="mem">
<tr>
<td>${mem.mem_num}</td>
<td>${mem.mem_id}</td>
<td>${mem.mem_pw}</td>
<td>${mem.mem_name}</td>
<td>${mem.mem_email}</td>
<c:choose>
<c:when test="${mem.mem_state == 'y'}">
<td class="c-theme">활동회원</td>
</c:when>
<c:otherwise>
<td class="c-theme02">탈퇴회원</td>
</c:otherwise>
</c:choose>
</tr>
</c:forEach>
</table>	


</div>
</section>
</aside>
</div>
</section>
</section>
 
 <%@ include file="/admin/incs/bottom.jspf"%>
 <script>
 function val_num(val){
	 if(val == ""){
		 document.getElementById("mem_num").value = 0;
	 } else {
	 document.getElementById("mem_num").value = val;
	 }
 }
 </script>