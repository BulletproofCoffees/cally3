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
              <h3>Project: Comments <i class="fas fa-comments"></i></h3>
              <form action="#" class="pull-right position">
                <input type="text" placeholder="Search" class="form-control" style="background: #34495e; border: #34495e; color: #fff">
              </form>
            </div>
            <c:if test="${my_auth_code eq 0 || my_auth_code eq 1 || my_auth_code eq 2}">
            <div id="cmt_div" style="overflow: scroll; height:653px; overflow-x: hidden;">
            <c:forEach items="${cmt_list}" var="cmt">
            	<div class="group-rom">
            	  <div class="first-part odd">
            	  	<c:choose>
            	  		<c:when test="${cmt.AUTH_CODE eq 0}"><i class="fas fa-crown"></i></c:when>
            	  		<c:when test="${cmt.AUTH_CODE eq 1}"><i class="fas fa-user-tie"></i></c:when>
            	  		<c:otherwise><i class="fa fa-user"></i></c:otherwise>
            	  	</c:choose>
            	  	${cmt.MEM_NAME}(${cmt.MEM_ID})
            	  </div>
            	  <div class="second-part">${cmt.CMT_CONTENT}</div>
              	  <div class="third-part">${cmt.CMT_DAY}
              	  	<c:if test="${cmt.MEM_ID eq loginUser.mem_id}">
              	  		<a onclick="cmt_del(${cmt.CMT_CODE}, ${cmt.PJ_CODE})" class="biz_aTag pull-right">
              	  		<i class="fas fa-times biz_i_red"></i></a>
              	  	</c:if>
              	  </div>
            	</div>
            </c:forEach>
            </div>
            <footer>
              <div class="chat-txt">
                <input type="text" class="form-control" id="cmt_content">
              </div>
              <button class="btn btn-theme" onclick="cmt_in(${pj_code})">작성</button>
            </footer>
           </c:if>
           <c:if test="${my_auth_code eq 3 || my_auth_code eq 4 || my_auth_code eq null}">
           	<ul id="sortable" class="task-list ui-sortable">
            	<li><i class="fas fa-exclamation-triangle" style="color:#ed5565"></i>접근권한이 없습니다</li>
           	</ul>
           </c:if>
          </aside>
			<%@ include file="biz_share.jspf" %>
        </div>
        <!-- page end-->
      </section>
      <!-- /wrapper -->
    </section>
    <%@ include file="js.jspf" %>
<script>
function cmt_del(cmt_code, pj_code){
	if (confirm("삭제하시겠습니까?")) {
		var data = {"cmt_code":cmt_code, "pj_code":pj_code};
		var url = '/cally/business/comment_del';
		var success = '코멘트를 삭제했습니다.'
		var error = '코멘트 삭제 실패';
		cmt_list(data, url, success, error);
	}
}

function cmt_in(pj_code){
	if (confirm("등록하시겠습니까?")) {
		var data = {"cmt_content":$('#cmt_content').val(), "pj_code":pj_code}
		var url = '/cally/business/comment_in';
		var success = '코멘트를 등록했습니다'
		var error = '코멘트 작성 실패';
		cmt_list(data, url, success, error);
	}
}

	function cmt_list(data, url, success, error){
		$.ajax({
	   		type : 'POST',
	   		url : url,
	   		data : data,
			dataType : 'json',
	   		success : function(cmt_list) {
	   			var c_l = $(cmt_list);
	   			var mem_id = "${loginUser.mem_id}";
	   			var list = "";
	   			$('#cmt_div').empty();
 	   			for (var i = 0; i < c_l.size(); i++) {
	   				list += '<div class="group-rom">';
	   				list += '<div class="first-part odd">';
	    			if(c_l[i].AUTH_CODE == 0){
	   					list += '<i class="fas fa-crown"></i>';
	   				} else if(c_l[i].AUTH_CODE == 1){
	   					list += '<i class="fas fa-user-tie"></i>';
	   				} else if(c_l[i].AUTH_CODE == 2){
	   					list += '<i class="fa fa-user"></i>';
	   				}
	    			list += ' ' + c_l[i].MEM_NAME + '(' + c_l[i].MEM_ID + ') ';
	    			list += '</div>';
	   				list += '<div class="second-part">' + c_l[i].CMT_CONTENT + '</div>';
	   				list += '<div class="third-part">' + c_l[i].CMT_DAY;
	   				if(c_l[i].MEM_ID == mem_id){
	   					list += '<a onclick="cmt_del(' + c_l[i].CMT_CODE + ', ' + c_l[i].PJ_CODE + ')" class="biz_aTag pull-right">';
	   					list += '<i class="fas fa-times biz_i_red"></i></a>';
	   				}
	   				list += '</div>';
	   				list += '</div>';
	   			}
	   			$('#cmt_div').append(list);	   			
	   			alert(success);
	   			$('#cmt_content').val("");
	   		},
	   		error: function(){
	   			alert(error);
	   		}
	   	});
	}
</script>