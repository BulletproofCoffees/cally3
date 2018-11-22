<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="sidemenu.jsp"%>
<link
	href="${pageContext.request.contextPath}/css/callyPlus/s_style.css"
	rel="stylesheet">
<section id="main-content">
	<section class="wrapper">
		<h3>
			<i class="fa fa-angle-right"></i>영화개요
		</h3>
		<hr>
		<%-- <input type="hidden" value="${detail }"> --%>
		<div class="row mt">
			<div class="col-md-2">
				<h1>썸네일</h1>
				<br> <img
					src="${pageContext.request.contextPath}/img/callyPlus/${movieI.MMI_IMG}"
					width="100%;"><br>
			</div>
			<div class="col-md-5">
				<h1>주요 정보</h1>
				<br>
				<br>
				<div class="custom_set" style="font-size: 20px;">
					<p>제목 : ${movieI.MMI_NAME }</p>
					<p>장르 : ${movieI.MMT_NAME }</p>
					<p>상영등급 : ${movieI.MMG_NAME }</p>
					<p>감독 : ${movieDerec.MMC_NAME }</p>
				</div>
				<br>
				<br>
				<h2>줄거리</h2>
				<br>
				<br>
				<p>${movieI.MMI_PLOT }</p>
			</div>
			<div class="col-md-5">
				<input type="hidden" value="${movieI.MMI_TRAILER }" name="yid">
				<div id="player"></div>
			</div>
		</div>
		<hr>
		<h3>
			<i class="fa fa-angle-right"></i>좌석구조도
		</h3>
		<form class="form-horizontal" method="post" action = "../up_reserv" onsubmit="return check();">
			<div class="row mt">
				<div class="col-md-12">
					<div class="t_content">
						<div class="t_main">
							<h2>상영관 약도</h2>
							<div class="demo">
								<div id="seat-map">
									<div class="t_front">화면</div>
								</div>
								<div class="booking-details">
									<ul class="book-left">
										<li>영화제목</li>
										<li>상영시각</li>
										<li>표</li>
										<li>총액</li>
										<li>좌석 :</li>
									</ul>
									<ul class="book-right">
										<li>:${movieI.MMI_NAME}</li>
										<li id="mdate">:${scheduleS[0].MDATE} // <select>
												<option>선택</option>
												<c:forEach items="${scheduleS }" var="sc">
													<option value="${sc.mst_code }"selected>${sc.STIME }</option>
												</c:forEach>
										</select></li>
										<li>: <span id="counter">0장</span></li>
										<li>: <b><i></i><span id="total">0원</span></b></li>
									</ul>
									<div class="clear"></div>
									<ul id="selected-seats" class="scrollbar scrollbar1"></ul>
									<button class="checkout-button" value="1" id="checkb">예매하기</button>
									<div id="legend"></div>
								</div>
								<div style="clear: both"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<input type="hidden" value="${scheduleS[0].MS_NO }" name="ms_no">
			<input type="hidden" value="${scheduleS[0].MO_PAY }" name="s_pay">
			<input type="hidden" value="${scheduleS[0].MDATE }" name="s_time">
			<input type="hidden" value="${scheduleS[0].M_C_NO }" name="cno">
			<input type="hidden" value="${scheduleS[0].MMI_NO }" name="detail">
			예약번호<input type="hidden" value="${reserv_no[0].MR_NO }" name="maxRes">
			<c:forEach items="${seat_state }" var ="ss_state">
			<input type="hidden" value="${ss_state.MSP_NAME}" class="ss">
			</c:forEach> 
		</form>
	</section>
</section>
<script>
	var s_num = 0;
	var s_time = $('input[name="s_time"]').val();
	
	$.ajax({
		url : "${pageContext.request.contextPath}/movie/reservAdd",
		data : {
			s_time : $('input[name="s_time"]').val(),
			ms_no : $('input[name="ms_no"]').val()
		},
		type : 'POST',
		dataType : 'text',
		error : function (request, error) {
	        alert(" reserv > Can't do because: " + error); 
			
	    }
	});
	$(document).ready(function() { 
		if (self.name != 'reload') {
	         self.name = 'reload';
	         self.location.reload(true);
	     }
	     else self.name = '';  });
	
	isChecked = true;
	function check(){
		isChecked = false;
		return true;	
	}
	$(window).bind("beforeunload", function (e){
		if (isChecked) {
			$.ajax({
				url : "${pageContext.request.contextPath}/movie/seat_del",
				data : {
					mr_no : $('input[name="maxRes"]').val()
				},
				type : "post"				
			});
		}
	});
	
</script>


<%@ include file="js.jspf"%>
