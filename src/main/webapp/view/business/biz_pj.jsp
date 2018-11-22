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
	var title = "${title}";
	if(title[0] == '전'){
		$('#biz_act_map').addClass('active');
	}else{
		$('#biz_act_mp').addClass('active');
	}
	
	function go_pjSearch(){
		var search = $('#pj_search').val();
		location.href='pj_search?search='+search;
	}
	
</script>
    <!--main content start-->
    <section id="main-content" style="min-height: 898px;">
      <section class="wrapper">
        <h3><i class="fa fa-angle-right"></i> 내 프로젝트</h3>
        <!-- page start-->
        <div class="row mt mb">
          <div class="col-md-12">
            <section class="task-panel tasks-widget">
              <div class="panel-heading">
                <div class="pull-left">
                  <h5><i class="fa fa-tasks"></i> ${title}</h5>
                 </div>
                 <div class="pull-right">
                   <input type="text" id="pj_search" class="form-control " placeholder="Search Project" onkeypress="if( event.keyCode==13 ){go_pjSearch();}">
                </div>
                <br>
              </div>
              <div class="panel-body">
                <div class="task-content">
                  <ul id="sortable" class="task-list ui-sortable" style="overflow: scroll; max-height:653px; overflow-x: hidden;">
                  <li style="height: 50px; text-align: left; background:#EDEDED">
                  	<div style="width: 18%; display: inline-block;">중요</div>
                  	<div style="width: 26%; display: inline-block;">프로젝트명</div>
                  	<div style="width: 9%; display: inline-block;">시작일</div>
                  	<div style="width: 7.8%; display: inline-block;">마감일</div>
                  	<div style="width: 9.5%; display: inline-block;">예상완료일</div>
                  	<div style="width: 10.5%; display: inline-block;">완료일</div>
                  	<div style="display: inline-block;">개설자</div>
                  </li>
                  	<c:forEach items="${pj_list}" var="p">
						<fmt:parseDate var="pe" value="${p.PJ_END}" pattern="yyyy/MM/dd"/> 
                        <fmt:parseDate var="ps" value="${p.PJ_START}" pattern="yyyy/MM/dd"/>
						<fmt:formatDate var="pj_end" value="${pe}" pattern="yyyyMMdd"/>
						<fmt:formatDate var="pj_start" value="${ps}" pattern="yyyyMMdd"/>
						<fmt:formatDate var="today" value="${toDay}" pattern="yyyyMMdd"/>
						<fmt:formatDate var="today_p" value="${toDay}" pattern="yyyy/MM/dd"/>
						<fmt:parseDate var="toDay_p" value="${today_p}" pattern="yyyy/MM/dd"/> 
						<fmt:parseNumber value="${toDay_p.time / (1000*60*60*24)}" integerOnly="true" var="nowDays" scope="request"/>
						<fmt:parseNumber value="${pe.time / (1000*60*60*24)}" integerOnly="true" var="endDays" scope="request" />	
                  	<input type="hidden" value="${p.SHARE_CODE}" name="share_code">
                  	<input type="hidden" value="${p.CREATOR_ID}" name="creator_id">
                  		<c:choose>
                  			<c:when test="${p.PJ_COMPLETE ne null}"><li class="list-primary"></c:when>
                  			<c:when test="${p.PJ_END eq null && p.PJ_PREDICT eq null}"><li class="list-inverse"></c:when>
                  			<c:when test="${p.PJ_END ne null && today <= pj_end}">
                  				<c:if test="${today eq pj_end}"><li class="list-danger"></c:if>
                        		<c:if test="${today < pj_end}"><li class="list-warning"></c:if>
                        	</c:when>
                  			<c:when test="${today > pj_end}"><li class="list-danger"></c:when>
                  			<c:when test="${p.PJ_COMPLETE eq null}"><li class="list-success"></c:when>
                  		 </c:choose>
                      	<i class=" fa fa-ellipsis-v"></i>
                      	<div class="task-checkbox">
                      	<c:choose>
                      		<c:when test="${p.AUTH_CODE == 0 || p.AUTH_CODE == 1}">
                      			<c:if test="${p.PJ_IMPORTANT == 'y'}"><input type="checkbox" class="list-child" value="y" checked="checked"></c:if>
                      			<c:if test="${p.PJ_IMPORTANT == 'n'}"><input type="checkbox" class="list-child" value="y"></c:if>
                      		</c:when>
                      		<c:when test="${p.PJ_IMPORTANT eq 'y' }">
                      			<input type="checkbox" class="list-child" value="" checked="checked" disabled="disabled">
                      		</c:when>
                      		<c:otherwise><input type="checkbox" class="list-child" value="" disabled="disabled"></c:otherwise>
                      	</c:choose>
                      	</div>
                      	<div class="task-title">
                      	<div style="width: 40%; display: inline-block;">
                        	<span class="task-title-sp biz_pointer" onclick="location.href='pj_detail?pj_code=${p.PJ_CODE}'">
                        	<c:if test="${p.PJ_SUMMARY eq null}">${p.PJ_TITLE}</c:if>
                        	<c:if test="${p.PJ_SUMMARY ne null}">${p.PJ_TITLE} - ${p.PJ_SUMMARY}</c:if>
                        	</span>
                        <c:choose>
                       		<c:when test="${p.PJ_COMPLETE ne null}"><span class="badge bg-theme">완료</span></c:when>
                        	<c:when test="${p.PJ_END eq null && p.PJ_PREDICT eq null}"><span class="badge" style="background: silver">마감일없음</span></c:when>
                        	<c:when test="${p.PJ_COMPLETE eq null && today < pj_start }"><span class="badge bg-success">진행중</span></c:when>
                        	<c:when test="${p.PJ_END ne null && today <= pj_end}">
                        		<c:if test="${today eq pj_end}"><span class="badge bg-important">Today</span></c:if>
                        		<c:if test="${today < pj_end}"><span class="badge bg-warning">- ${endDays - nowDays} Days</span></c:if>
                        	</c:when>
                        	<c:when test="${today > pj_end}"><span class="badge bg-important">+ ${nowDays - endDays} Days</span></c:when>
                        </c:choose>
                        </div>
                        <div class="biz_pj_div">
                        	<fmt:formatDate var="pj_start_f" value="${ps}" pattern="yyyy/MM/dd"/>
                        	<span>${pj_start_f}</span>
                        </div>
                        <div class="biz_pj_div">
                       		<c:if test="${p.PJ_END eq null}">-</c:if>
                       		<c:if test="${p.PJ_END ne null}">
								<fmt:formatDate var="pj_end" value="${pe}" pattern="yyyy/MM/dd"/>
                        		<span>${pj_end}</span>
                        	</c:if>
                        </div>
                        <div class="biz_pj_div">
                        	<c:if test="${p.PJ_PREDICT eq null}">-</c:if>
                       		<c:if test="${p.PJ_PREDICT ne null}">
                        		<fmt:parseDate var="pp" value="${p.PJ_PREDICT}" pattern="yyyy/MM/dd"/> 
								<fmt:formatDate var="pj_predict" value="${pp}" pattern="yyyy/MM/dd"/>
                        		<span>${pj_predict}</span>
                        	</c:if>
                        </div>
                        <div class="biz_pj_div">
                        	<c:if test="${p.PJ_COMPLETE eq null}">-</c:if>
                       		<c:if test="${p.PJ_COMPLETE ne null}">
                        		<fmt:parseDate var="pc" value="${p.PJ_COMPLETE}" pattern="yyyy/MM/dd"/> 
								<fmt:formatDate var="pj_complete" value="${pc}" pattern="yyyy/MM/dd"/>
                        		<span>${pj_complete}</span>
                        	</c:if>
                        </div>
                        <div style="display: inline-block; width: 13%; text-align: left; padding-left: 55px">
                        		<span>${p.CREATOR_NAME}</span><span>(${p.CREATOR_ID})</span>
                        </div>
                        <div class="pull-right" style="width: 8%; display: inline-block; text-align: center;">
                        		<c:choose>
                        		<c:when test="${p.AUTH_CODE == 0}">
                      				<button class="btn btn-info btn-xs fa fa-check biz_comPop" onclick="pj_completePop(this, ${p.PJ_CODE})"></button>
                          			<button class="btn btn-primary btn-xs fas fa-pencil-alt" onclick="location.href='pj_detail?pj_code=${p.PJ_CODE}'"></button>
                          			<button class="btn btn-danger btn-xs fa fa-trash-alt biz_delPop" onclick="pj_deletePop(this, ${p.PJ_CODE})"></button>
                      			</c:when>
                      			<c:when test="${p.AUTH_CODE == 1}">
                      				<button class="btn btn-info btn-xs fa fa-check biz_comPop" onclick="pj_completePop(this, ${p.PJ_CODE})"></button>
                        	  		<button class="btn btn-primary btn-xs fas fa-pencil-alt" onclick="location.href='pj_detail?pj_code=${p.PJ_CODE}'"></button>
                        	  		<button class="btn btn-danger btn-xs fa fa-trash-alt" disabled="disabled"></button>
                      			</c:when>
                      			<c:otherwise>
                      				<button class="btn btn-info btn-xs fa fa-check" disabled="disabled"></button>
                        	  		<button class="btn btn-primary btn-xs fas fa-pencil-alt" disabled="disabled"></button>
                          			<button class="btn btn-danger btn-xs fa fa-trash-alt" disabled="disabled"></button>
                      			</c:otherwise>
                        		</c:choose>
                      		</div>
                        </div>
                    	</li>
                  	</c:forEach>
                  </ul>
                </div>
                <div class=" add-task-row">
                  <a class="btn btn-success btn-sm pull-left" href="biz_pj_addForm">새 프로젝트</a>
                  <a class="btn btn-default btn-sm pull-right" href="mytask">전체 업무내역</a>
                </div>
              </div>
            </section>
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