<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="toDay" class="java.util.Date" />
<!-- 내 프로젝트 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/callyPlus/business/biz_dhtmlxgantt.css"/>
<style>
	.biz_pj_div { width: 9%; display: inline-block; text-align: center }
</style>
<%@ include file="biz_sidemenu.jspf" %>
<script>
	$('#biz_pjActive').addClass('active');
</script>
    <!--main content start-->
    <section id="main-content" style="min-height: 898px;">
      <section class="wrapper">
        <h3><i class="fa fa-angle-right"></i> 알림</h3>
        <!-- page start-->
        <div class="row mt mb">
          <div class="col-md-12">
            <section class="task-panel tasks-widget">
              <div class="panel-heading">
                <div class="pull-left">
                  <h5><i class="fa fa-tasks"></i>전체 알림 내역</h5>
                 </div>
                 <div class="pull-right">
                   <input type="text" id="notice_search" class="form-control" placeholder="Search Notice" onkeypress="if( event.keyCode==13 ){go_noticeSearch();}">
                </div>
                <br>
              </div>
              <div class="panel-body" style="padding: 20px 30px">
                <div class="task-content">
                  <ul id="sortable" class="task-list ui-sortable" style="overflow: scroll; max-height:653px; overflow-x: hidden;">
                  <li style="height: 50px; text-align: left; background:#EDEDED">
                  	<div style="width: 2%; display: inline-block; margin-left: -20px"></div>
                  	<div style="width: 40%; display: inline-block;">발신자</div>
                  	<div style="width: 41%; display: inline-block;">내용</div>
                  	<div style="display: inline-block;">발신일</div>
                  </li>
                  	<c:forEach items="${notice_list}" var="n">
	                  	<input type="hidden" value="${n.USER_N_CODE}" name="user_n_code">
	                  	<c:choose>
	                  		<c:when test="${n.STATE_CODE == 1}"><li class="list-warning"></c:when>
	                  		<c:when test="${n.STATE_CODE == 2}"><li class="list-info"></c:when>
	                  		<c:when test="${n.STATE_CODE == 3}"><li class="list-primary" style="border-left-color: #337ab7"></c:when>
	                  		<c:when test="${n.STATE_CODE == 4}"><li class="list-success"></c:when>
	                  		<c:when test="${n.STATE_CODE == 5}"><li class="list-primary" style="border-left-color: #777"></c:when>
	                  		<c:when test="${n.STATE_CODE == 6}"><li class="list-danger"></c:when>
	                  	</c:choose>
	                  	<c:if test="${n.STATE_CODE == 1}"><i class="fas fa-envelope biz_i_yellow"></i></c:if>
	                  	<c:if test="${n.STATE_CODE == 2}"><i class="fas fa-envelope-open biz_i_sky"></i></c:if>
	                  	<c:if test="${n.STATE_CODE == 3}"><i class="fas fa-sign-in-alt biz_i_blue"></i></c:if>
	                  	<c:if test="${n.STATE_CODE == 4}"><i class="fas fa-laugh biz_i_green"></i></c:if>
	                  	<c:if test="${n.STATE_CODE == 5}"><i class="fas fa-frown-open biz_i_gray"></i></c:if>
	                  	<c:if test="${n.STATE_CODE == 6}"><i class="fas fa-sign-out-alt biz_i_red"></i></c:if>
                      	<div class="task-title">
                        <div style="min-width: 10%; display: inline-block; margin-left: 12px">
                        <c:choose>
                        	<c:when test="${n.SENDER_CODE eq null}"><span class="task-title-sp biz_pointer">알림</span></c:when>
                        	<c:otherwise><span class="task-title-sp biz_pointer">${n.SENDER_NAME}(${n.SENDER_ID})</span></c:otherwise>
                        </c:choose>
                        </div>  
                        <div id="notice_detail_div${n.USER_N_CODE}" style="min-width: 68%; display: inline-block;" onclick="notice_all_detail(this, ${n.USER_N_CODE})">
                        	<input type="hidden" id="user_n_code" name="user_n_code" value="${n.USER_N_CODE}">
                       		<input type="hidden" id="addressee_code" name="addressee_code" value="${n.ADDRESSEE_CODE}">
		                    <input type="hidden" id="sender_code" name="sender_code" value="${n.SENDER_CODE}">
		                    <input type="hidden" id="state_code" name="state_code" value="${n.STATE_CODE}">
		                    <input type="hidden" id="sender_id" name="sender_id" value="${n.SENDER_ID}">
		                    <input type="hidden" id="notice_date" name="notice_date" value="${n.NOTICE_DATE}">
		                    <input type="hidden" id="notice_content" name="notice_content" value="${n.NOTICE_CONTENT}">
		                    <input type="hidden" id="up_state_code" name="up_state_code" value="2">
                        <c:choose>
                        	<c:when test="${n.NOTICE_CONTENT eq null}"><span class="task-title-sp biz_pointer">내용이 없습니다.</span></c:when>
                        	<c:otherwise><span class="task-title-sp biz_pointer">${n.NOTICE_CONTENT}</span></c:otherwise>
                        </c:choose>
                        <c:if test="${n.STATE_CODE == 1}"><span class="badge bg-warning">New</span></c:if>
                        </div>
                        <div style="display: inline-block; width: 10%; text-align: center;">
                        	<span>${n.NOTICE_DATE}</span>
                        </div>
                        <div style="display: inline-block; text-align: right; margin-right: 10px" class="pull-right">
                        	<button class="btn btn-danger btn-xs far fa-trash-alt" onclick="notice_del(${n.USER_N_CODE})"></button>
                      	</div>
                        </div>
                    </li>
                  	</c:forEach>
                  </ul>
                </div>
                <c:if test="${title == '진행중인 업무내역'}">
                	<div class=" add-task-row biz_t_state" >
                  		<a class="btn btn-default btn-sm pull-right" onclick="mytask('n')">대기중 업무</a>
                	</div>
                </c:if>
                <c:if test="${title == '대기중인 업무내역'}">
                	<div class=" add-task-row biz_t_state">
                  		<a class="btn btn-default btn-sm pull-right" onclick="mytask('y')">진행중 업무</a>
                	</div>
                </c:if>
              </div>
            </section>
            <script type="text/javascript">
            	function mytask(state){
              		location.href = "mytask?state="+state;
            	}
            </script>
          </div>
          <!--/col-md-12 -->
        </div>
        <!-- page end-->
      </section>
      <!-- /wrapper -->
    </section>
    <!-- /MAIN CONTENT -->
    </section>
    <!--main content end-->
    <%@ include file="js.jspf" %>
<script>

//지난 알림 상세
function notice_all_detail(div, code){
	$("#notice_detail #user_n_code").val($(div).find('#user_n_code').val());
	$("#notice_detail #addressee_code").val($(div).find('#addressee_code').val());
	$("#notice_detail #sender_code").val($(div).find('#sender_code').val());
	$("#notice_detail #state_code").val($(div).find('#state_code').val());
	$("#notice_detail #sender_id").val($(div).find('#sender_id').val());
	$("#notice_detail #notice_date").text($(div).find('#notice_date').val());
	
	if($(div).find('#notice_content').val() == ""){
		$("#notice_detail #notice_content").val("내용이 없습니다."); 
	}else{
		$("#notice_detail #notice_content").val($(div).find('#notice_content').val());
	}
	
	if($("#notice_detail #state_code").val() == 1){
		$("#notice_detail #myModalLabel").text('메세지 알림');
	}else if($("#notice_detail #state_code").val() == 3){
		$("#notice_detail #myModalLabel").text('프로젝트 초대 알림'); 
		$("#notice_default_btn").attr('hidden', true);
		$("#notice_invite_btn").attr('hidden', false);
	 }else if($("#notice_detail #state_code").val() == 4){
		$("#notice_detail #myModalLabel").text('프로젝트 초대 - 수락 안내'); 
	 }else if($("#notice_detail #state_code").val() == 5){
		$("#notice_detail #myModalLabel").text('프로젝트 초대 - 거절 안내'); }
	  else if($("#notice_detail #state_code").val() == 6){
		$("#notice_detail #myModalLabel").text('프로젝트 퇴출 알림'); 
	 }
	if($('#notice_detail #sender_id').val() == ""){
		$('#sender_tr').attr('hidden', true);
	}else{
		$('#sender_tr').attr('hidden', false);
	}
	
	$("#notice_default_btn").attr('hidden', true);
	$("#notice_invite_btn").attr('hidden', true);
	$("#notice_detail").modal('show');
}



function notice_del(user_n_code){
	if(confirm("삭제하시겠습니까?")){
 		$.ajax({
			type : 'POST',
			url : '/cally/business/notice_del',
			data : {'user_n_code':user_n_code},
			dataType : 'text',
			success : function(result){
				if(result == 'y'){
					alert("알림이 삭제되었습니다.");
					location.href = "notice_all";
				}
				
			}
		});		
	}
}

function go_noticeSearch(){
	var search = $('#notice_search').val();
	location.href='notice_search?search='+search;
}

//나의 업무 검색
function go_mytaskSearch(){
	var search = $('#mytask_search').val();
	location.href="mytask_search?search="+search;
}

//업무삭제
function mytask_del(pj_t_code){
	if(confirm("업무내역을 삭제하시겠습니까?")) {
 		$.ajax({
			type : 'POST',
			url : '/cally/business/task_del',
			data : {'pj_t_code':pj_t_code},
			dataType : 'text',
			success : function(result){
				if(result == 'y'){
					alert("업무가 삭제되었습니다.");
					location.href = "mytask";
				}
				
			}
		});
	}
	
}
</script>