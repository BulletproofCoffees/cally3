<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="../css/tbooking.css">
<style>
* {
	padding: 0 0 0 0;
	margin: 0%;
}

.stationsF {
	width: 10rem;
	display: inline-block;
}

.searBB {
	height: 20px;
	font-size: 10px;
	vertical-align: middle;
}

.main-chart {
	width: 80%;
	margin: 0% 5% 0% 10%;
}

.startDateList li {
	display: inline-block;
}

.info, td {
	border: 1px solid none;
	text-align: center;
}

.h4title {
	font-size: 1em;
}

.calPopPage {
	display: none;
	width: 300px;
	height: 200px;
}
/* .book_box_detail{
display:none;
} */
table div div {
	text-align: left;
}

.tab ul li, .step_tick ul li, .listdiv ul li {
	display: inline-block;
}

.smallcon {
	vertical-align: middle;
	width: 30px;
	height: 30px;
}

.col-md-2 {
	width: 100%;
}
/* -------------------- */
.seatImg {
	width: 20px;
	height: 20px;
}

td {
	font-size: 9pt;
	font-family: 돋움;
}

li {
	list-style: none;
}

.seatNum {
	background-color: grey;
}

.seatNum ul li {
	display: inline-block;
	border-right: 2px solid grey;
	padding: 0% 2% 0% 0%;
}

.contTotal {
	
}

.rowcolNum {
	color: blue;
}

.modalseat {
	backgournd-color: white;
}
</style>

<%@ include file="/view/tbooking/sidebar.jsp"%>
<!-- **********************************************************************************************************************************************************
    MAIN CONTENT
    *********************************************************************************************************************************************************** -->
<!--main content start-->
<section id="main-content">
	<section class="wrapper">
		<div class="row">
			<div class="col-lg-9 main-chart">
				<div id="container">
					<!-- 여기서부터 시작이라고 보면 됨 -->
					<img class="img-rounded" width="100%" height="30%"
						src="img/callyPlus/trainm.jpg" />
					<div class="contTotal">
						<!-- book_box_total -->
						<form method="post" id="searchForm"
							action="b_form_b">
							<table width="100%">
								<tr class="content-panel">
									<td>
										<!-- 좌측 그리드 -->
										<div class="leftGrid col-md-2">

											<%-- 											<div class="listdiv">
												<!-- 인원정보 -->
												<h4 class="h4title" onclick="date()">
													<span class="glyphicon glyphicon-play"></span>&ensp;인원선택
												</h4>
												<ul>
													<li id="peop01list">
														<!-- 어른 수 --> <select id="peop01" class="form-control"
														name="txtPsgFlg_1" title="인원정보 : 어른" style="width: 110px;">
															<c:forEach var="i" begin="1" end="9">
																<option value="i">어른 ${i}명</option>
															</c:forEach>
													</select>
													</li>
													<li id="people02list">
														<!-- 아이 수 --> <select id="peop02" class="form-control"
														name="txtPsgFlg_2" title="인원정보 : 만 4세 ~ 12세 어린이"
														style="width: 130px;">
															<option selected="selected" value="0">만 4세~12세</option>
															<c:forEach var="i" begin="1" end="9">
																<option value="i">어린이 ${i}명</option>
															</c:forEach>
													</select>
													</li>
												</ul>
											</div> --%>
										</div>
									</td>
									<td>
										<!-- 우측그리드 -->
										<div class="rightGrid col-md-10 content-panel">
											<div class="bookbox book_box03 col-md-3">
												<!-- 박스3 열차정보 -->
												<h4 class="h4title">
													<span class="glyphicon glyphicon-play"></span>&ensp;열차선택
												</h4>
												<ul class="stationInfo">
													<!-- 													<li><input type="radio" name="selGoTrainRa" value="0" title="전체"
														onclick="fnSelGoTrain('05','1');" checked="checked"><label>전체</label></li> -->
													<li><input type="radio" name="selGoTrainRa" value="1"
														title="KTX" onclick="fnSelGoTrain('00','2');"><label>KTX⁄KTX–산천⁄XRT</label></li>
													<!-- 													<li><input type="radio" name="selGoTrainRa" value="2" title="ITX-새마을"
														onclick="fnSelGoTrain('08','9');"><label>새마을호⁄ITX-새마을</label></li>
													<li><input type="radio" name="selGoTrainRa" value="3"
														title="무궁화호" onclick="fnSelGoTrain('02','4');"><label>개나리호⁄우리로</label></li> -->
												</ul>
											</div>
											<div class="bookbox book_box04 col-md-9">
												<!-- 박스4 도착출발역정보 -->
												<h4 class="h4title">
													<span class="glyphicon glyphicon-play"></span>&ensp;여정선택
												</h4>
												<ul>
													<li>
														<!-- 출발역정보 --> <input class=" form-control stationsF"
														id="startS" name="startS" type="text" placeholder="서울"
														title="출발역" />
														<button class="btn btn-info" type="button" value="조회"
															data-toggle="modal" data-target="#myModal">조회</button>
													</li>
													<li>
														<!-- 도착역정보 --> <input class=" form-control stationsF"
														id="arriS" name="arriS" type="text" placeholder="부산"
														title="도착역" />
														<button class="btn btn-info" type="button" value="조회"
															data-toggle="modal" data-target="#myModal1">조회</button>
														<button class="btn btn-warning" type="button" value="변경"
															onclick="stChange()">변경</button>
													</li>
												</ul>
												<h4 class="h4title">
													<span class="glyphicon glyphicon-play"></span>&ensp;출발일
												</h4>
												<ul class="startDateList">
 													<li><select id="s_year" class="form-control"
														name="selGoYear"
														onchange="isValidDateSetting(form1.selGoYear,form1.selGoMonth,form1.selGoDay,form1.selGoHour);"
														title="출발일시 : 년도">
															<c:forEach var="i" begin="2018" end="2020">
																<option value="${i}">${i}년</option>
															</c:forEach>
													</select></li>
													<li><select id="s_month" class="form-control"
														name="selGoMonth"
														onchange="isValidDateSetting(form1.selGoYear,form1.selGoMonth,form1.selGoDay,form1.selGoHour);"
														title="출발일시 : 월">
															<c:forEach var="i" begin="1" end="12">
																<option value="${i}">${i}월</option>
															</c:forEach>
													</select></li>
													<li><select id="s_day" class="form-control"
														name="selGoDay"
														onchange="isValidDateSetting(form1.selGoYear,form1.selGoMonth,form1.selGoDay,form1.selGoHour);"
														title="출발일시 : 일">
															<c:forEach var="i" begin="1" end="31">
																<option value="${i}">${i}일</option>
															</c:forEach>
													</select></li>
													<li><select id="s_hour" class="form-control"
														name="selGoHour" title="출발일시 : 시">
															<c:forEach var="i" begin="00" end="23">
																<option value="${i}">${i}시</option>
															</c:forEach>
													</select></li>
													<li>
														<!-- <input type="date" id="date"> --> <!-- 					<input id="s_week" type="text" size="2" name="txtGoYoil" value="" readonly="readonly" title="출발일시 : 요일">&nbsp; -->
														<!-- <img id="calPop"class="smallcon" src="img/tbooking/calicon.jpg" alt="달력" onclick="calPop()"> -->
													</li>
												</ul>
											</div>
										</div> <!-- 우측그리드끝 -->
									</td>
								</tr>
							</table>
						</form>
						<div class="search">
							<!-- 조회하기버튼 -->
							<button type="button" onclick="search()" class="btn btn-info">조회하기</button>
						</div>
						<div id="book_box_detail" class="book_box_detail">
							<!-- 조회하기 버튼 클릭스 생성되는 곳 북 박스 디테일 시작 -->
							<table id="boxdetail" class="table" summary="">
							</table>
						</div>
						<!-- //북 박스 디테일 끝 -->

						<!-- Modal -->
						<div class="modal fade" id="myModal" role="dialog">
							<div class="modal-dialog">

								<!-- Modal content-->
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<h4 class="modal-title">출발역</h4>
									</div>
									<div class="modal-body">
										<table class="table">
											<c:forEach var="stList" items="${stInfoMain}" begin="1"
												step="1">
												<tr>
													<td><p id="stClick" data-dismiss="modal"
															value="${stList.ST_CODE}" onclick="stClick1(this)">${stList.ST_NAME}</p></td>
												</tr>
											</c:forEach>
										</table>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">Close</button>
									</div>
								</div>

							</div>
						</div>
						<!-- Modal -->
						<div class="modal fade" id="myModal1" role="dialog">
							<div class="modal-dialog">

								<!-- Modal content-->
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<h4 class="modal-title">도착역</h4>
									</div>
									<div class="modal-body">
										<table class="table">
											<c:forEach var="stInfoBook" items="${stInfoMain}" begin="1"
												step="1">
												<tr>
													<td><p id="stClick" data-dismiss="modal"
															value="${stInfoBook.ST_CODE}" onclick="stClick2(this)">${stInfoBook.ST_NAME}</p></td>
												</tr>
											</c:forEach>
										</table>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">Close</button>
									</div>
								</div>

							</div>
						</div>
						<!-- Modal -->
						<div class="modal fade" id="myModal3" role="dialog">
							<div class="modal-dialog">

								<!-- Modal content-->
								<div class="modal-content">
									<div class="modal-header">
										<div class="contTotal modalseat">
											<!-- book_box_total -->
											<ol>
												<li><em class="no_box">1.</em><strong>원하시는 좌석을
														선택하여 주십시오.</strong></li>
												<li><em class="no_box">2.</em>발매가 가능한 좌석을 선택하실 수 있습니다.
												</li>
												<li><em class="no_box">3.</em>원하시는 좌석을 선택 후 <strong>선택좌석
														「예약하기」</strong> 버튼을 클릭하시면 예약이 완료됩니다.</li>
												<li><em class="no_box">4.</em>원하지 않은 좌석이 선택된 경우에는 좌석을
													한번 더 클릭하시면 취소됩니다.</li>
											</ol>
											<form class="seatNum"
												action="view/tbooking/b_seats_action.jsp" method="post">
												<ul>
													<li class="firstCar" onclick="getCar(this.value)" value="1">1호차</li>
													<li class="secondCar" onclick="getCar(this.value)"
														value="2">2호차</li>
													<li class="thirdCar" onclick="getCar(this.value)" value="3">3호차</li>
													<li class="forthCar" onclick="getCar(this.value)" value="4">4호차</li>
													<li class="fifthCar" onclick="getCar(this.value)" value="5">5호차</li>
												</ul>
												<table class="seatTable">
													<tr height="30">
														<%
															int row = 4, col = 20;
															out.println("<td width='30'>&nbsp;</td>");
															for (int i = 1; i <= col; i++) {
																if (i != 1 && i % 5 == 1)
																	out.println("<td width='20'>&nbsp;</td>");
																out.println("<td class='rowcolNum' width='30' align='center'>" + i + "</td>");
															}
														%>
													</tr>
													<%
														String s;
														int a = 1;
														int b = 8;
														for (int i = 1; i <= row; i++) {
															if (i != 1 && i % 2 == 1) {
																out.print("<tr height='25'></tr>");
															}
															out.println("<tr height='25'>");
															out.println("<td class='rowcolNum' align='center'>" + i + "</td>");
															for (int j = 1; j <= col; j++) {
																if (j != 1 && j % 5 == 1) {
																	out.println("<td width='20'>&nbsp;</td>");
																}
																if (i == a && j == b) {
																	out.print("<td width='30' align='center'>");
																	s = i + ":" + j;
																	out.print("<img class='seatImg' src='img/callyPlus/redChair.jpg'>");
																	out.println("</td>");
																} else {
																	out.print("<td width='30' align='center'>");
																	s = i + ":" + j;
																	out.print("<input type='checkbox' name='ch' value='" + s
																			+ "'><img class='seatImg' src='img/callyPlus/greyChair.jpg'>");
																	out.println("</td>");
																}
															}
															out.println("</tr>");
														}
													%>
												</table>
											</form>
											<table>
												<tr>
													<td align="left"><input type="button" value="좌석예약"
														onclick="send();"></td>
												</tr>
											</table>
										</div>
									</div>
								</div>
								<!-- //book_box_total -->

							</div>
						</div>
					</div>
					<!-- //book_box_total -->
					<!-- 여기까지가 끝이라고 보면 됨 -->
				</div>
			</div>
		</div>
	</section>
</section>
<script>
	function getCar(no) {
		location.href = "/cally/testcar/" + no;
	}
	function send() {
		var getValue = $('#getCar').val();
		var f = document.forms[0];
		// 자바스트립트에서 표현식 사용 가능
		alert(getValue);
		$(".firstCar").attr("value")
		var n = 0;
		for (var i = 0; i < 20; i++) {
			if (f.ch[i].checked == true)
				n++;
		}
		if (n<1 || n>10) {
			alert("좌석은 1~10개 까지 가능 합니다.");
			return;
		}
		f.submit();
	}
	function stClick1(e) {
		var a = $('#arriS').val();
		var b = $(e).text();
		if (a == b) {
			alert('출발역과 도착역이 같습니다. 다른역을 선택하여 주십시오.')
		} else {
			$('#startS').val(b);
		}
	}
	function stClick2(e) {
		var a = $('#startS').val();
		var b = $(e).text();
		if (a == b) {
			alert('출발역과 도착역이 같습니다. 다른역을 선택하여 주십시오.')
		} else {
			$('#arriS').val(b);
		}
	}
	function stChange() {
		var a = $('#startS').val()
		var b = $('#arriS').val()
		$('#startS').val(b);
		$('#arriS').val(a);
	}

	function search() {
		var es = $("#searchForm").find("select,input");
		var t_name = null
		var data = "<form>";
		for (var i = 0; i < es.length; i++) {
			console.log(i + ":" + $(es[i]).attr("name"));
			// input인 경우
			data += "<input type='text' name='" + $(es[i]).attr("name")
					+ "' value='" + $(es[i]).val() + "' />";
		}
		data += "</form>";
		
		json = $(data).serializeArray();
		console.log(json);
		$.ajax({
					url : "b_form",
					data : json,
					dataType : 'text',
					type : 'POST',
					complete : function(data) {
						
						alert('실패');
						$("#boxdetail").empty();
						$("#boxdetail").append("<thead><tr><th>열차이름</th><th>열차번호</th><th>출발/시간</th><th>도착/시간</th><th>좌석</th><th>소요시간</th></tr></thead>")
						$("#boxdetail").append("<tbody><tr class='danger'><c:forEach var='checkT' items='${checkTrain}'>${checkT.trainKindCode}</td><td>${checkT.depStName}</td><td>${checkT.depTime}</td><td>${checkT.desStName}</td><td><input type='button' data-toggle='modal' data-target='#myModal3' value='좌석선택' alt='좌석선택'/></td><td>ex)00:44</td></c:forEach></tr></tbody>")
					}
				});
	}
/* (tk.tn_kind_code)trainKindCode,(tk.tn_kind_name)trainKindName, (tf.tn_num)trainNum, (ss.st_sp_code)depStCode, (si.st_name)depStName, SUBSTR((ss.sp_dep_time),10,2)depTime, (ss2.st_sp_code)desStCode, (si2.st_name)desStName, (ss2.sp_dep_time)desTime 
,(rt.rt_name)rootName */
	function seatPop() {
		window.open("b_t_form", "좌석선택팝업창",
				"width=900, height=320, resizable=no");
	}
</script>
<%@ include file="js.jspf"%>