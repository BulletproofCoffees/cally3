<%@ include file="submenu.jspf" %>  
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<section id="main-content">
<section class="wrapper">
<div class="container">
<div class="row mt"> 
<aside class="col-lg-2 mt"></aside>
 <aside class="col-lg-8 mt">
  <div class="form-group row"> 
    <h1>칼로리처방</h1>
    <hr/>
    <button class="btn btn-info" onclick="location.href='health_calorie_past'" style="float:right">지난 칼로리 처방 보기</button>
    <br><br><br>
    
    <form action="health_calorie" method="post">
     <table class="table table-bordered">
    <c:forEach items="${mypage}" var="mp">
     <tr>
     <th><label for="sex">성별</label></th>
    <td> 
    <div class="col-xs-8">
    <input type="text" class="form-control" id="boy" value="${mp.MEM_SEX}">
    </div>
    </td> 
     </tr>
     <tr>
      <th><label for="height">키</label></th>
     <td>
    <div class="col-xs-8">
    <input type="text" class="form-control" id="height" name="height" value="${mp.STATURE}">
    </div>
     </td>
     </tr>
     </c:forEach>
     <tr>
      <th><label for="weight">몸무게</label></th>
      <td>
      <div class="col-xs-8">
      <input type="text" class="form-control" id="weight" name="C_WEIGHT">kg 
    </div>
      </td>
     </tr>
     <tr>
      <th><label for="weight2">목표체중</label></th>
      <td>
    <div class="col-xs-8">
      <input type="text" class="form-control" id="weight2" name="C_GOAL_WEIGHT">kg
    </div>
      </td>
     </tr>
     <tr>
     <th><label for="day">체중감량기간</label></th>
      <td>
      <div class="col-xs-8">
      <input type="text" class="form-control" id="day" name="C_PERIOD" placeholder="일수를 적어주세요 --> 예 ) 52">
      </div></td>
     </tr>
     <tr>
     <th><label for="health">평소활동량</label></th>
     <td>
     <ul>
		<c:forEach items="${acode}" var = "a">
		<li><input type="radio" name="A_CODE" value="${a.A_CODE}" checked/>
		<label for="work01">${a.A_NAME}</label></li>
 		</c:forEach>
 </ul>
 </td>
     </tr>
     </table>
     
    <center>
    <button class="btn btn-info" type="submit">기초대사량 결과보기</button>
    </center>
    </form>
    
       
<%--    
    		<%@ include file="chart.jsp"%>
		<!-- 그래프 -->
                <div id="date-popover" class="popover top"
					style="cursor: pointer; disadding: block; margin-left: 33%; margin-top: -50px; width: 175px;">
					<div class="arrow"></div>
					<h3 class="popover-title" style="disadding: none;"></h3>
					<div id="date-popover-content" class="popover-content"></div>
				</div> --%>
   </div>
</aside>
   <aside class="col-lg-2 mt"></aside>

</div>
</div> 
</section>
</section>

<%@ include file="js.jspf" %>
