<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="toDay" class="java.util.Date" />
<!-- 내 프로젝트 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/callyPlus/business/biz_dhtmlxgantt.css"/>
<style>
	.biz_pj_div { width: 9%; display: inline-block; text-align: center }
</style>
<%@ include file="biz_sidemenu.jspf" %>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
<script>
	$('#biz_pjActive').addClass('active');
</script>
    <!--main content start-->
<section id="main-content">
      <section class="wrapper">
        <!-- page start-->
        <div class="chat-room mt" style="min-height: 793px;">
          <aside class="mid-side">
            <div class="chat-room-head">
              <h3>Project: Task<i class="fas fa-briefcase"></i></h3>
              <div class="pull-right">
              	<input type="text" id="pjtask_search" class="form-control " placeholder="Search" onkeypress="if( event.keyCode==13 ){go_pjtaskSearch();}" style="background: #34495e; border: #34495e; color: #fff">
              </div>
            </div>
                <div style="overflow: scroll; height:653px; overflow-x: hidden; width:100%;">
                 <div class="task-content panel-body">
                  <ul id="sortable" class="task-list ui-sortable">
                  <li style="height: 50px; text-align: left; background:#EDEDED">
                  	<div style="width: 20.5%; display: inline-block; margin-left: -20px">중요</div>
                  	<div style="width: 23.5%; display: inline-block;">업무명</div>
                  	<div style="width: 15%; display: inline-block;">시작일</div>
                  	<div style="width: 13.5%; display: inline-block;">종료일</div>
                  	<div style="width: 11%; display: inline-block;">진행률</div>
                  	<div style="display: inline-block;">진행자</div>
                  </li>
                  <c:if test="${my_auth_code eq 0 || my_auth_code eq 1 || my_auth_code eq 2}">
                  	<c:forEach items="${task_list}" var="t">
                   		<fmt:parseDate var="ts" value="${t.TASK_START}" pattern="yyyy/MM/dd"/>
						<fmt:parseDate var="te" value="${t.TASK_END}" pattern="yyyy/MM/dd"/> 
						<fmt:formatDate var="t_start" value="${ts}" pattern="yyyyMMdd"/>
						<fmt:formatDate var="t_end" value="${te}" pattern="yyyyMMdd"/>
						<fmt:formatDate var="today" value="${toDay}" pattern="yyyyMMdd"/>
						<fmt:formatDate var="today_p" value="${toDay}" pattern="yyyy/MM/dd"/>
						<fmt:parseDate var="toDay_p" value="${today_p}" pattern="yyyy/MM/dd"/> 
						<fmt:parseNumber value="${toDay_p.time / (1000*60*60*24)}" integerOnly="true" var="nowDays" scope="request"/>
						<fmt:parseNumber value="${te.time / (1000*60*60*24)}" integerOnly="true" var="endDays" scope="request" />	
	                  	<input type="hidden" value="${t.PJ_T_CODE}" name="pj_t_code">
	                  	<c:choose>
	                  		<c:when test="${t.TASK_ATTAIN ne 100 && today > t_end}"><li class="list-danger"></c:when>
	                  		<c:when test="${t.TASK_ATTAIN ne 100 && today < t_end}">
	                  			<c:if test="${today > t_start || today eq t_start}"><li class="list-warning"></c:if> <!-- 진행중 -->
	                  			<c:if test="${today < t_start}"><li class="list-success"></c:if> <!-- 진행중 -->	                  			
	                  		</c:when>
	                  		<c:when test="${t.TASK_ATTAIN ne 100 && today eq t_end}"><li class="list-danger"></c:when>
	                  		<c:when test="${t.TASK_ATTAIN eq 100}"><li class="list-primary"></c:when>
	                  	</c:choose>
	                  	<c:if test="${t.TASK_IMPORTANT == 'y'}"><i class="fa fa-star" style="color:#f78a09"></i></c:if>
	                  	<c:if test="${t.TASK_IMPORTANT == 'n'}"><i class="fa fa-star"></i></c:if>
                      	<div class="task-title">
                      	<div style="width: 40%; display: inline-block;">
                        	<span class="task-title-sp biz_pointer" onclick="task_detail(${t.PJ_T_CODE}, ${t.MEM_NUM}, ${t.AUTH_CODE})" style="margin-left:10px"> ${t.TASK_TITLE}</span>
	                  		<c:choose>
	                  			<c:when test="${t.TASK_ATTAIN ne 100 && today > t_end}"><span class="badge bg-important">+ ${nowDays - endDays} Days</span></c:when>
	                  			<c:when test="${t.TASK_ATTAIN ne 100 && today < t_end}">
	                  				<c:if test="${today > t_start or today eq t_start}"><span class="badge bg-warning">${endDays - nowDays} Days</span></c:if>
	                  				<c:if test="${today < t_start}"><span class="badge bg-success">${endDays - nowDays} Days</span></c:if>                  			
	                  			</c:when>
	                  			<c:when test="${t.TASK_ATTAIN ne 100 && today eq t_end}"><span class="badge bg-warning">Today</span></c:when>
	                  			<c:when test="${t.TASK_ATTAIN eq 100}"><span class="badge bg-theme">완료</span></c:when>
	                  		</c:choose>
                        </div>
                        <div style="width: 15%; display: inline-block;">
                        	<fmt:formatDate var="t_start_f" value="${ts}" pattern="YYYY/MM/dd HH:mm"/>
                        	<span>${t_start_f}</span>
                        </div>
                        <div style="width: 15%; display: inline-block;">
							<fmt:formatDate var="t_end_f" value="${te}" pattern="YYYY/MM/dd HH:mm"/>
                        	<span>${t_end_f}</span>
                        </div>
                        <div style="width: 5%; display: inline-block; text-align: center">
                        	<span>${t.TASK_ATTAIN}<c:if test="${t.TASK_ATTAIN eq null}">0</c:if>%</span>
                        </div>
                        <div style="display: inline-block; width: 15%; text-align: left; padding-left: 80px">
                        	<span>${t.MEM_NAME}</span><span>(${t.MEM_ID})</span>
                        </div>
                        <div style="display: inline-block; text-align: right; margin-right: 10px" class="pull-right">
                        	<c:choose>
                        	<c:when test="${my_auth_code eq 0}">
                        		<c:if test="${title == '수락대기'}">
                      				<button class="btn btn-info btn-xs fa fa-check task_statePop" onclick="task_stateUp_pop(this, ${t.PJ_T_CODE}, ${pj_code})"></button>
                        		</c:if>
                          			<button class="btn btn-primary btn-xs fas fa-pencil-alt" onclick="task_detail(${t.PJ_T_CODE}, ${t.MEM_NUM}, ${t.AUTH_CODE})"></button>
                          			<button class="btn btn-danger btn-xs far fa-trash-alt" onclick="task_del(${t.PJ_T_CODE})"></button>
                      		</c:when>
                        	<c:when test="${my_auth_code eq 1}">
                        		<c:if test="${t.MEM_NUM eq loginUser.mem_num or t.AUTH_CODE eq 2}">
                        		<c:if test="${title == '수락대기'}">
                      				<button class="btn btn-info btn-xs fa fa-check task_statePop" onclick="task_stateUp_pop(this, ${t.PJ_T_CODE}, ${pj_code})"></button>
                        		</c:if>
	                      			<button class="btn btn-primary btn-xs fas fa-pencil-alt" onclick="task_detail(${t.PJ_T_CODE}, ${t.MEM_NUM}, ${t.AUTH_CODE})"></button>
	                     			<button class="btn btn-danger btn-xs far fa-trash-alt" onclick="task_del(${t.PJ_T_CODE})"></button>
                        		</c:if>
                      		</c:when>
                       		<c:when test="${my_auth_code eq 2}">
                      			<c:if test="${t.MEM_NUM eq loginUser.mem_num}">
                          			<button class="btn btn-primary btn-xs fas fa-pencil-alt" onclick="task_detail(${t.PJ_T_CODE}, ${t.MEM_NUM}, ${t.AUTH_CODE})"></button>
                         			<button class="btn btn-danger btn-xs far fa-trash-alt" onclick="task_del(${t.PJ_T_CODE})"></button>
                      			</c:if>
                      		</c:when>
                       		</c:choose>
                      	</div>
                        </div>
                    </li>
                  	</c:forEach>
                  	</c:if>
                  	<c:if test="${my_auth_code eq 3 || my_auth_code eq 4 || my_auth_code eq null}">
                  		<li class="list-danger"><i class="fas fa-exclamation-triangle" style="color:#ed5565"></i>접근권한이 없습니다</li>
                  	</c:if>
                  </ul>
                 </div>
                </div>
              <footer>
                <div class=" add-task-row">
               <c:if test="${my_auth_code eq 0 || my_auth_code eq 1 || my_auth_code eq 2}">
                  <a class="btn btn-success btn-sm pull-left" onclick="task_add_modal_show()">새 업무작성</a>
                  <c:if test="${my_auth_code eq 0 || my_auth_code eq 1}">
                  	<a class="btn btn-default btn-sm pull-right" href="task?pj_code=${pj_code}&state=n">수락대기</a>
                  	<a class="btn btn-default btn-sm pull-right" href="pj_mytask?pj_code=${pj_code}&state=y">나의업무</a>
                  	<a class="btn btn-default btn-sm pull-right" href="task?pj_code=${pj_code}&state=y">전체업무</a>
                  </c:if>
                  <c:if test="${my_auth_code eq 2}">
                  	<a class="btn btn-default btn-sm pull-right" href="pj_mytask?pj_code=${pj_code}&state=n">수락대기</a>
                  	<a class="btn btn-default btn-sm pull-right" href="pj_mytask?pj_code=${pj_code}&state=y">나의업무</a>
                  	<a class="btn btn-default btn-sm pull-right" href="task?pj_code=${pj_code}&state=y">전체업무</a>
                  </c:if>
               </c:if>
                </div>
              </footer>
          </aside>
            <%@ include file="biz_share.jspf" %>
        </div>
        <!-- page end-->
      </section>
      <!-- /wrapper -->
    </section>
    <%@ include file="js.jspf" %>
	<script>
	
	//프로젝트 내 업무 검색
	function go_pjtaskSearch(){
		var pj_code = "${pj_code}";
		var search = $('#pjtask_search').val();
		location.href="pjtask_search?pj_code="+pj_code+"&search="+search;
	}
	
	//업무 승인
		function task_stateUp_pop(btn, pj_t_code, pj_code){
			$(btn).popover({
				title: '승인하시겠습니까?',
			    content: '<div style="text-align:center"><button class="btn btn-default btn-xs" onclick="task_stateUp_pop_hide()">닫기</button>  <button class="btn btn-info btn-xs" onclick="task_stateUp('+ pj_t_code +',' + pj_code + ')">승인</button></div>',
			    selector: true,
			    placement: 'bottom',
			    html: true
			});
		}
		
	//업무 승인 ajax
		function task_stateUp(pj_t_code, pj_code){
	  		$.ajax({
				type : 'POST',
				url : '/cally/business/task_state_up',
				data : {'pj_t_code':pj_t_code, 'pj_code':pj_code},
				dataType : 'text',
				success : function(result){
					if(result == 'y'){
						alert("업무를 승인하였습니다.");
						location.reload();
					}
				}, error : function(){
					alert("승인을 실패했습니다.");
				}
			});
		}
		
		function task_stateUp_pop_hide(){
			$('.task_statePop').popover('hide');
		}
		
		
	//업무삭제
	function task_del(pj_t_code){
		var pj_code = "${pj_code}";
		if(confirm("업무내역을 삭제하시겠습니까?")) {
	 		$.ajax({
				type : 'POST',
				url : '/cally/business/task_del',
				data : {'pj_t_code':pj_t_code},
				dataType : 'text',
				success : function(result){
					if(result == 'y'){
						alert("업무가 삭제되었습니다.");
						location.href = "task?pj_code="+pj_code;
					}
					
				}
			});
		}
		
	}
	
	//코멘트 삭제
		function cmt_delete(cmt_code){
			if (confirm("삭제하시겠습니까?")) {
				location.href = 'cmt_delete?cmt_code='+cmt_code;
			}
		}
		
      	function task_add_modal_show(){
     		$("#t_add_modal #pj_code").val("${pj_code}");
      		$('#t_add_modal').modal('show');
      	}
      	
      	
      	function task_detail(code, mem_num, auth_code){
      		my_auth_code = '${my_auth_code}';
      		my_mem_num = '${loginUser.mem_num}';
	      	var url = "/cally/business/task_detail";
	      	var type = "t";
	      	var data = {"code" : code, "mem_num" : mem_num};
 	      	if(my_mem_num != mem_num){
	      		if(my_auth_code >= auth_code){
	      			$('#modal_t_detail_btn').attr('disabled', true);
	      		}
	      	}
	      	 
	      	biz_cal_click(url, data, type);
	   }
      	
	</script>