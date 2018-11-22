<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="submenu.jspf" %>

<style type="text/css">
.showback_a {
	border: 3px solid #ccc;
}

.showback_b {
	background: #ffffff;
	padding: 15px;
	margin-bottom: 15px;
	/* box-shadow: 0px 3px 2px #aab2bd; */	
}

td{	padding: 10px;
}
.Line>thead>tr>th {
	border-bottom: 3px solid;
	font-size: 25px;
}

.Line>tbody>tr>td {
	border-bottom: 1px solid;
	
}

.Line2>tbody>tr>th {
	border-bottom: 1px solid;
	
}

.Line>tbody>tr>td:nth-child(1) { 
    width: 80%;
}

.loading {
 width: 100%;  
 height: 100%;  
 top: 0px;
 left: 0px;
 position: fixed;  
 display: block;  
 opacity: 0.7;  
 background-color: #fff;  
 z-index: 99;  
 text-align: center; } 
  
.loading img {  
 position: absolute;  
 top: 50%;  
 left: 50%; 
 z-index: 100; }

</style>

<section id="main-content">
	<section class="wrapper">
		<div class="col-lg-12 main-chart js_hame">
		
		
		<div class="loading">
		<img  src="${pageContext.request.contextPath}/sj/30.gif" alt="Loading...">
		</div>
		
			<div class="col-md-12 ds " >
			
			<div class="col-md-12 showback_b">
			<div class="col-md-4">
			<p class="DESC_KOR ANIMAL_PLANT"></p>
			</div>
		
			<button type="button" class="btn btn-primary col-md-1 col-md-offset-7" onclick="location='${pageContext.request.contextPath}/sj/Ingredient_up'">새 등록</button>
		</div>
	

				<div class="col-md-7 showback_b">
					
					
식품정보
<div class="col-md-12 showback_a">
<h5>식품요약</h5>
<table class="col-md-12 Line2">
  <tbody>
  <tr>
      <th>칼로리</th>
      <th>탄수화물</th>
      <th>단백질</th>
      <th>지방</th>      
    </tr>
    <tr>
      <td class="NUTR_CONT11"></td>
      <td class="NUTR_CONT12"></td>
      <td class="NUTR_CONT13"></td>
      <td class="NUTR_CONT14"></td>
    </tr>
  퍼센트
</table>



</div>

<div class="col-md-12 ">

<%-- <%@ include file="piece/upload.jsp" %> --%>

</div>

<ul>
<li>관련 식품</li>
<li><ul class="nav top-menu DESC_KOR2"></ul></li>
</ul>


					
					
				</div>
			<div class="col-md-5 " >
					<div class="col-md-12 showback_b" style=" background: #f5f5f5;">
						<div class="col-md-12 showback_a showback">						

<table class="col-md-12 Line">
  <thead >
    <tr>
      <th>영양정보</th>
      <th></th>
    </tr>
  </thead>
  <tbody>
   <tr>
      <td>1회제공량 (g)</td>
      <td class="SERVING_WT"></td>
    </tr>
    <tr>
      <td>열량 (kcal)</td>
      <td class="NUTR_CONT1"></td>
    </tr>
    <tr>
      <td>탄수화물 (g)</td>
      <td class="NUTR_CONT2"></td>
    </tr>
    <tr>
      <td>단백질 (g)</td>
      <td class="NUTR_CONT3"></td>
    </tr>
    <tr>
      <td>지방 (g)</td>
      <td class="NUTR_CONT4"></td>
    </tr>
    <tr>
      <td>당류 (g)</td>
      <td class="NUTR_CONT5"></td>
    </tr>
    <tr>
      <td>나트륨 (mg)</td>
      <td class="NUTR_CONT6"></td>
    </tr>
    <tr>
      <td>콜레스테롤 (mg)</td>
      <td class="NUTR_CONT7"></td>
    </tr>
     <tr>
      <td>포화지방산 (g)</td>
      <td class="NUTR_CONT8"></td>
    </tr>
  </tbody>
  <tfoot>
    <tr>
      <td>트랜스지방산 (g)</td>
      <td class="NUTR_CONT9"></td>
    </tr>
  </tfoot>
</table>													
						</div>
					</div>
				</div>				
			</div>
			
			
	
		</div>
	</section>
</section>
          <%@ include file="js/js.jspf" %>
          


<script>


$(function() {
	
   var value = "${list}";    
   if( value == '[]' ){
       /*-----------------------------------------------  */
       
	var desc_kors = '${desc_kor}';
	
	 $(".search").empty(); 

	$.get("${pageContext.request.contextPath}/sj/xml", {
		desc_kor : desc_kors,
		
	}, function(data) {
		var obj = data;
		
		var jq_obj = $(obj);		
		var item = jq_obj.find("item"); 
		var DESC_KOR = item.find("DESC_KOR");
		
		console.log(obj);
		/* console.log("items의 개수 : " + items.length); */
		console.log("item의 개수 : " + item.length);
		console.log("DESC_KOR의 개수 : " +DESC_KOR.length); 	
		console.log("DESC_KOR [0] : " +$(DESC_KOR[0]).text());
		
		if (item.length == 0) {
		/* 	$(".DESC_KOR").append("<p>검색 결과 없음</p>"); */
			 alert('식품데이터 없음'); 
			 location.replace('${pageContext.request.contextPath}/sj/Ingredient_up'); 
		} else {
			 $(".loading").hide(); 
			$(".DESC_KOR").append($(DESC_KOR[0]).text());

            $(".SERVING_WT").append($(item.find("SERVING_WT")[0]).text());
			$(".NUTR_CONT1").append($(item.find("NUTR_CONT1")[0]).text());
			$(".NUTR_CONT2").append($(item.find("NUTR_CONT2")[0]).text());
			$(".NUTR_CONT3").append($(item.find("NUTR_CONT3")[0]).text());
			$(".NUTR_CONT4").append($(item.find("NUTR_CONT4")[0]).text());
			$(".NUTR_CONT5").append($(item.find("NUTR_CONT5")[0]).text());
			$(".NUTR_CONT6").append($(item.find("NUTR_CONT6")[0]).text());
			$(".NUTR_CONT7").append($(item.find("NUTR_CONT7")[0]).text());
			$(".NUTR_CONT8").append($(item.find("NUTR_CONT8")[0]).text());
			$(".NUTR_CONT9").append($(item.find("NUTR_CONT9")[0]).text());
			$(".ANIMAL_PLANT").append($(item.find("ANIMAL_PLANT")[0]).text());
			
			$(".NUTR_CONT11").append($(item.find("NUTR_CONT1")[0]).text());
			$(".NUTR_CONT12").append($(item.find("NUTR_CONT2")[0]).text());
			$(".NUTR_CONT13").append($(item.find("NUTR_CONT3")[0]).text());
			$(".NUTR_CONT14").append($(item.find("NUTR_CONT4")[0]).text());
			
			for (var i = 1; i < 5; i++) {
				$(".DESC_KOR2").append('<li><a href="${pageContext.request.contextPath}/sj/Ingredient/'+$(DESC_KOR[i]).text()+'">'+$(DESC_KOR[i]).text()+'</a></li>');			
			}
		}		
	});
       /*-----------------------------------------------  */
    } else {
       /* alert('db에 데이터있음'); */ 
       $(".loading").hide(); 
       <c:forEach items="${list}" var="list">
       
       var list = "${list}";
       var F_NO = "${list.F_NO}";
       var DESC_KOR = "${list.DESC_KOR}";
       var MN = "${list.MN}";
       var SERVING_WT = "${list.SERVING_WT}";
       var NUTR_CONT1 = "${list.NUTR_CONT1}";
       var NUTR_CONT2 = "${list.NUTR_CONT2}";
       var NUTR_CONT3 = "${list.NUTR_CONT3}";
       var NUTR_CONT4 = "${list.NUTR_CONT4}";
       var NUTR_CONT5 = "${list.NUTR_CONT5}";
       var NUTR_CONT6 = "${list.NUTR_CONT6}";
       var NUTR_CONT7 = "${list.NUTR_CONT7}";
       var NUTR_CONT8 = "${list.NUTR_CONT8}";
       var NUTR_CONT9 = "${list.NUTR_CONT9}";
       </c:forEach>
       
       $(".list").append(list);
       $(".F_NO").append(F_NO);
       $(".DESC_KOR").append(DESC_KOR);
       $(".MN").append(MN);
       $(".SERVING_WT").append(SERVING_WT);
       $(".NUTR_CONT1").append(NUTR_CONT1);
       $(".NUTR_CONT2").append(NUTR_CONT2);
       $(".NUTR_CONT3").append(NUTR_CONT3);
       $(".NUTR_CONT4").append(NUTR_CONT4);
       $(".NUTR_CONT5").append(NUTR_CONT5);
       $(".NUTR_CONT6").append(NUTR_CONT6);
       $(".NUTR_CONT7").append(NUTR_CONT7);
       $(".NUTR_CONT8").append(NUTR_CONT8);
       $(".NUTR_CONT9").append(NUTR_CONT9);
     
       $(".NUTR_CONT11").append(NUTR_CONT1);
		$(".NUTR_CONT12").append(NUTR_CONT2);
		$(".NUTR_CONT13").append(NUTR_CONT3);
		$(".NUTR_CONT14").append(NUTR_CONT4);
    }
   
   
});
</script>