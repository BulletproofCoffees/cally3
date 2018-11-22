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
        <h3><i class="fa fa-angle-right"></i> 내 업무내역</h3>
        <!-- page start-->
        <div class="row mt mb">
          <div class="col-md-12">
            <section class="task-panel tasks-widget">
              <div class="panel-heading">
                <div class="pull-left">
                  <h5><i class="fa fa-tasks"></i> ${title}</h5>
                 </div>
                 <div class="pull-right">
                   <input type="text" id="mytask_search" class="form-control" placeholder="Search Project" onkeypress="if( event.keyCode==13 ){go_mytaskSearch();}">
                </div>
                <br>
              </div>
              <div class="panel-body">
                <div class="task-content">
                  <ul id="sortable" class="task-list ui-sortable" style="overflow: scroll; max-height:653px; overflow-x: hidden;">
                  <li style="height: 50px; text-align: left; background:#EDEDED">
                  	<div style="width: 14%; display: inline-block; margin-left: -20px">중요</div>
                  	<div style="width: 25.5%; display: inline-block;">업무명</div>
                  	<div style="width: 13%; display: inline-block;">프로젝트</div>
                  	<div style="width: 13%; display: inline-block;">시작일</div>
                  	<div style="width: 13.3%; display: inline-block;">종료일</div>
                  	<div style="width: 8.5%; display: inline-block;">진행률</div>
                  	<div style="display: inline-block;">진행자</div>
                  </li>
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
                      	<div style="width: 30%; display: inline-block;">
                        	<span class="task-title-sp biz_pointer" onclick="location.href='task?pj_code=${t.PJ_CODE}&state=y'" style="margin-left:10px"> ${t.TASK_TITLE}</span>
	                  		<c:choose>
	                  			<c:when test="${t.TASK_ATTAIN ne 100 && today > t_end}"><span class="badge bg-important">+ ${nowDays - endDays} Days</span></c:when>
	                  			<c:when test="${t.TASK_ATTAIN ne 100 && today < t_end}">
	                  				<c:if test="${today > t_start || today eq t_start}"><span class="badge bg-warning">${endDays - nowDays} Days</span></c:if>
	                  				<c:if test="${today < t_start}"><span class="badge bg-success">${endDays - nowDays} Days</span></c:if>                  			
	                  			</c:when>
	                  			<c:when test="${t.TASK_ATTAIN ne 100 && today eq t_end}"><span class="badge bg-warning">toDay</span></c:when>
	                  			<c:when test="${t.TASK_ATTAIN eq 100}"><span class="badge bg-theme">완료</span></c:when>
	                  		</c:choose>
                        </div>
                        <div style="min-width: 20%; display: inline-block;">
                        	<span class="task-title-sp biz_pointer" onclick="location.href='pj_detail?pj_code=${t.PJ_CODE}'">${t.PJ_TITLE}</span>
                        </div>  
                        <div style="width: 13%; display: inline-block;">
                        	<fmt:formatDate var="t_start_f" value="${ts}" pattern="YYYY/MM/dd HH:mm"/>
                        	<span>${t_start_f}</span>
                        </div>
                        <div style="width: 13%; display: inline-block;">
							<fmt:formatDate var="t_end_f" value="${te}" pattern="YYYY/MM/dd HH:mm"/>
                        	<span>${t_end_f}</span>
                        </div>
                        <div style="width: 7%; display: inline-block; text-align: center">
                        	<span>${t.TASK_ATTAIN}<c:if test="${t.TASK_ATTAIN eq null}">0</c:if>%</span>
                        </div>
                        <div style="display: inline-block; width: 10%; text-align: center;">
                        	<span>${t.MEM_NAME}</span><span>(${t.MEM_ID})</span>
                        </div>
                        <div style="display: inline-block; text-align: right; margin-right: 10px" class="pull-right">
                          	<button class="btn btn-primary btn-xs fas fa-pencil-alt"></button>
                          	<button class="btn btn-danger btn-xs far fa-trash-alt" onclick="mytask_del(${t.PJ_T_CODE})"></button>
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