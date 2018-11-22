<%@ include file="submenu.jspf" %>  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <section id="main-content">
<section class="wrapper">
<div class="container">
<div class="row mt"> 
<aside class="col-lg-2 mt"></aside>
 <aside class="col-lg-8 mt"> 
    <br>
    <div class="view">
    <div class='well well-lg'>
    <c:forEach items="${calorie}" var="cal">
    <h3>칼로리 처방 받기</h3><hr/>
    <table class='table table-bordered'>
    <tr>
    <th>총 감량기간</th>
    <td>${cal.C_PERIOD}일</td>
    <tr>
    <th>현재체중</th>
    <td>${cal.C_WEIGHT}kg</td></tr>
    <tr>
    <th>목표체중</th>
    <td>${cal.C_GOAL_WEIGHT}kg</td>
    </tr>
    </table>
    <h5>표준체중  ${cal.C_AV_WEIGHT}kg </h5>
    <h5> 미용 추천 체중 ${cal.C_BU_WEIGHT}kg 입니다.</h5>
    <h3>하루 소비칼로리는
    ${cal.C_ALL_MET}kcal 입니다.
    </h3>
    <hr/>
    <div class='progress' style='height:30px'>
    <div class='progress-bar progress-bar-success' role='progressbar' style='width:60%'>${cal.C_BASIC_MET}kcal</div>
    <div class='progress-bar progress-bar-warning' role='progressbar' style='width:30%'>${cal.C_ACTIVE_MET}kcal</div>
    <div class='progress-bar progress-bar-danger' role='progressbar' style='width:10%'>${cal.C_DIGEST_MET}kcal</div></div>
    <center>
    <img src ="/cally/img/callyPlus/txt_calorie.gif">
    </center>
    <br>
    <p>하루소비칼로리는 일상생활을 하는데 기본적으로 소비되는 칼로리입니다.</p>
    <p>칼로리처방시, 선택하는 활동량에 따라 달라질 수 있습니다.</p>
    <h3>처방칼로리</h3><hr/>
    <table class='table table-bordered'>
    <tr>
    <th>하루 동안 섭취해야 할 음식 칼로리</th>
    <td>${cal.C_DAY_EAT}kcal</td>
    </tr>
    <tr>
    <th>하루 동안 운동으로 소모해야 할 칼로리</th>
    <td>${cal.C_DAY_EXERCISE}kcal</td>
    </tr>
    </table>
    </c:forEach>
    <p>일일 음식 섭취 칼로리가 1000kcal 이하일 때는 감량 목표를 하향 조절해 주세요.</p>
    <p>1000kcal 이하의 음식섭취는 영양 불균형 및 요요 현상의 원인이 될 수 있어요.</p>
    <center>
    <button class='btn btn-info' onclick="location.href='health_calorie'">칼로리 처방 다시 받기</button>
    </center>
    </div>
    </div>
    </aside>
    </div>
    </div>
     <aside class="col-lg-2 mt"> </aside>
    </section>
    </section>