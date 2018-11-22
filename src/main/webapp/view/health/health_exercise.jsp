<%@ include file="submenu.jspf"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript" src="app.js"></script>

<style>
.container {
text-align : center;
}
</style>

<section id="main-content">
	<section class="wrapper">
		<div class="container">
			<h1>홈트레이닝</h1>
			<hr />
			
			

<button class="btn btn-info btn-lg" onclick="test2()">전체</button>
			<c:forEach items="${exercise_code}" var="ec">
			
				<button value="${ec.HH_CODE}" name="HH_CODE"
					class="btn btn-info btn-lg" onclick="test(this.value)">${ec.HH_NAME}</button>
			</c:forEach>

			<br>

			<div id="player">
			<c:forEach items="${exercise}" var="ex">
			<div><aside class='col-lg-4 mt'>
			<iframe width='300' height='360' src='https://www.youtube.com/embed/${ex.H_KEY}' frameborder='0' 
			allow='accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture' allowfullscreen></iframe>
			<h5></h5></aside></div>
			</c:forEach>
			</div>
		

		</div>
	</section>
</section>


<script> 

function test2() {	
  	   var list = new Array(); 
	   <c:forEach items="${exercise}" var="ex">
	   list.push("${ex.H_KEY}");
	   </c:forEach>
		$('#player').empty();
        $('#player').append("<div><c:forEach var='i' begin='0' end='7' varStatus='status'><aside class='col-lg-4 mt'>"
        +"<iframe width='300' height='360' src='https://www.youtube.com/embed/"+ list[${i}] +"'"
		+"frameborder='0' allow='accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture' allowfullscreen>"
		+"</iframe><h5></h5></aside></c:forEach></div>");
}

function test(e){
	$.ajax({
		url : 'health_exercise',
		type : 'POST',
		data : {
			HH_CODE : e
		},success : function(data){
			
			$('#player').empty();
			console.log(data)

				for(var i in data){
				$('#player').append("<div><aside class='col-lg-4 mt'><iframe width='300' height='360' src='https://www.youtube.com/embed/"+ data[i].H_KEY +"'"
				+"frameborder='0' allow='accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture' allowfullscreen>"
				+"</iframe><h5>"+ data[i].H_TITLE +"</h5></aside></div>")
			    }
			
		
		},error : function(){
			alert('error')
		}

	})

}
</script>

<%@ include file="js.jspf"%>
