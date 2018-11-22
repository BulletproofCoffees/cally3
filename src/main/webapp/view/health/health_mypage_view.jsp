<%@ include file="submenu.jspf" %>  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section id="main-content">
<section class="wrapper">
<div class="container">
<div class="row mt"> 


    <aside class="col-lg-2 mt"></aside>
 <aside class="col-lg-8 mt">
    <div class="form-group row">
    <h1>나의정보</h1>
    <hr/>
  <c:forEach items="${mypage}" var="mp">
 <table class="table table-bordered">
    <tr>
    <th><label for="sex">성별</label></th>
    <td>
    <div class="form-group">
    <div class="col-xs-8">
  <input type="text" name="MEM_SEX" value="${mp.MEM_SEX}">
    </div>                                                 
    </div>
    </td>
    </tr>
    <tr>
    <th><label for="age">연령</label></th>
    <td>
    <div class="form-group">
    <div class="col-xs-8">
    <input type="text" class="form-control" id="age" value="${mp.AGE}" name="AGE">
    </div>
    </div>
    </td>
    </tr>
    <tr>
    <th><label for="height" >키</label></th>
    <td>
    <div class="form-group">
    <div class="col-xs-8">
    <input type="text" class="form-control" id="height" name="STATURE" value="${mp.STATURE}">
    </div>
    </div>
    </td>
    </tr>
    <tr>
    <th><label for="weight">몸무게</label></th>
    <td>
    <div class="form-group">
    <div class="col-xs-8">
    <input type="text" class="form-control" id="weight" name="KG" value="${mp.KG}">
    </div>
    </div>
    </td>
    </tr>
 </table>
    </c:forEach> 

    <center>
    <button class="btn btn-info btn-lg" onclick="location.href='health_mypage'">내 정보 확인</button>
    </center>

    </div>
  </aside>
      <aside class="col-lg-2 mt"></aside>
</div> 
</div>
</section>
</section>
<%@ include file="js.jspf" %>