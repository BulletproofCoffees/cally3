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
<%@ include file="js/js.jspf" %>
<link href='${pageContext.request.contextPath}/sj/fullcalendar/fullcalendar.min.css' rel='stylesheet' />
<link href='${pageContext.request.contextPath}/sj/fullcalendar/fullcalendar.print.min.css' rel='stylesheet' media='print' />
<script src='${pageContext.request.contextPath}/sj/fullcalendar/moment.min.js'></script>
<%-- <script src='${pageContext.request.contextPath}/sj/fullcalendar/jquery.min.js'></script> --%>
<script src='${pageContext.request.contextPath}/sj/fullcalendar/fullcalendar.min.js'></script>
<style>
#calendar {
	max-width: 900px;
	margin: 0 auto;
}

#calendar {
	color: #777;
}
.fc-event, .fc-event-dot {
    background-color: #fff5a6;
    height: 50px;
}

.fc-event {border: 1px solid #fff5a6; color: #777; }

.fc-event {font-size: 25px;}
</style>

<script>

var daycal = []; 
$.ajax({
	url : "${pageContext.request.contextPath}/sj/days",
	type : 'POST',
	dataType : 'json',
	success : function(data) {	
		var obj = data;
		 var a = obj[0];
		 
		 $(a).each(function(day,e){
		  var test = {
				    title: e.CAL+'cal',
					start: e.DAY,
					url: '${pageContext.request.contextPath}/sj/counter/='+e.DAY,
				};
		  daycal.push(test); 
		
		 });		 
		 $(document).ready(function() {			  
			  $('#calendar').fullCalendar({			   
			    events: daycal
			  });
			  // 페이지 이동
			  $('td').on("click", function() {					
					 location.replace('${pageContext.request.contextPath}/sj/counter/='+$(this).find('.fc-day').attr("data-date")); 
				});
			
			});		
	}
});









	

</script>