<%@ include file="submenu.jspf" %>  
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<section id="main-content">
<section class="wrapper">
<div class="container">


<aside class="col-lg-2 mt"></aside>
<aside class="col-lg-8 mt">
   <div class="form-group row">
   <br><br>
   <div class="well well-lg">
      <div class="col-xs-11">
        <input class="form-control" id="keyword" type="text">
      </div>
        <button class="btn btn-info" onclick="search()">검색</button>
<div>
   <p><br>cally는 음식의 칼로리 뿐만 아니라 영양소 구성도 함께 나와 다이어트뿐 아니라 건강한 식습관 형성에도 도움이 됩니다.</p>
</div>
   </div>
   </div>
        <div class="exercise"></div>
        
  <h2>오늘의 운동칼로리 검색 순위 TOP</h2>
  <p>오늘 한 운동의 칼로리를 계산해 보아요~!</p>
       
  <table class="table">
    <thead>
      <tr class="active">
        <th>번호</th>
        <th>검색명</th>
      </tr>
    </thead>
    <tbody>
    
    <c:forEach items="${exercise}" var="ex">
      <tr class="danger">
        <td>${ex.H_KIND}</td>
       <td>
       <a data-toggle="modal" href="#myModal" class="toModal">${ex.E_NAME}</a>
       </td>        
      </tr>
       </c:forEach>
       
    </tbody>
  </table>
  </aside>
  
</div>

</section>
</section>


<script> 
 var h_met = 0;

$('.danger').click(function(){
 /* 		    var textplus = '선택하신 ';
	        textplus += $('.toModal').text();
	        textplus += ' 에 대한 정보입니다.';  
	        $(".modal-title").text(textplus);  */
	$.ajax({
		url : 'health_calculator',
		type : 'POST',
		data : {
			H_KIND : $(this).find('td:nth(0)').text()
		},success : function(data){
			$('.container2').empty();
				$('.container2').append("<table id='cal' class='table table-bordered' style='width:500px'>"
				+"<tr><th colspan='3'>운동명</th><th>운동세기</th><th>운동시간</th><th>체중선택</th><th>칼로리</th>"
				+"</tr><tr><td colspan='3'>" + data[0].E_NAME + "</td><td><select id='met' onchange='change()'>"
				+"</select></td><td><select id='clock' onchange='change()'><c:forEach var='a' begin='10' end='60'>"
				+"<option value='${a}'>"+ ${a} +"</option>"
			    +"</c:forEach></select>분</td>"
				+"<td><select id='weight' onchange='change()'><c:forEach var='b' begin='40' end='100'><option value='${b}'>"+${b}+"</option>"
			    +"</c:forEach></select>kg</td><td class='result_cal'>"+data[0].H_MET*1.02*(10/60)*40+"</td>"
				/* +"</tr><tr><td colspan='3'><img src= '/cally/img/callyPlus/"+data[0].E_IMG+"' width='50' height='100'>" */
				+"</tr><tr><td colspan='3'><img src= 'http://mblogthumb2.phinf.naver.net/MjAxNjEwMzFfMjI1/MDAxNDc3ODk3MDcwOTUx.Y8P0UFF8tAHtdOWjcrvQQZcs8rkzBNcQT5OLjXXtjR8g.T6dPRx2qMxsCSQRNUmwLqOWVC41eeplg0CX6uAKVflYg.JPEG.chingyangn/%ED%84%B1%EA%B1%B8%EC%9D%B4_%EC%9E%98%ED%95%98%EB%8A%94%EB%B2%95_%287%29.jpg?type=w800' height='100'>"
				+"</td><td colspan='4'>설명 : "+ data[0].H_COMMENT+"</td></tr></table>");

	        	for(var i =0; i<$(data).size(); i++){
					console.log(data[i].HM_NAME)
					$('#met').append("<option value='"+data[i].H_MET+"'>"+ data[i].HM_NAME + "</option>");
					};
/* 					
					   var list = new Array(); 
					   <c:forEach items="${food_code}" var="fd">
					   list.push("${fd.F_NAME}");
					   </c:forEach>
					$('#cal').append("<tr><td colspan='4'>"+list+"</td><td colspan='4'>"
					+12+"</td></tr></table>");
					 */
					
					
		},error : function(){
			alert('error')
		}

	});
	

})
function change() {
	var met = $('#met').val();
	var clock = $('#clock').val();
	var weight = $('#weight').val();
$('.result_cal').text(met*1.05*(clock/60)*weight);
	
}
/*  function haha(){
	var a = document.getElementById("clock").value;
	var b = document.getElementById("weight").value;
	(60/a)*b*1.05	
}  */
</script>
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content -->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
     
          <h4 class="modal-title"></h4>
        </div>
        <div class="modal-body">
         <div class="container2">

  </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  </div>

	  

<%@ include file="js.jspf" %>
