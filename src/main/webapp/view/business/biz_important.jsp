<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 중요일정 -->
<%@ include file="biz_sidemenu.jspf" %>
<script>
	$('#biz_im_active').addClass('active');
</script>
<!--main content start-->
    <section id="main-content">
      <section class="wrapper">
        <h3><i class="fa fa-angle-right"></i> 중요일정</h3>
        <!-- page start-->
        <div class="row mt" style="margin: 0 auto">
          <aside class="col-lg-2 mt"></aside>
          <aside class="col-lg-8 mt" style="margin: 0 auto">
          <table class="biz_title_table">
          	<tr>
          		<td width="33%"><a id="biz_im_all" class="biz_aTag biz_aTag_active" href="important">전체</a></td>
          		<td width="33%"><a class="biz_aTag" onclick="biz_mycal_im(this)">캘린더</a></td>
          		<td><a class="biz_aTag" onclick="biz_mytask_im(this)">프로젝트</a></td>
          	</tr>
          </table><br>
            <section class="panel">
              <div class="panel-body">
                <div id="biz_cal" class="has-toolbar"></div>
              </div>
            </section>
          </aside>
          <aside class="col-lg-2 mt">              
     </aside>
        </div>
        <!-- page end-->
      </section>
      <!-- /wrapper -->
    </section>
    <!-- /MAIN CONTENT -->
    <!--main content end-->
    
    <script>
    var events = [];
    $.ajax({
    	url: '/cally/business/important_all',
        type: 'POST',
        dataType : 'json',
    	success: function(data) {
    		var cal_im = $(data[0]);
    		var task_im = $(data[1]);
            $(cal_im).each(function(idx, e) {
            	events.push({
                  id: 'c'+e.CAL_CODE,
                  title: e.CAL_TITLE,
                  start: e.CAL_START,
                  end: e.CAL_END
                });
               });
            $(task_im).each(function(idx, e) {
            	events.push({
                  id: 't'+e.PJ_T_CODE,
                  title: e.TASK_TITLE,
                  start: e.TASK_START,
                  end: e.TASK_END,              
    			  color : '#'+e.R_C_COLOR
                });
               });
            biz_cal();
    	},
        error: function() {
             alert('등록된 일정이 없습니다.');
        }
    });

    function biz_mycal_im(cal){
    	$('#biz_cal').empty();
    	$('.biz_aTag').removeClass('biz_aTag_active');
    	$(cal).addClass('biz_aTag_active');
    	events = [];
    	$.ajax({ 
        	url: '/cally/business/important_cal',
            type: 'POST',
            dataType : 'json',
        	success: function(data) {
        		var cal_im = $(data);
                $(cal_im).each(function(idx, e) {
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
    }
    
    function biz_mytask_im(task){
    	$('#biz_cal').empty();
    	$('.biz_aTag').removeClass('biz_aTag_active');
    	$(task).addClass('biz_aTag_active');
    	events = [];
    	$.ajax({ 
        	url: '/cally/business/important_task',
            type: 'POST',
            dataType : 'json',
        	success: function(data) {
        		var task_im = $(data);
                $(task_im).each(function(idx, e) {
                	events.push({
                      id: 't'+e.PJ_T_CODE,
                      title: e.TASK_TITLE,
                      start: e.TASK_START,
                      end: e.TASK_END,              
        			  color : '#'+e.R_C_COLOR
                    });
                   });
                biz_cal();
        	},
            error: function() {
                 alert('등록된 일정이 없습니다.');
            } 
        });
    }
    
    </script>
    <%@ include file="js.jspf" %>