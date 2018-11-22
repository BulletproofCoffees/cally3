<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="toDay" class="java.util.Date" />
<!-- 내 프로젝트 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
<style>
	#pj_up_form label { padding-left: 30px }
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
              <h3>Project: Detail</h3>
            </div>
            <div class="task-content panel-body">
                <form class="cmxform form-horizontal style-form" id="pj_up_form" enctype="multipart/form-data">
                <input type="hidden" name="mem_num" value="-1">
                <input type="hidden" name="my_auth_code" value="-1">
                <input type="hidden" name="share_code" value="-1">
                <input type="hidden" name="pj_code" value="${pj_code}">
                  <div class="form-group">
                  	<label class="control-label col-lg-2 ">진행률</label>
                  	<div class="col-lg-10">
                      <div class="progress"  style="height: 40px; margin: 0 auto">
                		<div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width:${pj_attain}%;">
                  			<span style="line-height:40px; font-size: 16px">${pj_attain}% Complete</span>
                		</div>
              		  </div>
              		</div>
              	  </div>
              		<div class="form-group ">
                    <label for="pj_title" class="control-label col-lg-2">제목</label>
                    <div class="col-lg-7">
                      <input class=" form-control" id="pj_title" name="pj_title" minlength="2" type="text" value="${pj_detail.pj_title}" required readonly="readonly"/>
                    </div>
                    <div class="col-lg-1">
                    	<label class="checkbox-inline">
                     		<c:if test="${pj_detail.pj_important eq 'y'.charAt(0)}">
                    			<input type="checkbox" id="pj_important" name="pj_important" value="y" checked="checked" disabled="disabled">
                    		</c:if>
                    		<c:if test="${pj_detail.pj_important eq 'n'.charAt(0)}">
                    			<input type="checkbox" id="pj_important" name="pj_important" value="y" readonly="readonly" disabled="disabled">
                    		</c:if>
                			중요
                		</label>
                	</div>
                  </div>
                  <div class="form-group">
                   <label for="pj_start" class="control-label col-lg-2">일시</label>
                   <fmt:parseDate var="ps" value="${pj_detail.pj_start}" pattern="yyyy/MM/dd"/>
                   <fmt:formatDate var="ps_day" value="${ps}" pattern="yyyy/MM/dd"/>
                   <fmt:formatDate var="ps_time" value="${ps}" pattern="HH:mm aa"/>
                   
                   <c:if test="${pj_detail.pj_end ne null}">
                   	<fmt:parseDate var="pe" value="${pj_detail.pj_end}" pattern="yyyy/MM/dd"/>
                   	<fmt:formatDate var="pe_day" value="${pe}" pattern="yyyy/MM/dd"/>
                   	<fmt:formatDate var="pe_time" value="${pe}" pattern="HH:mm aa"/>
                   </c:if>
                   
                   <c:if test="${pj_detail.pj_predict ne null}">
                   	<fmt:parseDate var="pp" value="${pj_detail.pj_predict}" pattern="yyyy/MM/dd"/>
                   	<fmt:formatDate var="pp_day" value="${pp}" pattern="yyyy/MM/dd"/>
                   	<fmt:formatDate var="pp_time" value="${pp}" pattern="HH:mm aa"/>
                   </c:if>
						<div class="col-md-10">
							<div class="input-group input-large" data-date-format="yyyy/mm/dd">
								<input type="text" class="form-control dpd1 biz_date" id="pj_start" name="pj_start" placeholder="시작일자를 선택하세요" value="${ps_day}" disabled="disabled">
								<div class="input-group bootstrap-timepicker" style="width: 100%">
									<input type="text" class="form-control timepicker-default" id="ps_time" placeholder="시간을 선택하세요" value="${ps_time}" disabled="disabled">
									<span class="input-group-btn">
										<button class="btn btn-theme04" type="button" style="border-radius:0">
											<i class="fa fa-clock-o"></i>
										</button>
									</span>
								</div>
								<span class="input-group-addon">To</span>
                		    		<input type="text" class="form-control dpd2 bizdatepick" id="pj_end" name="pj_end" placeholder="마감일자를 선택하세요" value="${pe_day}" disabled="disabled">
                		    	<div class="input-group bootstrap-timepicker" style="width: 100%">
                    			  <input type="text" class="form-control timepicker-default" id="pe_time" placeholder="시간을 선택하세요" value="${pe_time}" disabled="disabled">
                   	  		 	<span class="input-group-btn">
                       				<button class="btn btn-theme04" type="button" style="border-radius:0"><i class="fa fa-clock-o"></i></button>
                        	 	</span>
								</div>
								<span class="input-group-addon">To</span>
                		    		<input type="text" class="form-control dpd2 bizdatepick" id="pj_predict" name="pj_predict" placeholder="예상완료일자를 선택하세요" value="${pp_day}" disabled="disabled">
                		    	<div class="input-group bootstrap-timepicker" style="width: 100%">
                    			  <input type="text" class="form-control timepicker-default" id="pp_time" placeholder="시간을 선택하세요" value="${pp_time}" disabled="disabled">
                   	  		 	<span class="input-group-btn">
                       				<button class="btn btn-theme04" type="button" style="border-radius:0"><i class="fa fa-clock-o"></i></button>
                        	 	</span>
								</div>
							</div>
						</div>
					</div>
                  <div class="form-group ">
                    <label for="pj_summary" class="control-label col-lg-2">요약</label>
                    <div class="col-lg-10">
                      <input class="form-control " id="pj_summary" type="text" name="pj_summary" placeholder="프로젝트를 간단하게 요약하여 보세요" value="${pj_detail.pj_summary}" readonly="readonly"/>
                    </div>
                  </div>
                  <div class="form-group ">
                    <label for="pj_content" class="control-label col-lg-2">설명</label>
                    <div class="col-lg-10">
                      <textarea class="form-control " id="pj_content" name="pj_content" placeholder="프로젝트에 필요한 설명을 남기세요" rows="8" readonly="readonly">${pj_detail.pj_content}</textarea>
                    </div>
                  </div>
                <div class="form-group">
                  <label for="pj_file" class="control-label col-lg-2">파일 첨부</label>
                  <div class="col-lg-10">
                    <div class="fileupload fileupload-new" data-provides="fileupload">
                      <div class="fileupload-new thumbnail" style="width: 200px; height: 150px;">
                      <c:if test="${pj_detail.pj_file ne null}">
                      	<img id="pj_img" src="${pageContext.request.contextPath}/sj/img/${pj_detail.pj_file}"/>
                      </c:if>
                      <c:if test="${pj_detail.pj_file eq null}">
                      	<img id="pj_img" src="http://www.placehold.it/200x150/EFEFEF/AAAAAA&text=no+image"/>
                      </c:if>
                      </div>
                      <div class="fileupload-preview fileupload-exists thumbnail" style="max-width: 200px; max-height: 150px; line-height: 20px;"></div>
                      <div>
                        <span class="btn btn-theme02 btn-file" id="pj_file">
                        <span class="fileupload-new"><i class="fa fa-paperclip"></i> 파일 선택</span>
                        <span class="fileupload-exists"><i class="fa fa-undo"></i> 변경</span>
                        <input type="file" class="default" name="file_pj"/>
                        </span>
                        <a class="btn btn-theme04 fileupload-exists" data-dismiss="fileupload"><i class="fas fa-trash-alt"></i> 삭제</a>
                      </div>
                    </div>
                  </div>
                </div>
                  <div class="form-group last">
                    <div class="col-lg-offset-2 col-lg-10">
                    	<c:if test="${my_auth_code eq 0 || my_auth_code eq 1}">
                    		<button class="btn btn-theme pull-right" onclick="pj_update(this)" type="button">수정</button>
                    		<button class="btn btn-theme pull-right" id="pj_upSubmit" style="display:none" onclick="pj_update_ajax()">저장</button>
                    	</c:if>
                    </div>
                  </div>
                </form>
              </div>
          </aside>
            <%@ include file="biz_share.jspf" %>
        </div>
        <!-- page end-->
      </section>
      <!-- /wrapper -->
    </section>
    <%@ include file="js.jspf" %>
	<script>
    //권한없는 멤버의 파일 등록 방지
    $("#pj_file").css("pointer-events", "none");
    $("#pj_file").addClass("disabled");
    
    	function pj_update(upB){
    		$('#pj_upSubmit').css("display", "block");
    		$(upB).css("display", "none");
    		$('#pj_title').attr("readonly", false);
    		$('#pj_important').prop("disabled", false);
    		$('#pj_start').prop("disabled", false); $('#ps_time').prop("disabled", false);
    		$('#pj_end').prop("disabled", false); $('#pe_time').prop("disabled", false);
    		$('#pj_predict').prop("disabled", false); $('#pp_time').prop("disabled", false);
    		$('#pj_summary').attr("readonly", false);
    		$('#pj_content').attr("readonly", false);
    		$("#pj_file").removeClass("disabled");
    		$("#pj_file").css("pointer-events", "auto");
    	}
    	
		function cmt_delete(cmt_code){
			if (confirm("삭제하시겠습니까?")) {
				location.href = 'cmt_delete?cmt_code='+cmt_code;
			}
		}
		
		function pj_update_ajax(){
			var form = $('#pj_up_form')[0];
			var formData = new FormData(form);
			
 			if (confirm("수정내용을 저장하시겠습니까?")) {
 		    	if($('#pj_title').val() == ""){ alert("프로젝트의 제목을 입력해주세요."); }
 		    	if($('#pj_start').val() == ""){ alert("프로젝트의 시작일자를 입력해주세요."); }
 		    	if($('#pj_title').val() != "" && $('#pj_start').val() != ""){
	 				if($('#pj_important').not(':checked')){ $('#pj_important').val('n'); }
	 		    	if($('#pj_start').val() != ""){ $('#pj_start').val(moment($('#pj_start').val() + " " + $('#ps_time').val()).format('YYYY/MM/DD HH:mm:ss')); }
	 		    	if($('#pj_end').val() != ""){ $('#pj_end').val(moment($('#pj_end').val() + " " + $('#pe_time').val()).format('YYYY/MM/DD HH:mm:ss')); }
	 		    	if($('#pj_predict').val() != ""){ $('#pj_predict').val(moment($('#pj_predict').val() + " " + $('#pp_time').val()).format('YYYY/MM/DD HH:mm:ss')); }
	 		    	$.ajax({
						type : 'POST',
						url : '/cally/business/pj_up',
						processData: false,
	                    contentType: false,
						data : formData,
						dataType : 'text',
						success : function(result){
							if(result == 'y'){
								alert("수정되었습니다.");
								location.reload();
							}
							
						}, error : function(){
							alert("실패");
						}
					});
				}
 			}	
		}		
	</script>