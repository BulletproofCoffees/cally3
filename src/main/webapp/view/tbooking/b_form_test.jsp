<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/view/tbooking/sidebar.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="../css/tbooking.css">
<style>
.calPopPage{
display:none;
width:300px;
height:200px;
}
.book_box_detail{
display:none;
}
.contTotal{
padding:0px 10%;
}
.tab ul li , .step_tick ul li{
display:inline-block;
}
.box_ck01{
border:1px solid red;
}
.box_ck03{
border:1px solid red;
}
.part_rig{
border:1px solid red;
}
.ticket_box{
border:1px solid red;
}
.smallcon{
vertical-align:middle;
width:30px;
height:30px;
}
.checkbtn{
background-color:red;
text-decoration:none;
color:white;
}
.book_box05{
display:inline-block;
}
</style>
<script type="text/javascript">
function test(){
	if ($(".book_box_detail").is(":hidden")) { 
		$(".book_box_detail").slideDown("slow"); 
	} else { 
		$(".book_box_detail").hide(); 
	}
}
function calPop() {
	window.open("calPop.jsp", "a", "width=400, height=300, left=100, top=50");
}

</script>
		<!--main content start-->
<section id="main-content">
	<section class="wrapper">
		<div class="row">
			<div class="col-lg-9 main-chart">
				<div id="container">
<!-- 여기서부터 시작이라고 보면 됨 -->
  <div class="row">
    <div class="col-sm-4" style="background-color:lavender;">.col-sm-4</div>
    <div class="col-sm-8" style="background-color:lavenderblush;">.col-sm-8</div>
  </div>
<div class="contTotal">
	<div class="book_box_total row"><!-- 북 박스 토탈 시작 -->
		<div class="bookbox book_box01">	<!-- 박스1 인원정보 -->
			<h4>인원선택</h4>
			<ul>
				<li id="peop01list"> <!-- 어른 수 -->
					<label>어른</label>
					<select id="peop01" name="txtPsgFlg_1" title="인원정보 : 어른" style="width:110px;">
						<option value="0">어른 0명</option>
						<option selected="selected" value="1">어른 1명</option>
						<option value="2">어른 2명</option>
						<option value="3">어른 3명</option>
						<option value="4">어른 4명</option>
						<option value="5">어른 5명</option>							
						<option value="6">어른 6명</option>
						<option value="7">어른 7명</option>
						<option value="8">어른 8명</option>
						<option value="9">어른 9명</option>
					</select>
				</li>
				<li id="people02list"> <!-- 아이 수 -->
					<label for="peop02">만 4세~12세 소아</label>
					<select id="peop02" name="txtPsgFlg_2" title="인원정보 : 만 4세 ~ 12세 어린이" style="width:110px;">
						<option selected="selected" value="0">만 4세~12세</option>
						<option value="1">어린이 1명</option>
						<option value="2">어린이 2명</option>
						<option value="3">어린이 3명</option>
						<option value="4">어린이 4명</option>
						<option value="5">어린이 5명</option>
						<option value="6">어린이 6명</option>
						<option value="7">어린이 7명</option>
						<option value="8">어린이 8명</option>
						<option value="9">어린이 9명</option>
					</select>
				</li>
			</ul>
		</div>
		<div class="bookbox book_box02">	<!-- 박스2 좌석정보 -->
			<h4>좌석종류선택</h4>
			<ul>
				<li id="seatlist">	<!-- 좌석종류 -->
					<label>창/내측/1인좌석</label>
					<select id="seat01" name="txtSeatAttCd_3" title="차실/좌석 : 창/내측/1인좌석종별" class="selt60" onchange="chgSeatAttCd_3()">
						<option value="000" selected="selected">기본</option>
						<option value="011">1인석</option>
						<option value="012">창측좌석</option>
						<option value="013">내측좌석</option>
					</select>
				</li>
			</ul>
		</div>
		<div class="bookbox book_box03">	<!-- 박스3 열차정보 -->
			<h4>열차종류선택</h4>
			<ul>
				<li class="wd20"><input type="radio" name="selGoTrainRa" value="05" title="전체" onclick="fnSelGoTrain('05','1');" checked="checked"><label>전체</label></li>
				<li><input type="radio" name="selGoTrainRa" value="00" title="KTX" onclick="fnSelGoTrain('00','2');"><label>KDX⁄KDX–산천⁄XRT</label></li>
				<li class="ml20p"><input type="radio" name="selGoTrainRa" value="08" title="ITX-새마을" onclick="fnSelGoTrain('08','9');"><label>새마을호⁄ITX-새마을</label></li>
				<li><input type="radio" name="selGoTrainRa" value="02" title="무궁화호" onclick="fnSelGoTrain('02','4');"><label>개나리호⁄우리로</label></li>
			</ul>
		</div>
		<div class="bookbox book_box04">	<!-- 박스4 도착출발역정보 -->
			<h4>여정선택</h4>
			<ul>
				<li>	<!-- 출발역정보 -->
					<label>출발역</label>
					<input id="start" name="txtGoStart" type="text" class="inp250" value="서울" title="출발역" autocomplete="off" style="ime-mode:active">
					<a href="javascript:btnPopWin(1,'txtGoStart')">
					<img src="/images/btn_tra_sch.png" alt="조회"></a>
				</li>
				<li>	<!-- 도착역정보 -->
					<label>도착역</label>
					<input id="get" name="txtGoEnd" type="text" class="inp250" value="부산" title="도착역" autocomplete="off" style="ime-mode:active"><a href="javascript:btnPopWin(1,'txtGoEnd')"><img src="/images/btn_tra_sch.png" alt="조회"></a>&nbsp;
					<a href="#" onclick="sta_chg('form1');" title="변경 버튼을 누르면 출발역과 도착역이 서로 바뀝니다"><img src="/images/btn_tra_chg.png" alt="출발/도착역 교환"></a>
					<input type="hidden" name="txtGoStartCode" value="">
					<input type="hidden" name="txtGoEndCode" value="">
				</li>
			</ul>
		</div>
		<div class="bookbox book_box05">	<!-- 박스5 출발날짜정보 -->
			<h4>출발일</h4>
			<ul>
				<li>
					<label>출발년도</label>
					<select id="s_year" name="selGoYear" onchange="isValidDateSetting(form1.selGoYear,form1.selGoMonth,form1.selGoDay,form1.selGoHour);" title="출발일시 : 년도">
						<option value="2018" selected="selected">2018</option>
						<option value="2019">2019</option>
						<option value="2020">2020</option>
					</select>년
				</li>
				<li>
					<label>출발월</label>
					<select id="s_month" name="selGoMonth" onchange="isValidDateSetting(form1.selGoYear,form1.selGoMonth,form1.selGoDay,form1.selGoHour);" title="출발일시 : 월">
						<option value="01">1</option>
						<option value="02">2</option>
						<option value="03">3</option>
						<option value="04">4</option>
						<option value="05">5</option>
						<option value="06">6</option>
						<option value="07">7</option>									
						<option value="08">8</option>									
						<option value="09">9</option>									
						<option value="10">10</option>									
						<option value="11">11</option>									
						<option value="12">12</option>									
					</select>월
				</li>
				<li>
					<label>출발일자</label>
					<select id="s_day" name="selGoDay" onchange="isValidDateSetting(form1.selGoYear,form1.selGoMonth,form1.selGoDay,form1.selGoHour);" title="출발일시 : 일">
						<option value="01">1</option>									
						<option value="02">2</option>									
						<option value="03">3</option>								
						<option value="04">4</option>								
						<option value="05">5</option>								
						<option value="06">6</option>								
						<option value="07">7</option>					
						<option value="08">8</option>	
						<option value="09">9</option>					
						<option value="10">10</option>				
						<option value="11">11</option>					
						<option value="12">12</option>						
						<option value="13">13</option>					
						<option value="14">14</option>
						<option value="15">15</option>									
						<option value="16">16</option>									
						<option value="17">17</option>									
						<option value="18">18</option>									
						<option value="19">19</option>									
						<option value="20">20</option>
						<option value="21">21</option>
						<option value="22">22</option>
						<option value="23">23</option>
						<option value="24">24</option>
						<option value="25">25</option>
						<option value="26">26</option>
						<option value="27">27</option>
						<option value="28">28</option>
						<option value="29">29</option>
						<option value="30">30</option>
						<option value="31">31</option>
					</select>일
				</li>
				<li>
					<label>출발시</label>
					<select id="s_hour" name="selGoHour" title="출발일시 : 시">
						<option value="00">0 (오전00)</option>
						<option value="01">1 (오전01)</option>
						<option value="02">2 (오전02)</option>
						<option value="03">3 (오전03)</option>
						<option value="04">4 (오전04)</option>
						<option value="05">5 (오전05)</option>
						<option value="06">6 (오전06)</option>
						<option value="07">7 (오전07)</option>
						<option value="08">8 (오전08)</option>
						<option value="09">9 (오전09)</option>
						<option value="10">10 (오전10)</option>
						<option value="11">11 (오전11)</option>
						<option value="12">12 (오후00)</option>
						<option value="13">13 (오후01)</option>
						<option value="14">14 (오후02)</option>
						<option value="15">15 (오후03)</option>
						<option value="16">16 (오후04)</option>
						<option value="17">17 (오후05)</option>
						<option value="18">18 (오후06)</option>
						<option value="19">19 (오후07)</option>
						<option value="20">20 (오후08)</option>
						<option value="21">21 (오후09)</option>
						<option value="22">22 (오후10)</option>
						<option value="23">23 (오후11)</option>
					</select>시
				</li>
				<li>
					<input id="s_week" type="text" size="2" name="txtGoYoil" value="" readonly="readonly" title="출발일시 : 요일">&nbsp;
					<a href="javascript:btnPopWin(2,'Go','N')" title="달력 새창열기">
					<img id="calPop"class="smallcon" src="img/tbooking/calicon.jpg" alt="달력" onclick="calPop()"></a>
				</li>
			</ul>
			</div>
		<div class="bookbox book_box06">	<!-- 박스6 조회하기버튼 -->
			<button onclick="test()">조회하기</button>
		</div>
	</div><!-- //북 박스 토탈 끝 -->
	<div id="book_box_detail" class="book_box_detail"><!-- 조회하기 버튼 클릭스 생성되는 곳 북 박스 디테일 시작 -->
		<table class="table" summary="좌석정보 1열 객실등급,2열 좌석정보,3열 승객유형,4열 운임요금,5열 할인금액,6열 영수금액,7열 승차자명">
			<thead>
				<tr>
					<th>열차이름</th>
					<th>열차번호</th>
					<th>출발/도착</th>
					<th>도착/시간</th>
					<th>일반실</th>
					<th>남은좌석</th>
					<th>요금</th>
					<th>소요시간</th>
				</tr>
			</thead>
			<tbody>
				<tr class="danger">
					<td>ex)내마을호</td>
					<td>ex)10월12일</td>
					<td>ex)1223</td>
					<td>ex)서울</td>
					<td><a href="#"/>좌석선택</a></td>
					<td>ex)부산</td>
					<td>ex)00:44</td>  
					<td>ex)00:44</td> 
				</tr>
			</tbody>
		</table>
	</div><!-- //북 박스 디테일 끝 -->
</div>
<!-- 여기까지가 끝이라고 보면 됨 -->
				</div>
			</div>
		</div>
	</section>
</section>
    <%@ include file="js.jspf" %>