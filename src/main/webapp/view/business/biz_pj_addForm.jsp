<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 일정 등록 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/callyPlus/business/biz_dhtmlxgantt.css"/>
<%@ include file="biz_sidemenu.jspf" %>
<script>
	$('#biz_pjActive').addClass('active');
</script>
<!--main content start-->
<section id="main-content">
      <section class="wrapper">
        <h3><i class="fa fa-angle-right"></i> 내 프로젝트</h3>
        <!-- page start--><br>
        <div class="row mt form-panel">
          <aside class="col-lg-12 mt">
          <div class="col-lg-2"></div>
            <div class="col-lg-8 mt" style="margin-top: -10px; min-height: 693px">
           	  <h4><i class="fa fa-angle-right"></i> 프로젝트 작성</h4>
              <div class=" form">
                <form class="cmxform form-horizontal style-form" id="bizp_in_f" method="post" action="${pageContext.request.contextPath}/business/mypj_add" enctype="multipart/form-data">
                <input type="hidden" name="auth_code" value="0">
                <input type="hidden" name="share_code" value="0">
                <input type="hidden" value="${loginUser.mem_num}" name="mem_num">
                  <br><br>
                  <div class="form-group ">
                    <label for="pj_title" class="control-label col-lg-2">제목</label>
                    <div class="col-lg-7">
                      <input class=" form-control" id="pj_title" name="pj_title" minlength="2" type="text" required />
                    </div>
                    <div class="col-lg-1">
                    	<label class="checkbox-inline">
                			<input type="checkbox" name="pj_important" id="pj_important" value="y"> 중요
                		</label>
                	</div>
                  </div>
                  <div class="form-group">
                    <label for="ccomment" class="control-label col-lg-2">일시</label>
						<div class="col-md-10">
							<div class="input-group input-large" data-date-format="yyyy/mm/dd">
								<input type="text" class="form-control dpd1 biz_date" id="pj_start" name="pj_start" placeholder="시작일자를 선택하세요" required>
								<div class="input-group bootstrap-timepicker" style="width: 100%">
									<input type="text" id="pj_starttime" class="form-control timepicker-default" placeholder="시간을 선택하세요">
									<span class="input-group-btn">
										<button class="btn btn-theme04" type="button" style="border-radius:0">
											<i class="fa fa-clock-o"></i>
										</button>
									</span>
								</div>
								<span class="input-group-addon">To</span>
                		    		<input type="text" class="form-control dpd2 bizdatepick" name="pj_end" id="pj_end" placeholder="마감일자를 선택하세요">
                		    	<div class="input-group bootstrap-timepicker" style="width: 100%">
                    			  <input type="text" class="form-control timepicker-default" id="pj_endtime" placeholder="시간을 선택하세요">
                   	  		 	<span class="input-group-btn">
                       				<button class="btn btn-theme04" type="button" style="border-radius:0"><i class="fa fa-clock-o"></i></button>
                        	 	</span>
								</div>
								<span class="input-group-addon">To</span>
                		    		<input type="text" class="form-control dpd2 bizdatepick" name="pj_predict" id="pj_predict" placeholder="예상완료일자를 선택하세요">
                		    	<div class="input-group bootstrap-timepicker" style="width: 100%">
                    			  <input type="text" class="form-control timepicker-default" id="pj_predicttime" placeholder="시간을 선택하세요">
                   	  		 	<span class="input-group-btn">
                       				<button class="btn btn-theme04" type="button" style="border-radius:0"><i class="fa fa-clock-o"></i></button>
                        	 	</span>
								</div>
							</div>
						</div>
					</div>
                  <div class="form-group ">
                    <label for="curl" class="control-label col-lg-2">요약</label>
                    <div class="col-lg-10">
                      <input class="form-control " id="pj_summary" type="text" name="pj_summary" placeholder="프로젝트를 간단하게 요약하여 보세요"/>
                    </div>
                  </div>
                  <div class="form-group ">
                    <label for="ccomment" class="control-label col-lg-2">설명</label>
                    <div class="col-lg-10">
                      <textarea class="form-control " id="pj_content" name="pj_content" placeholder="프로젝트에 필요한 설명을 남기세요" rows="8"></textarea>
                    </div>
                  </div>
                <div class="form-group">
                  <label class="control-label col-lg-2">파일 첨부</label>
                  <div class="col-lg-10">              
                    <div class="fileupload fileupload-new biz_file" data-provides="fileupload">
                      <div class="fileupload-preview fileupload-exists thumbnail" style="max-width: 200px; max-height: 150px;"></div>
                      <div>
                        <span class="btn btn-theme02 btn-file">
        	            	<span class="fileupload-new"><i class="fa fa-paperclip"></i> 파일 선택</span>
           	    	    	<span class="fileupload-exists"><i class="fa fa-undo"></i> 변경</span>
           		        	<input type="file" class="default" name="file_pj"/>
                        </span>
                        <a class="btn btn-theme04 fileupload-exists" data-dismiss="fileupload" onclick="file_delete()"><i class="fas fa-trash-alt"></i> 삭제</a>
                      </div>
                    </div>
                  </div>
                </div>
                  <div class="form-group last">
                    <div class="col-lg-offset-2 col-lg-10">
                      <button class="btn btn-theme04 pull-right" type="button" style="margin-left: 5px">취소</button>
                      <button class="btn btn-theme pull-right"type="button" id="pj_add_sub" onclick="pj_add()">저장</button>
                    </div>
                  </div>
                </form>
              </div>
            </div>
            <div class="col-lg-2 mt"></div>
            <!-- /form-panel -->
          </aside>
        </div>
        <!-- page end-->
      </section>
      <!-- /wrapper -->
    </section>
    <!-- /MAIN CONTENT -->
    <!--main content end-->
    <%@ include file="js.jspf" %>
    <script>    
	function pj_add() {
		if($('#pj_important').not(':checked')){
    		$('#pj_important').val('n');
		}
    	if($('#pj_title').val() == ""){ alert("프로젝트의 제목을 입력해주세요."); }
    	if($('#pj_start').val() == ""){ alert("프로젝트의 시작일자를 입력해주세요."); }
    	
    	if($('#pj_start').val() != ""){ $('#pj_start').val(moment($('#pj_start').val() + " " + $('#pj_starttime').val()).format('YYYY/MM/DD HH:mm:ss')); }
    	if($('#pj_end').val() != ""){ $('#pj_end').val(moment($('#pj_end').val() + " " + $('#pj_endtime').val()).format('YYYY/MM/DD HH:mm:ss')); }
    	if($('#pj_predict').val() != ""){ $('#pj_predict').val(moment($('#pj_predict').val() + " " + $('#pj_predicttime').val()).format('YYYY/MM/DD HH:mm:ss')); }
    	
    	
    	//시작일과 타이틀 모두 값이 있으면 프로젝트 생성(submit)
    	if($('#pj_title').val() != "" && $('#pj_start').val() != ""){ document.getElementById("bizp_in_f").submit(); }
	}
    
    </script>