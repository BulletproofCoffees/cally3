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
                <div id="calendar" class="has-toolbar"></div>
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
    function getContextPath(){
        var offset=location.href.indexOf(location.host)+location.host.length;
        var ctxPath=location.href.substring(offset,location.href.indexOf('/',offset+1));
        return ctxPath;
    }
    
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
    
function appendMemo(){
    	$(".fc-day-content").append("<div style='position:relative'>"+
    			"<span>메모</span>"
    			+"</div>");
    }
    </script>