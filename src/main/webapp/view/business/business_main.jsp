<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="biz_sidemenu.jspf" %>
			
<script>
	$('#biz_main_active').addClass('active');
	function notice_dropClose(a){
		$(a).parent().toggleClass('open');
	}
	
</script>
    <section id="main-content">
      <section class="wrapper">
		<table>
			<tr>
				<td><h3>
						<i class="fa fa-angle-right"></i> 전체일정
					</h3></td>
				<td>
					<div class="nav notify-row alert-dismissable" id="top_menu" style="margin-left: 0">
						<!--  notification start -->
						<ul class="nav top-menu">
							<!-- notification dropdown start-->
							<li id="header_notification_bar" class="dropdown">
								<a id="notice_dropdown" class="dropdown-toggle" style="cursor: pointer" onclick="notice_dropClose(this)"> <i class="far fa-bell"></i>
									<span class="badge bg-warning" id="new_notice_span"></span>
								</a>
								<ul class="dropdown-menu extended notification" id="biz_notice" style="min-width:250px" >
									<li><div class="notify-arrow notify-arrow-yellow"></div></li>
								</ul></li>
							<!-- notification dropdown end -->
						</ul>
						<!--  notification end -->
					</div>
				</td>
			</tr>
		</table>
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
//메인 달력
var events = [];
$.ajax({
	url: '/cally/business/business_main',
    type: 'POST',
    dataType : 'json',
	success: function(data) {
		var cal = $(data[0]);
		var task = $(data[1]);
        $(cal).each(function(idx, e) {
        	events.push({
              id: 'c'+e.CAL_CODE,
              title: e.CAL_TITLE,
              start: e.CAL_START,
              end: e.CAL_END
            });
           });
        $(task).each(function(idx, e) {
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
         alert('일정 로드 실패');
    } 
});

//새로운 알림 갯수
$.ajax({ 
	url: '/cally/business/notice_new',
    type: 'POST',
    dataType : 'text',
	success: function(n) {
		$('#new_notice_span').text(n);
		$('#biz_notice').empty();
		$('#biz_notice').append('<li><div class="notify-arrow notify-arrow-yellow"></div></li>');
		if(n == 0){
			$('#biz_notice').append('<li><p id="new_notice" class="yellow" style="margin-top: -6px">새로운 알림이 없습니다</p></li>');
		}else{
			$('#biz_notice').append('<li><p id="new_notice" class="yellow" style="margin-top: -6px">'+n+'개의 새로운 알림이 있습니다</p></li>');
		}
		new_notice();
	},
    error: function() {
    	$('#new_notice').text("새로운 알림이 없습니다.");
    	$('#new_notice_span').text(0);
    } 
});

//사용자 알림
function new_notice(){
$.ajax({ 
	url: '/cally/business/notice',
    type: 'POST',
    dataType : 'json',
	success: function(data) {
		var n = $(data);
		var list = '';
 		for (var i = 0; i < n.size(); i++) {
 			var date = moment(n[i].NOTICE_DATE).format('YY/MM/DD hh:mm a');
 			list += '<li class="cursor_pointer" onclick="notice_detail(this)"><a>';
 			if(n[i].NOTICE_CONTENT == null){
 				var content = "내용이 없습니다";
 			}else{
 				var content = n[i].NOTICE_CONTENT.substr(0,25);
 				if(n[i].NOTICE_CONTENT.length > 25){
 	 				content += '...';
 	 			}
 			}
 			if(n[i].STATE_CODE == 1){ //새로운 알림
 				list += '<span class="label label-warning" style="font-size:110%; height:20px; padding:4px">';
 				list += '<i class="fas fa-envelope"></i></span> ';
 			}else if(n[i].STATE_CODE == 3){ //프로젝트 초대 알림
 				list += '<span class="label label-primary" style="font-size:110%; height:20px; padding:4px">';
 				list += '<i class="fas fa-sign-in-alt"></i></span> ';
 			}else if(n[i].STATE_CODE == 4){ //초대 회원의 프로젝트 승인 알림
 				list += '<span class="label label-success" style="font-size:110%; height:20px; padding:4px">';
 				list += '<i class="fas fa-laugh"></i></span> ';
 			}else if(n[i].STATE_CODE == 5){ //초대 회원의 프로젝트 거절 알림
 				list += '<span class="label label-default" style="font-size:110%; height:20px; padding:4px">';
 				list += '<i class="fas fa-frown-open"></i></span>';
 			}else if(n[i].STATE_CODE == 6){ //프로젝트 퇴출 알림
 				list += '<span class="label label-danger" style="font-size:110%; height:20px; padding:4px">';
 				list += '<i class="fas fa-sign-out-alt"></i></span> ';
 			}
 				list += '<span id="notice_content_substr">'+ content +'</span>';
 				if(n[i].NOTICE_CONTENT == null){
 					list += '<span id="notice_content" hidden="hidden">내용이 없습니다.</span>';
 				}else{
	 				list += '<span id="notice_content" hidden="hidden">'+ n[i].NOTICE_CONTENT +'</span>';
 				}
				list += '<span class="small italic" id="notice_date" style="text-align:right">' + date + '</span>';
				list += '<input type="hidden" id="user_n_code" value="' + n[i].USER_N_CODE +'">';
 				list += '<input type="hidden" id="addressee_code" value="' + n[i].ADDRESSEE_CODE +'">';
 				list += '<input type="hidden" id="sender_code" value="' + n[i].SENDER_CODE +'">';
 				list += '<input type="hidden" id="state_code" value="' + n[i].STATE_CODE +'">';
 				if(n[i].SENDER_NAME == null){
 					list += '<input type="hidden" id="sender_id">';
 				}else{
 					list += '<input type="hidden" id="sender_id" value="' + n[i].SENDER_NAME + "(" + n[i].SENDER_ID + ")" +'">';
 				}
 				list += '</a></li>';
		}
 		list += '<li style="text-align: right"><a href="/cally/business/notice_all">지난 알림 보기</a></li>';
		$('#biz_notice').append(list);
		
	},
    error: function() {
         alert('알림 로드 실패');
    } 
});
}

//캘린더 수정(업데이트)
function cal_up(){
	if ($('#modal_c_detail #cal_title').val() == "") {
		alert("제목을 입력해주세요");
	} else {
		if (confirm("일정을 수정하시겠습니까?")) {
			if($('#cal_important').not(':checked')){ $('#cal_important').val('n'); }
			$('#cal_start').val(moment($('#cal_start').val() + " " + $('#cal_starttime').val()).format('YYYY/MM/DD HH:mm:ss'));
			$('#cal_end').val(moment($('#cal_end').val() + " " + $('#cal_endtime').val()).format('YYYY/MM/DD HH:mm:ss'));
			var form = $('#bizc_up_f')[0];
			var formData = new FormData(form);
			$.ajax({ 
				url: '/cally/business/cal_up',
			    type: 'POST',
			    processData: false,
                contentType: false,
	            data : formData,
			    dataType : 'text',
				success: function(result) {
					if(result == 'y'){
						alert("일정이 수정되었습니다.");
						location.reload();
					}
				},
			    error: function() {
			         alert('수정 실패');
			    } 
			});
		}
	}
}
</script>