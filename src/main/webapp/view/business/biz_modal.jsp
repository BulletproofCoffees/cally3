<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
 	//타이틀이 비어있지 않으면 폼 전송
	function cal_add() {
 		if ($('#cal_title').val() == "") {
			alert("제목을 입력해주세요");
		} else {
			if($('#cal_important').not(':checked')){
				$('#cal_important').val('n');
			}
			$('#cal_start').val(moment($('#cal_start').val() + " " + $('#cal_starttime').val()).format('YYYY/MM/DD HH:mm:ss'));
			$('#cal_end').val(moment($('#cal_end').val() + " " + $('#cal_endtime').val()).format('YYYY/MM/DD HH:mm:ss'));
			document.getElementById("bizc_in_f").submit();
		}
	}
 	
	function task_add() {
 		if($('#task_important').not(':checked')){
    		$('#task_important').val('n');
		}
    	if($('#task_title').val() == ""){ alert("업무 제목을 입력해주세요."); }
    	if($('#task_start').val() == "" || $('#task_end').val() == ""){
    		if($('#task_start').val() == ""){
    			alert("업무 시작일자를 입력해주세요."); 
    		}else if($('#task_end').val() == ""){
    			alert("업무 종료일자를 입력해주세요.");
    		}
    	}else{
    		if($('#task_start').val() != ""){ $('#task_start').val(moment($('#task_start').val() + " " + $('#task_starttime').val()).format('YYYY/MM/DD HH:mm:ss')); }
    		if($('#task_end').val() != ""){ $('#task_end').val(moment($('#task_end').val() + " " + $('#task_endtime').val()).format('YYYY/MM/DD HH:mm:ss')); }
    		if($('#task_title').val() != "" && $('#task_start').val() != ""){
    			var form = $('#bizt_in_f')[0];
    			var formData = new FormData(form);
    	        $.ajax({
    	            type : 'post',
    	            url : '/cally/business/task_add',
    	            processData: false,
                    contentType: false,
    	            data : formData,
    	            dataType : 'text',
    	            success : function(result){
    	            	if(result == 'y'){
    	                	alert("업무를 작성하였습니다");
    	                	location.reload();
    	            	}
    	            }
    	        });  				
    				
    		}	
    	}
	}
 	
 	//체크박스 하나만 체크 가능
 	function checkOne(c){
 		if ($(c).prop('checked')) {
            $('.r_c_code').prop('checked', false);
            $(c).prop('checked', true);
            $('#r_c_code').val($(c).val());
        }
 	}
 	
 	function d_checkOne(c){
 		if ($(c).prop('checked')) {
            $('.r_c_code').prop('checked', false);
            $(c).prop('checked', true);
            $('#d_r_c_code').val($(c).val());
        }
 	}
  	
 	//파일 선택 해제
 	function file_delete() {
 		$('.biz_file').addClass("fileupload-new");
 		$('.biz_file').removeClass("fileupload-exists");
 		$('.biz_file div:nth-child(2)').html("");
 	}

</script>
<style>
input[class="r_c_code"] + label {
content: '';
display: inline-block;
width: 18px;
height: 18px;
line-height: 18px;
margin: -2px 5px 0 0;
text-align: center;
vertical-align: middle;
border-radius: 3px;
cursor: pointer;
}

input[class="r_c_code"] {
	display: none;
}

input[class="r_c_code"]:checked + label:before {
content: '\2714';
color: #fff;

}

#r_c_code1+label {background: #ed5565} #r_c_code2+label {background: #eb8a9f} #r_c_code3+label {background: #f87331}
#r_c_code4+label {background: #f9bc23} #r_c_code5+label {background: #35a23a} #r_c_code6+label {background: #81c4e6}
#r_c_code7+label {background: #4984d9} #r_c_code8+label {background: #744dc8} #r_c_code9+label {background: #adadad}
#d_r_c_code1+label {background: #ed5565} #d_r_c_code2+label {background: #eb8a9f} #d_r_c_code3+label {background: #f87331}
#d_r_c_code4+label {background: #f9bc23} #d_r_c_code5+label {background: #35a23a} #d_r_c_code6+label {background: #81c4e6}
#d_r_c_code7+label {background: #4984d9} #d_r_c_code8+label {background: #744dc8} #d_r_c_code9+label {background: #adadad}
</style>
<!-- 새 일정 작성 모달 -->
			<div class="modal fade" id="c_add_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;" PopupMode="pmAuto">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                      <h4 class="modal-title" id="myModalLabel">내 캘린더에 새로운 일정을 입력하세요</h4>
                    </div><br>
                    <div class="modal-body">
                    <form id="bizc_in_f" method="post" action="${pageContext.request.contextPath}/business/mycal_add" enctype="multipart/form-data">
                    <input type="hidden" value="${loginUser.mem_num}" name="mem_num">
                    <input type="hidden" value="0" name="cal_code">
                    <table style="width: 90%; margin: 0 auto; text-align: left" class="biz_modal_table">
                    	<tr>
                    		<td style="width: 15%"><label for="cname" class="control-label">제목</label></td>
                    		<td style="width: 85%">
                    			<table style="width: 100%; text-align: center">
                    				<tr>
                    					<td style="width: 85%; padding:0">
                    						<input class=" form-control" id="cal_title" name="cal_title" type="text" required />
                    					</td>
                    					<td style='width: 15%; padding:0;'><label class="checkbox-inline">
                    						<input type="checkbox" id="cal_important" name="cal_important" value='y'>중요</label>
                    					</td>
                    				</tr>
                    			</table>
                    		</td>
                    	</tr>
                    	<tr>
                    		<td><label for="cal_start" class="control-label">일시</label></td>
                    		<td>
                    			<div class="input-group input-large" data-date="10/10/2018" data-date-format="yyyy/mm/dd">
									<input type="text" class="form-control dpd1 biz_date" name="cal_start" id="cal_start" placeholder="시작일자">
									<div class="input-group bootstrap-timepicker" style="width: 100%">
										<input type="text" class="form-control timepicker-default" id="cal_starttime" name="cal_starttime" placeholder="시작시간">
										<span class="input-group-btn">
											<button class="btn btn-theme04" type="button" style="border-radius:0">
												<i class="fa fa-clock-o"></i>
											</button>
										</span>
									</div>
									<span class="input-group-addon">To</span>
                		   	 		<input type="text" class="form-control dpd2 biz_datepick" id="cal_end" name="cal_end" placeholder="종료일자">
                			   	 	<div class="input-group bootstrap-timepicker" style="width: 100%">
                    				  <input type="text" class="form-control timepicker-default" id="cal_endtime" name="cal_endtime" placeholder="종료시간">
                   	  			 	<span class="input-group-btn">
                       					<button class="btn btn-theme04" type="button" style="border-radius:0"><i class="fa fa-clock-o"></i></button>
                        		 	</span>
									</div>
								</div>
							</td>
                    	</tr>
                    	<tr>
                    		<td><label for="cal_place" class="control-label">장소</label></td>
                    		<td><input class="form-control" id="cal_place" type="text" name="cal_place" /></td>                    	
                    	</tr>
                    	<tr>
                    		<td><label for="cal_content" class="control-label">설명</label></td>
                    		<td><textarea class="form-control " id="cal_content" name="cal_content" placeholder="일정에 필요한 설명을 남기세요" required></textarea></td>                    	
                    	</tr>
                    	<tr>
                    		<td><label for="cal_file" class="control-label">파일첨부</label></td>
                    		<td><div class="fileupload fileupload-new biz_file" data-provides="fileupload">
                      			<div class="fileupload-preview fileupload-exists thumbnail" style="max-width: 200px; max-height: 150px;"></div>
                      			<div>
                        			<span class="btn btn-theme02 btn-file">
        	                			<span class="fileupload-new"><i class="fa fa-paperclip"></i> 파일 선택</span>
           	    	         			<span class="fileupload-exists"><i class="fa fa-undo"></i> 변경</span>
           		             			<input type="file" class="default" name="file_cal" id="file_cal"/>
                       				</span>
                        		<a class="btn btn-theme04 fileupload-exists" data-dismiss="fileupload" onclick="file_delete()"><i class="fas fa-trash-alt"></i> 삭제</a>
                      			</div>
                    			</div>
                    		</td>                    	
                       </tr>                    	
                    </table>
                    </form>
				  </div><br>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-danger" onclick="cal_add()">저장</button>
                      <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                    </div>
                  </div>
                </div>
              </div>
              
<!-- 업무 작성 모달 -->
			<div class="modal fade" id="t_add_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;" PopupMode="pmAuto">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                      <h4 class="modal-title" id="myModalLabel">내 프로젝트 업무일정</h4>
                    </div><br>
                    <div class="modal-body">
                    <form id="bizt_in_f" name="bizt_in_f" enctype="multipart/form-data">
                    <input type="hidden" value="${loginUser.mem_num}" name="mem_num">
                    <input type="hidden" name="pj_t_code" value="0">
                    <input type="hidden" name="share_code" value="0">
                    <input type="hidden" name="auth_code" value="0">
                    <input type="hidden" id="pj_code" name="pj_code">
                    <table style="width: 95%; margin: 0 auto; text-align: left" class="biz_modal_table">
                    	<tr>
                    		<td style="width: 15%"><label for="task_attain" class="control-label">진행률</label></td>
                    		<td style="width: 85%">
								  <input name="task_attain" type="range" class="fluid-slider" id="range-slider" max="100" min="0" value="0">
								  <span id="range-label" class="range-label"></span>
								  <div id="back_color" class="progress-bar-info back_color"></div>
                    		</td>
                    	</tr>
                    	<tr>
                    		<td style="width: 15%"><label for="task_title" class="control-label">제목</label></td>
                    		<td style="width: 85%">
                    			<table style="width: 100%; text-align: center">
                    				<tr>
                    					<td style="width: 85%; padding:0">
                    						<input class="form-control" id="task_title" name="task_title" type="text" required />
                    					</td>
                    					<td style='width: 15%; padding:0;'><label class="checkbox-inline">
                    						<input type="checkbox" id="task_important" name="task_important" value='y'>중요</label>
                    					</td>
                    				</tr>
                    			</table>
                    		</td>
                    	</tr>
                    	<tr>
                    		<td><label for="task_start" class="control-label">일시</label></td>
                    		<td>
                    			<div class="input-group input-large" data-date="10/10/2018" data-date-format="yyyy/mm/dd">
									<input type="text" class="form-control dpd1 biz_date" name="task_start" id="task_start" placeholder="시작일자">
									<div class="input-group bootstrap-timepicker" style="width: 100%">
										<input type="text" class="form-control timepicker-default" id="task_starttime" name="task_starttime" placeholder="시작시간">
										<span class="input-group-btn">
											<button class="btn btn-theme04" type="button" style="border-radius:0">
												<i class="fa fa-clock-o"></i>
											</button>
										</span>
									</div>
									<span class="input-group-addon">To</span>
                		   	 		<input type="text" class="form-control dpd2 biz_datepick" id="task_end" name="task_end" placeholder="종료일자">
                			   	 	<div class="input-group bootstrap-timepicker" style="width: 100%">
                    				  <input type="text" class="form-control timepicker-default" id="task_endtime" name="task_endtime" placeholder="종료시간">
                   	  			 	<span class="input-group-btn">
                       					<button class="btn btn-theme04" type="button" style="border-radius:0"><i class="fa fa-clock-o"></i></button>
                        		 	</span>
									</div>
								</div>
							</td>
                    	</tr>
                    	<tr>
                    		<td><label for="r_c_code" class="control-label">범주</label></td>
							<td>
							<c:forEach var="i" begin="1" end="9" step="1">
								<input type="checkbox" id="r_c_code${i}" class="r_c_code" value="${i}" onclick="checkOne(this)"><label for="r_c_code${i}" class="control-label"></label>${i} &nbsp;
							</c:forEach>
							<input type="hidden" id="r_c_code" name="r_c_code" value="6">
							</td>
						</tr>
                    	<tr>
                    		<td><label for="task_content" class="control-label">설명</label></td>
                    		<td><textarea class="form-control " id="task_content" name="task_content" placeholder="업무에 필요한 설명을 남기세요" required></textarea></td>                    	
                    	</tr>
                    	<tr>
                    		<td><label for="task_file" class="control-label">파일첨부</label></td>
                    		<td><div class="fileupload fileupload-new" data-provides="fileupload" id="task_file">
                      			<div class="fileupload-preview fileupload-exists thumbnail" style="max-width: 200px; max-height: 150px;"></div>
                      			<div>
                        			<span class="btn btn-theme02 btn-file">
        	                		<span class="fileupload-new"><i class="fa fa-paperclip"></i> 파일 선택</span>
           	    	         		<span class="fileupload-exists"><i class="fa fa-undo"></i> 변경</span>
           		             		<input type="file" class="default" name="file_task"/>
                       			</span>
                        		<a class="btn btn-theme04 fileupload-exists" data-dismiss="fileupload" onclick="file_delete()"><i class="fas fa-trash-alt"></i> 삭제</a>
                      			</div>
                    			</div>
                    		</td>                    	
                       </tr>                    	
                    </table>
                    </form>
				  </div><br>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-danger" onclick="task_add()">저장</button>
                      <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                    </div>
                  </div>
                </div>
              </div>              
              
<!-- 일정 상세 및 수정 모달 -->
			<div class="modal fade" id="modal_c_detail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;" PopupMode="pmAuto">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                      <h4 class="modal-title" id="myModalLabel">내 캘린더 일정</h4>
                    </div><br>
                    <div class="modal-body">
                    <form id="bizc_up_f" method="post" action="${pageContext.request.contextPath}/business/mycal_add">
                    <input type="hidden" value="${loginUser.mem_num}" name="mem_num">
                    <input type="hidden" id="cal_code" name="cal_code">
                    <table style="width: 90%; margin: 0 auto; text-align: left" class="biz_modal_table">
                    	<tr>
                    		<td style="width: 15%"><label for="cal_title" class="control-label">제목</label></td>
                    		<td style="width: 85%">
                    			<table style="width: 100%; text-align: center">
                    				<tr>
                    					<td style="width: 85%; padding:0">
                    						<input class=" form-control" id="cal_title" name="cal_title" type="text" required />
                    					</td>
                    					<td style='width: 15%; padding:0;'><label class="checkbox-inline">
                    						<input type="checkbox" id="cal_important" name="cal_important" value='y'>중요</label>
                    					</td>
                    				</tr>
                    			</table>
                    		</td>
                    	</tr>
                    	<tr>
                    		<td><label for="cal_start" class="control-label">일시</label></td>
                    		<td>
                    			<div class="input-group input-large" data-date="10/10/2018" data-date-format="yyyy/mm/dd">
									<input type="text" class="form-control dpd1 biz_date" name="cal_start" id="cal_start" placeholder="시작일자" required>
									<div class="input-group bootstrap-timepicker" style="width: 100%">
										<input type="text" class="form-control timepicker-default" id="cal_starttime" name="cal_starttime" placeholder="시작시간">
										<span class="input-group-btn">
											<button class="btn btn-theme04" type="button" style="border-radius:0">
												<i class="fa fa-clock-o"></i>
											</button>
										</span>
									</div>
									<span class="input-group-addon">To</span>
                		   	 		<input type="text" class="form-control dpd2 biz_datepick" id="cal_end" name="cal_end" placeholder="종료일자" required>
                			   	 	<div class="input-group bootstrap-timepicker" style="width: 100%">
                    				  <input type="text" class="form-control timepicker-default" id="cal_endtime" name="cal_endtime" placeholder="종료시간">
                   	  			 	<span class="input-group-btn">
                       					<button class="btn btn-theme04" type="button" style="border-radius:0"><i class="fa fa-clock-o"></i></button>
                        		 	</span>
									</div>
								</div>
							</td>
                    	</tr>
                    	<tr>
                    		<td><label for="cal_place" class="control-label">장소</label></td>
                    		<td><input class="form-control" id="cal_place" type="text" name="cal_place" /></td>                    	
                    	</tr>
                    	<tr>
                    		<td><label for="cal_content" class="control-label">설명</label></td>
                    		<td><textarea class="form-control " id="cal_content" name="cal_content" placeholder="일정에 필요한 설명을 남기세요" required></textarea></td>                    	
                    	</tr>
                    	<tr>
                    		<td><label for="cal_file" class="control-label">파일첨부</label></td>
                    		<td><div class="fileupload fileupload-new biz_file" data-provides="fileupload">
                      			<div class="fileupload-new thumbnail" style="width: 200px; height: 150px;">
                      				<img id="cal_img">
                      			</div>
                      			<div class="fileupload-preview fileupload-exists thumbnail" style="max-width: 200px; max-height: 150px; line-height: 20px;"></div>
                      			<div>
                        			<span class="btn btn-theme02 btn-file">
        	                		<span class="fileupload-new"><i class="fa fa-paperclip"></i> 파일 선택</span>
           	    	         		<span class="fileupload-exists"><i class="fa fa-undo"></i> 변경</span>
           		             		<input type="file" class="default" name="file_cal"/>
                       			</span>
                        		<a class="btn btn-theme04 fileupload-exists" data-dismiss="fileupload" onclick="file_delete()"><i class="fas fa-trash-alt"></i> 삭제</a>
                      			</div>
                    			</div>
                    		</td>   	
                       </tr>                    	
                    </table>
                    </form>
				  </div><br>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-primary" onclick="cal_up()">수정</button>
                      <button type="button" class="btn btn-danger" onclick="cal_del()">삭제</button>
                    </div>
                  </div>
                </div>
              </div>
              
                            		
<!-- 업무내역 상세 및 수정 모달 -->
			<div class="modal fade" id="modal_t_detail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;" PopupMode="pmAuto">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                      <h4 class="modal-title" id="myModalLabel">내 프로젝트 업무일정</h4>
                    </div><br>
                    <div class="modal-body">
                    <form id="bizt_up_f" method="post" enctype="multipart/form-data">
                    <input type="hidden" value="${loginUser.mem_num}" name="mem_num">
                    <input type="hidden" id="pj_t_code" name="pj_t_code">
                    <input type="hidden" id="pj_code" name="pj_code">
                    <table style="width: 95%; margin: 0 auto; text-align: left" class="biz_modal_table">
                    	<tr>
                    		<td style="width: 15%"><label for="task_attain" class="control-label">진행률</label></td>
                    		<td style="width: 85%">
								  <input name="task_attain" type="range" class="fluid-slider" id="d_range-slider" max="100" min="0" value="0">
								  <span id="d_range-label" class="range-label"></span>
								  <div id="d_back_color" class="progress-bar-info back_color"></div>
                    		</td>
                    	</tr>
                    	<tr>                   	
                    		<td style="width: 15%"><label for="cname" class="control-label">제목</label></td>
                    		<td style="width: 85%">
                    			<table style="width: 100%; text-align: center">
                    				<tr>
                    					<td style="width: 85%; padding:0">
                    						<input class="form-control" id="task_title" name="task_title" type="text" required />
                    					</td>
                    					<td style='width: 15%; padding:0;'><label class="checkbox-inline">
                    						<input type="checkbox" id="task_important" name="task_important" value='y'>중요</label>
                    					</td>
                    				</tr>
                    			</table>
                    		</td>
                    	</tr>
                    	<tr>
                    		<td><label for="task_start" class="control-label">일시</label></td>
                    		<td>
                    			<div class="input-group input-large" data-date="10/10/2018" data-date-format="yyyy/mm/dd">
									<input type="text" class="form-control dpd1 biz_date" name="task_start" id="task_start" placeholder="시작일자">
									<div class="input-group bootstrap-timepicker" style="width: 100%">
										<input type="text" class="form-control timepicker-default" id="task_starttime" name="task_starttime" placeholder="시작시간">
										<span class="input-group-btn">
											<button class="btn btn-theme04" type="button" style="border-radius:0">
												<i class="fa fa-clock-o"></i>
											</button>
										</span>
									</div>
									<span class="input-group-addon">To</span>
                		   	 		<input type="text" class="form-control dpd2 biz_datepick" id="task_end" name="task_end" placeholder="종료일자">
                			   	 	<div class="input-group bootstrap-timepicker" style="width: 100%">
                    				  <input type="text" class="form-control timepicker-default" id="task_endtime" name="task_endtime" placeholder="종료시간">
                   	  			 	<span class="input-group-btn">
                       					<button class="btn btn-theme04" type="button" style="border-radius:0"><i class="fa fa-clock-o"></i></button>
                        		 	</span>
									</div>
								</div>
							</td>
                    	</tr>
                    	<tr>
                    		<td><label for="r_c_code" class="control-label">범주</label></td>
							<td>
							<c:forEach var="i" begin="1" end="9" step="1">
								<input type="checkbox" id="d_r_c_code${i}" class="r_c_code" value="${i}" onclick="d_checkOne(this)"><label for="d_r_c_code${i}" class="control-label"></label>${i} &nbsp;
							</c:forEach>
							<input type="hidden" id="d_r_c_code" name="r_c_code" value="6">
							</td>
						</tr>
                    	<tr>
                    		<td><label for="task_content" class="control-label">설명</label></td>
                    		<td><textarea class="form-control " id="task_content" name="task_content" placeholder="업무에 필요한 설명을 남기세요" required></textarea></td>                    	
                    	</tr>
                    	<tr>
                    		<td><label for="task_file" class="control-label">파일첨부</label></td>
                    		<td><div class="fileupload fileupload-new biz_file" data-provides="fileupload">
                      			<div class="fileupload-new thumbnail" style="width: 200px; height: 150px;">
                      				<img id="task_img">
                      			</div>
                      			<div class="fileupload-preview fileupload-exists thumbnail" style="max-width: 200px; max-height: 150px; line-height: 20px;"></div>
                      			<div>
                        			<span class="btn btn-theme02 btn-file">
        	                		<span class="fileupload-new"><i class="fa fa-paperclip"></i> 파일 선택</span>
           	    	         		<span class="fileupload-exists"><i class="fa fa-undo"></i> 변경</span>
           		             		<input type="file" class="default" name="file_task"/>
                       			</span>
                        		<a class="btn btn-theme04 fileupload-exists" data-dismiss="fileupload" onclick="file_delete()"><i class="fas fa-trash-alt"></i> 삭제</a>
                      			</div>
                    			</div>
                    		</td>               	
                       </tr>                    	
                    </table>
                    </form>
				  </div><br>
                    <div class="modal-footer">
                      <button type="button" id="modal_t_detail_btn" class="btn btn-primary" onclick="task_up()">수정</button>
                      <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                    </div>
                  </div>
                </div>
              </div>
              
<!-- 프로젝트 공유(초대) 모달 -->
			<div class="modal fade" id="main_share" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;" PopupMode="pmAuto">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                      <h4 class="modal-title" id="myModalLabel">프로젝트에 초대합니다</h4>
                    </div><br>
                    <div class="modal-body">
                    <form id="bizs_in_f" method="post" action="${pageContext.request.contextPath}/business/mycal_add">
                    <table style="width: 95%; margin: 0 auto; text-align: left" class="biz_modal_table">
                    	<tr>
                    		<td style="width: 18%"><label for="task_title" class="control-label">프로젝트명</label></td>
                    		<td>
                    			<select class="form-control" id="pj_list_sel">
                  				</select>
                    		</td>
                    	</tr>
                    	<tr>
                    		<td style="width: 18%"><label for="task_title" class="control-label">회원검색</label></td>
                    		<td>
                    			<input id="mem_id" class="form-control" size="30" type="text" style="padding-right: 10px; display: inline; width: 50%" placeholder="아이디를 입력하세요" required>
                    			<input id="mem_id2" hidden="hidden">
                    			<button type="button" class="btn btn-primary" onclick="search_mem()">검색</button>
                    		</td>
                    	</tr>
                    	<tr>
                    		<td style="width: 18%"><label for="notice_content" class="control-label">전달내용</label></td>
                    		<td>
                    			<textarea id="notice_content" class="form-control" rows="4" cols="70" placeholder="프로젝트에 대한 내용을 전달해보세요" required></textarea>
                    		</td>
                    	</tr>                  	
                    </table>
                    </form>
				  </div><br>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                      <button type="button" id="invite_btn" class="btn btn-theme" onclick="mem_invite()" disabled="disabled">초대</button>
                    </div>
                  </div>
                </div>
              </div>
 
<!-- 알림 상세 모달 -->
		<div class="modal fade" id="notice_detail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;" PopupMode="pmAuto">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                      <h4 class="modal-title" id="myModalLabel"></h4>
                    </div><br>
                    <div class="modal-body">
                    <form id="bizn_up_f" method="post">
                    <input type="hidden" id="user_n_code" name="user_n_code">
                    <input type="hidden" id="addressee_code" name="addressee_code">
                    <input type="hidden" id="sender_code" name="sender_code">
                    <input type="hidden" id="state_code" name="state_code">
                    <input type="hidden" id="up_state_code" name="up_state_code" value="2">
                    <table style="width: 95%; margin: 0 auto; text-align: left" class="biz_modal_table">
                    	<tr>
                    		<td style="width: 18%;"><label class="control-label">발신일</label></td>
                    		<td><span id="notice_date"></span></td>
                    	</tr>
                    	<tr id="sender_tr">
                    		<td style="width: 18%"><label for="sender_id" class="control-label">발신자</label></td>
                    		<td style="padding-bottom:6px">
								<input class="form-control" id="sender_id" size="30" type="text" style="padding-right: 10px; display: inline; width: 50%" readonly="readonly">
							</td>
                    	</tr>
                    	<tr>
                    		<td style="width: 18%"><label for="notice_content" class="control-label">전달내용</label></td>
                    		<td>
                    			<textarea class="form-control" id="notice_content" rows="4" cols="70" placeholder="프로젝트에 대한 내용을 전달해보세요">내용이 없습니다</textarea>
                    		</td>
                    	</tr>                  	
                    </table>
                    </form>
				  </div><br>
                    <div class="modal-footer" id="notice_default_btn">
                      <button type="button" class="btn btn-theme" onclick="notice_state_up(2)">확인</button>
                      <button type="button" class="btn btn-theme" id="notice_msg_re" onclick="notice_msg_re()">답장</button>
                    </div>
                    <div class="modal-footer" id="notice_invite_btn">
                      <button type="button" class="btn btn-danger" onclick="notice_state_up(5)">거절</button>
                      <button type="button" class="btn btn-theme" onclick="notice_state_up(4)">승락</button>
                    </div>
                  </div>
                </div>
              </div>
               
<!-- 메시지 모달 -->
			<div class="modal fade" id="share_msg_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;" PopupMode="pmAuto">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                      <h4 class="modal-title" id="myModalLabel">메세지 작성</h4>
                    </div><br>
                    <div class="modal-body">
                    <form id="bizn_msg_in_f" method="post" action="${pageContext.request.contextPath}/business/mycal_add">
                    <table style="width: 95%; margin: 0 auto; text-align: left" class="biz_modal_table">
                    	<tr>
                    		<td style="width: 18%;"><label for="add_mem_id" class="control-label" id="add_mem_id">수신인</label>
                    			<input type="hidden" id="addressee_code" name="addressee_code">
                    			<input type="hidden" id="pj_code" name="pj_code">
                    			<input type="hidden" id="state_code" name="state_code" value="1">
                    			<input type="hidden" id="sender_code" name="sender_code">
                    		</td>
                    		<td style="padding-bottom:6px">
                    			<input id="add_mem_id" class="form-control" size="30" type="text" style="padding-right: 10px; display: inline; width: 50%" readonly="readonly">
                    		</td>
                    	</tr>
                    	<tr>
                    		<td style="width: 18%"><label for="notice_content" class="control-label">전달내용</label></td>
                    		<td>
                    			<textarea name="notice_content" class="form-control" rows="4" cols="70" placeholder="프로젝트에 대한 내용을 전달해보세요" required></textarea>
                    		</td>
                    	</tr>                  	
                    </table>
                    </form>
				  </div><br>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                      <button type="button" class="btn btn-theme" onclick="notice_msg_ajax()">전송</button>
                    </div>
                  </div>
                </div>
              </div> 
              
<!-- 일정정리 모달 -->
			<div class="modal fade" id="main_arrange" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;" PopupMode="pmAuto">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                      <h4 class="modal-title" id="myModalLabel">오래된 일정을 정리하세요</h4>
                    </div><br>
                    <div class="modal-body">
                      		<select class="form-control" style="width: 40%; float: left">
                  				<option>내 캘린더</option>
                  				<option>내 프로젝트</option>
                  			</select>
							<select class="form-control" style="width: 60%">
								<option>내 캘린더 1</option>
								<option>내 캘린더 2</option>
							</select><br>
                    <input class="form-control form-control-inline input-medium default-date-picker biz_date" size="16" type="text" placeholder="날짜를 선택하세요" style="width: 40%; float: left">
				  	<span class="help-block"> 이전 일정을 삭제합니다</span>
				  </div><br>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                      <button type="button" class="btn btn-danger">삭제</button>
                    </div>
                  </div>
                </div>
              </div>
              
              
              
<!-- 슬라이더 스크립트 -->
<script>
var rangeSlider = document.getElementById("range-slider");
var rangeLabel = document.getElementById("range-label");
rangeSlider.addEventListener("input", showSliderValue, false);

var d_rangeSlider = document.getElementById("d_range-slider");
var d_rangeLabel = document.getElementById("d_range-label");
d_rangeSlider.addEventListener("input", d_showSliderValue, false);

$('.back_color').css("width", rangeSlider.value + '%');

function showSliderValue() {
	  rangeLabel.innerHTML = rangeSlider.value + '%';
	  var labelPosition = (rangeSlider.value /rangeSlider.max);

	  if(rangeSlider.value === rangeSlider.min) {
	 $('.back_color').css("width", ((labelPosition * 100)+2) + '%').css('margin-top', -45);
	 rangeLabel.style.left = ((labelPosition * 100) + 2) + '%';
	  } else if (rangeSlider.value === rangeSlider.max) {
	 $('.back_color').css("width", ((labelPosition * 100)- 2) + '%').css('margin-top', -45);
	 rangeLabel.style.left = ((labelPosition * 100) - 2) + '%';
	  } else {
	  $('.back_color').css("width", (labelPosition * 100) + '%').css('margin-top', -45);
	  rangeLabel.style.left = (labelPosition * 100) + '%';
	  }
	}
	
function d_showSliderValue() {
	  d_rangeLabel.innerHTML = d_rangeSlider.value + '%';
	  var labelPosition = (d_rangeSlider.value /d_rangeSlider.max);

	  if(d_rangeSlider.value === d_rangeSlider.min) {
	 $('.back_color').css("width", ((labelPosition * 100)+2) + '%').css('margin-top', -45);
	  d_rangeLabel.style.left = ((labelPosition * 100) + 2) + '%';
	  } else if (rangeSlider.value === rangeSlider.max) {
	 $('.back_color').css("width", ((labelPosition * 100)- 2) + '%').css('margin-top', -45);
	  d_rangeLabel.style.left = ((labelPosition * 100) - 2) + '%';
	  } else {
	  $('.back_color').css("width", (labelPosition * 100) + '%').css('margin-top', -45);
	  d_rangeLabel.style.left = (labelPosition * 100) + '%';
	  }
	}
</script>
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-46156385-1', 'cssscript.com');
  ga('send', 'pageview');
  
</script>             