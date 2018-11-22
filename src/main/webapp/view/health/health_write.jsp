<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="submenu.jspf" %>



<section id="main-content">
	<section class="wrapper">
		<div class="col-lg-12 main-chart js_hame ">
<!-- ------------------------------------------------------- -->
        <aside class="col-lg-12 mt showback">
        
         <div id='calendar'></div> 
        
          </aside>
               
     
<!-- ------------------------------------------------------- -->			
		</div>
	</section>
</section>

<link href='${pageContext.request.contextPath}/sj/fullcalendar/fullcalendar.min.css' rel='stylesheet' />
<link href='${pageContext.request.contextPath}/sj/fullcalendar/fullcalendar.print.min.css' rel='stylesheet' media='print' />
<script src='${pageContext.request.contextPath}/sj/fullcalendar/moment.min.js'></script>
<%-- <script src='${pageContext.request.contextPath}/sj/fullcalendar/jquery.min.js'></script> --%>
<script src='${pageContext.request.contextPath}/sj/fullcalendar/fullcalendar.min.js'></script>
<style>
#calendar {
	/* max-width: 900px; */
	margin: 0 auto;
}

#calendar {
	color: #777;
}
.fc-event, .fc-event-dot {
    TEXT-ALIGN : CENTER;
    background-color: #fff5a6;
    height: auto;
}

.fc-event {border: 1px solid #fff5a6; color: #777; }

.fc-event {font-size: 13px;}
</style>

<script>


 var daycal = []; 
$.ajax({
	url : "${pageContext.request.contextPath}/health/health_calorie2",
	type : 'POST',
	dataType : 'json',
	success : function(data) {	
		var obj = data;
		 var a = obj[0];
		 console.log(a);
		  $(a).each(function(day,e){
		  var test = {
				    title: '\n 몸무게 : ' + e.C_WEIGHT + 'kg \n' + '기초대사량  : ' 
				    + e.C_BASIC_MET + 'kcal \n' + '활동대사량  : ' + e.C_ACTIVE_MET 
				    + 'kcal \n' + '소화대사량  : ' + e.C_DIGEST_MET + 'kcal \n' + 'BMI : ' + e.B_BMI ,
					start: e.C_INDATE,
					/* url: '${pageContext.request.contextPath}/health/health_calorie_result/='+e.C_INDATE, */
				};
		  daycal.push(test); 
		  console.log(daycal);
		
		 });	 
		  $(document).ready(function() {			  
			  $('#calendar').fullCalendar({			   
			  events: daycal
			  });
			  // 페이지 이동
/* 			  $('td').on("click", function() {					
					 location.replace('${pageContext.request.contextPath}/health/health_calorie_result/='+$(this).find('.fc-day').attr("data-date")); 
				}); */
			
			});		 
	}
});

</script>