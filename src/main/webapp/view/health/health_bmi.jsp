<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="submenu.jspf" %>  
        <style>
        #bmiresult {
        display: none;
        }
        </style>
<section id="main-content">
<section class="wrapper">
<div class="container">
<div class="row mt"> 
<aside class="col-lg-2 mt"></aside>
    <aside class="col-lg-8 mt"> 
    <h1>입력된 기본정보</h1>
    <hr/>
 <table class="table table-bordered">
 <c:forEach items="${mypage}" var="mp">

    <tr>
    <th><label for="sex">성별</label></th>
    <td>
    <div class="form-group">
    <div class="col-xs-8">
    <input type="text" class="form-control" value="${mp.MEM_SEX}">
    </div>
    </div>
    </td>
    </tr>
    <tr>
    <th><label for="age">연령</label></th>
    <td>
    <div class="form-group">
    <div class="col-xs-8">
    <input type="text" class="form-control" id="age" value= "${mp.AGE}" name="age">
    </div>
    </div>
    </td>
    </tr>
    <tr>
    <th><label for="height">키</label></th>
    <td>
    <div class="form-group">
    <div class="col-xs-8">
    <input type="text" class="form-control" id="height" value="${mp.STATURE}" name="height">
    </div>
    </div>
    </td>
    </tr>
    </c:forEach>
    <c:forEach items="${calorie}" var="cal">
    <tr>
    <th><label for="weight">몸무게</label></th>

    <td>
    <div class="form-group">
    <div class="col-xs-8">
    <input type="text" class="form-control" id="weight" value="${cal.C_WEIGHT}" name="weight">
    </div>
    </div>
    </td>
    </tr>
    </c:forEach>
 </table>
      <span>*비만도 측정(BMI)이란*</span><br>
     <p>나이,신장(cm)과 체중(kg)만으로 비만을 판정하는 비만 지수</p>
    <center>
    <button id = "btn" class="btn btn-info">비만도(BMI)검사결과</button>
    </center>

     
  <div id="bmiresult">
    <c:forEach items="${calorie}" var="cal">
    <br>
    <div class='well well-lg'>
    <h3>비만도(BMI)검사결과  ${sessionScope.loginUser.mem_name} 님의 BMI 지수</h3>
    <h3 id='bmicnt'> ${cal.B_BMI} </h3>
    <hr/>
    <img src='/cally/img/callyPlus/img_bmi.png' width='700'>
    <p id='grapnavi' class='btn-point' style='left:0%'>
    <img src='/cally/img/callyPlus/btn_point.png'> 
     </p> 
    <div class="bmi">
    </div>
    </div>
    </c:forEach></div>
    </aside> 
    <aside class="col-lg-2 mt"></aside>
    </div>
    </div>
    </section>
    </section>
 <%@ include file="js.jspf" %>
<script>
$(document).ready(function(){
   var height = $('#height').val();
    var weight = $('#weight').val();
    var bmi = $('#bmicnt').text(); 
    var xy="";
    
    if(bmi >= 30) {
       if (bmi <= 30){
         xy=bmi*2.65;
      }else if (bmi <= 31){
         xy=bmi*2.68;
      }else if (bmi <= 32){
         xy=bmi*2.71;
      }else if (bmi <= 33){
         xy=bmi*2.74;
      }else{
         xy=34*2.77;
      }
       $('.bmi').append("<h4>당신의 비만도(BMI)지수는" + bmi +"로 '고도비만'입니다.</h4>");                     
    }
    else if(bmi >= 25  && bmi < 30) {
      if (bmi <= 25){
      xy=parseInt(bmi*2.41);
     }else if (bmi <= 26){
      xy=bmi*2.47;
     }else if (bmi <= 27){
      xy=bmi*2.51;
     }else if (bmi <= 28){
      xy=bmi*2.57;
     }else if (bmi <= 29){
      xy=bmi*2.61;
     }else if (bmi < 30){
      xy=bmi*2.61;
   }
       $('.bmi').append("<h4>당신의 비만도(BMI)지수는" + bmi +"로 '비만'입니다.</h4>");
                        
    }
    else if(bmi >= 23  && bmi < 25) {
      if (bmi == 23){
      xy=bmi*1.73;
     }else {
      xy=bmi*2.1;
   }
       $('.bmi').append("<h4>당신의 비만도(BMI)지수는" + bmi +"로 '과체중'입니다.</h4>");
                        
    }
    else if(bmi > 18.5  && bmi < 23) {
      xy=bmi*1.6;
       $('.bmi').append("<h4>당신의 비만도(BMI)지수는" + bmi +"로 '정상'입니다.</h4>");
                        
    }
    else {
      xy=bmi*0.9;
       $('.bmi').append("<h4>당신의 비만도(BMI)지수는" + bmi +"로 '저체중'입니다.</h4>");
                        
    }
    $("#bmicnt").html(bmi);

   if (bmi > 0){
      $("#grapnavi").css({"position":"relative","top":"-35px","display":"block","width":"28px","left":xy+"%"});
   }else{
      $("#grapnavi").css({"position":"relative","top":"-35px","display":"block","width":"28px","left":xy+"%"});
   }
   
   
});

$('#btn').click(function(){
      $("#bmiresult").css('display','block');
   });
</script>