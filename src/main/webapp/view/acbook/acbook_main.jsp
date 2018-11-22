<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 가계부 서브메뉴 인클루즈 -->
    <%@ include file="acbook_submenu.jspf" %>
    
    
    <!-- **********************************************************************************************************************************************************
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->
    <!--main content start-->
    <style>
    .fc-header-title h2 {
    color: #797979;
    }
    .fc-button-month, .fc-button-basicWeek, .fc-button-basicDay, .fc-button-today {
    display: none;
    }
    </style>
    <section id="main-content">
      <section class="wrapper">
        <h3><i class="fa fa-angle-right"></i> 가계부 달력</h3>
        <!-- page start-->
        <div class="row mt">
        <aside class="col-lg-2 mt"></aside>
          <aside class="col-lg-8 mt">
            <section class="panel">
              <div class="panel-body">
                <div id="ac_cal" class="has-toolbar"></div>
              </div>
            </section>
          </aside>
        <aside class="col-lg-2 mt"></aside>
        </div>
        <!-- page end-->
      </section>
      <!-- /wrapper -->
    </section>
    <!-- /MAIN CONTENT -->
    <!--main content end-->
    
      <!-- 가계부 자바스크립트 인클루드 -->
    <%@ include file="acbook_js.jspf" %>
    
    <script>
    $("#ac_sub_1").addClass("active");
    $("#ac_sub_calendar").addClass("active");
    
   ac_cal();
   ac_cal_data();
   $(".fc-button").click(function(){
	   ac_cal_data();
   });
   
   function ac_cal_data(){
	   var events = [];
	   //현재 보여지는 달력의 날짜를 구한다.
	   var date = $("#ac_cal").fullCalendar('getDate');
	   var y = date.getFullYear();
	   var m = date.getMonth() + 1;
	   //month_int : 1~12
	   //DB에서 해당 달의 메모, 수입, 지출합계 리스트를 가져와서 달력에 뿌린다.
	   $.ajax({
	    	 type : 'POST',
	    	 dataType: "json",
	    	 headers: { 
		            Accept : "text/plain; charset=utf-8"
		        },
	    	 url : '/cally/acbook/ac_cal', 
	    	 data : {
	    		 'year' : y,
	    		 'month' : m
	    	 },
	    	 success : function(Data){
	    		 $("#ac_cal").fullCalendar('removeEvents');
	    		 var ml = $(Data[0]); // ml : 메모리스트
	    	        $(ml).each(function(idx, e) {
	    	           events.push({
	    	              title: e.MEMO_VALUE,
	    	              start: e.MEMO_DATE,
	    	              color : '#fff',
	    	              textColor: '#777'
	    	            });
	    	        });
	    	        
		    	var il = $(Data[1]); // il : 수입리스트
		    	      $(il).each(function(idx, e) {
		    	           events.push({
		    	              title: '(＋) ' + commas(e.DET_MONEY),
		    	              start: e.DET_DATE,
		    	              color : '#fff',
		    	              textColor : '#4ECDC4'
		    	            });
		    	        });
		    	        
		    	 var el = $(Data[2]); // el : 지출리스트
		    	      $(el).each(function(idx, e) {
		    	           events.push({
		    	              title: '(－) ' + commas(e.DET_MONEY),
		    	              start: e.DET_DATE,
		    	              color : '#fff',
		    	              textColor : '#ac92ec'
		    	            });
		    	        });
	    	        $("#ac_cal").fullCalendar('addEventSource', events);
	    	 },
	    	 error : function(){
	    		 alert("달력에러");
	    	 }
	     });
   }
   
   function ac_cal() {
	   $('#ac_cal').fullCalendar({
       header: {
           left: 'prev,next today',
           center: 'title',
           right: 'month,basicWeek,basicDay'
       },
       editable: false,
       droppable: false,
       eventRender: function(event, element) {
    	     $(element).tooltip({title: event.tooltip});
    	 }// this allows things to be dropped onto the calendar !!!
      
   });
   };
    
    $(".fc-widget-content").click(function(){
    	if($(this).hasClass("fc-other-month")){
    		return false;
    	}
    	var ymbefore = $(document).find("h2").text();
    	var ym = ymbefore.split(" ");
    	var month = 0;
    	var montharr = ["January", "Feburary", "March", "April",
    		"May", "June", "July", "August", "September",
    		"October", "November", "December"];
    	for(var i=0; i<montharr.length; i++){
    		if(ym[0] == montharr[i]){
    			month = i+1;
    			break;
    		}
    	}
    	var year = ym[1];
    	var day = $(this).find(".fc-day-number").text();

    	$(location).attr("href",getContextPath()+"/acbook/dailypage?year=" + year +"&month=" + month + "&day=" + day);
    	
    });
    
    </script>