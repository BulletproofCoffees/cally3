<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 내 캘린더 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/callyPlus/business/biz_dhtmlxgantt.css"/>
<%@ include file="biz_sidemenu.jspf" %>
<script>
	$('#biz_calActive').addClass('active');
</script>
	<section id="main-content">
      <section class="wrapper">
        <h3><i class="fa fa-angle-right"></i> 내 캘린더</h3>
        <!-- page start-->
        <div class="row mt">
          <aside class="col-lg-2 mt"></aside>
          <aside class="col-lg-8 mt">
            <section class="panel">
              <div class="panel-body">
                <div id="biz_cal" class="has-toolbar"></div>
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
    <%@ include file="js.jspf" %>
    <script>
    var events = [];
    $.ajax({ 
    	url: '/cally/business/mycalendar',
        type: 'POST',
        dataType : 'json',
    	success: function(data) {
    		var cal = $(data);
            $(cal).each(function(idx, e) {
            	events.push({
                  id: 'c'+e.CAL_CODE,
                  title: e.CAL_TITLE,
                  start: e.CAL_START,
                  end: e.CAL_END
                });
               });
            biz_cal();
    	},
        error: function() {
             alert('등록된 일정이 없습니다.');
        } 
    });
    
    </script>