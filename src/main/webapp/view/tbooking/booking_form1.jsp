<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="../css/tbooking.css">
<style>
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
</style>
		<!--main content start-->
		<section id="main-content">
			<section class="wrapper">
				<div class="row">
					<div class="col-lg-9 main-chart">
						<div id="container">
							<!-- container -->
								<div id="contents">
								<!-- contents -->
									<div class="content">
									<!-- content -->
										<!-- title -->
										<div class="s_visualtra01">
											<p class="location">
												<a href="#" onclick="m_main_prd_link();">홈</a> &gt; 
												<a href="#" onclick="return m_menuPrd1_1_1_link();">열차예약</a> &gt; 
												<h3 class="title" id="ebizPrdPageTitle">일반승차권</h3>
										</div>
										<!-- //title -->
										<div class="cont_info" id="center">
										<!-- cont_info -->				
											<div class="step_tick">
												<ul>
												<li><img name="imgStep01" src="/images/prd/step_tck01_on.gif;jsessionid=OmwJxJdanjqSjzBhA8eTQ0B76APfU8o8K3vwlt3yADCnhLaa0rO1sgGrShut0q8T" alt="STEP01 조회"></li>
												<li><img name="imgStep02" src="/images/prd/step_tck02.gif;jsessionid=OmwJxJdanjqSjzBhA8eTQ0B76APfU8o8K3vwlt3yADCnhLaa0rO1sgGrShut0q8T" alt="STEP02 예매"></li>
												<li><img name="imgStep03" src="/images/prd/step_tck03.gif;jsessionid=OmwJxJdanjqSjzBhA8eTQ0B76APfU8o8K3vwlt3yADCnhLaa0rO1sgGrShut0q8T" alt="STEP03 결제"></li>
												<li><img name="imgStep04" src="/images/prd/step_tck04.gif;jsessionid=OmwJxJdanjqSjzBhA8eTQ0B76APfU8o8K3vwlt3yADCnhLaa0rO1sgGrShut0q8T" alt="STEP04 발권"></li>
												</ul>
											</div>					
											<div class="tab">
												<ul class="control tab04">
													<li><a href="#wrap" onclick="fn_GomoveEbizUrl('form1' , m_menuPrd1_1_1);" class="on">일반승차권</a></li>
												</ul>
											</div>
											<form name="form1" method="post" action="">
											<input type="hidden" name="run" value="">
											<input type="hidden" name="selGoTrain" value="05">
											<div class="ticket_box"><!-- 일반승차권 직통예약 -->
												<div class="part_lef" style="height:261px"><!-- part_lef -->
												
													<div class="box_ck01"><!-- box_ck01 -->
														<h4 class="blind">인원/장애/할인 선택</h4>
														<dl class="pt01">
														<dt>인원정보</dt>
														<dd>
															<ul>
																<li><label for="peop01">어른</label>
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
																<li><label for="peop02">만 4세~12세 소아</label>
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
														</dd>
														</dl>
													</div><!-- //box_ck01 -->
													<div class="box_ck03"><!-- box_ck03 -->
														<dl>
														<dt>좌석종류선택</dt>
														<dd><label for="seat01">창/내측/1인좌석종별</label>
															<select id="seat01" name="txtSeatAttCd_3" title="차실/좌석 : 창/내측/1인좌석종별" class="selt60" onchange="chgSeatAttCd_3()">
																<option value="000" selected="selected">기본</option>
																<option value="011">1인석</option>
																<option value="012">창측좌석</option>
																<option value="013">내측좌석</option>
															</select>
														</dd>
														</dl>
													</div><!-- //box_ck03 -->
												</div><!-- //part_lef -->
												<div class="part_rig" style="height:239px"><!-- part_rig-->
													<ul class="tra_box box2">
														<li class="wd20"><input type="radio" name="selGoTrainRa" value="05" title="전체" onclick="fnSelGoTrain('05','1');" checked="checked"><label>전체</label></li>
														<li><input type="radio" name="selGoTrainRa" value="00" title="KTX" onclick="fnSelGoTrain('00','2');"><label>KDX⁄KDX–산천⁄XRT</label></li>
														<li class="ml20p"><input type="radio" name="selGoTrainRa" value="08" title="ITX-새마을" onclick="fnSelGoTrain('08','9');"><label>새마을호⁄ITX-새마을</label></li>
														<li><input type="radio" name="selGoTrainRa" value="02" title="무궁화호" onclick="fnSelGoTrain('02','4');"><label>개나리호⁄우리로</label></li>
													</ul>
													<div class="rbox_cont">
														<dl class="pt01">
														<dt>여정경로</dt>
														<dd><input type="radio" id="route01" name="radJobId" value="1" onclick="javascript:gourl('1');" onkeypress="javascript:gourl('1');" checked="checked"><label for="route01">직통</label>&nbsp;&nbsp;&nbsp;
															<input type="radio" id="route02" name="radJobId" value="2" onclick="javascript:gourl('2');" onkeypress="javascript:gourl('2');"><label for="route02" style="margin-right: 0px;">환승&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
															<input type="radio" id="route03" name="radJobId" value="3" onclick="javascript:gourl('3');" onkeypress="javascript:gourl('3');"><label for="route03">왕복<!-- &nbsp;(사랑여행 KTX 묶음상품) --></label>
														</dd>
														</dl>
														<dl class="pt02">
														<dt><label for="start">출발역</label></dt>
														<dd><input id="start" name="txtGoStart" type="text" class="inp250" value="서울" title="출발역" autocomplete="off" style="ime-mode:active"><a href="javascript:btnPopWin(1,'txtGoStart')"><img src="/images/btn_tra_sch.png" alt="조회"></a>
														</dd>
														</dl>
														
														<dl class="pt02">
														<dt><label for="get">도착역</label></dt>
														<dd><input id="get" name="txtGoEnd" type="text" class="inp250" value="부산" title="도착역" autocomplete="off" style="ime-mode:active"><a href="javascript:btnPopWin(1,'txtGoEnd')"><img src="/images/btn_tra_sch.png" alt="조회"></a>&nbsp;
															<a href="#" onclick="sta_chg('form1');" title="변경 버튼을 누르면 출발역과 도착역이 서로 바뀝니다"><img src="/images/btn_tra_chg.png" alt="출발/도착역 교환"></a>
															<input type="hidden" name="txtGoStartCode" value="">
															<input type="hidden" name="txtGoEndCode" value="">
														</dd>
														</dl>
														
														<dl class="pt03">
														<dt>출발일</dt>
														<dd><label for="s_year" class="blind">출발년도</label>
															<select id="s_year" name="selGoYear" onchange="isValidDateSetting(form1.selGoYear,form1.selGoMonth,form1.selGoDay,form1.selGoHour);" title="출발일시 : 년도">
																<option value="2018" selected="selected">2018</option>
																<option value="2019">2019</option>
																<option value="2020">2020</option>
															</select>년
															<label for="s_month" class="blind">출발월</label>
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
															<label for="s_day" class="blind">출발일자</label>
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
															<label for="s_hour" class="blind">출발시</label>
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
															</select>시<input type="hidden" name="txtGoHour">
															<label for="s_week" class="blind">출발요일</label>
															<input id="s_week" type="text" size="2" name="txtGoYoil" value="일월화수목금토일" readonly="readonly" title="출발일시 : 요일" class="inp20">&nbsp;<a href="javascript:btnPopWin(2,'Go','N')" title="달력 새창열기"><img src="/images/btn_calen02.gif" alt="달력"></a>
														</dd>
														</dl>
													</div>
												</div><!-- //right box-->
												<p class="btn_inq"><a href="javascript:inqSchedule()"><img src="/images/btn_inq_tick.gif" alt="조회하기"></a></p>
											</div><!-- //예약 -->
											<!-- 좌석속성과 객실속성을 주석처리함으로써 표현 -->
											<input type="hidden" name="selGoSeat1" value="015">
											<input type="hidden" name="selGoSeat2" value="015">
											<input type="hidden" name="txtPsgCnt1" value="0">
											<input type="hidden" name="txtPsgCnt2" value="0">
											<!-- 좌석속성과 객실속성을 주석처리함으로써 표현 끝-->
											<input type="hidden" name="txtGoPage" value="1">
											<input type="hidden" name="txtGoAbrdDt" value="">
											<input type="hidden" name="selGoRoom" value="">
											<input type="hidden" name="useSeatFlg">
											<input type="hidden" name="useServiceFlg">
											<input type="hidden" name="checkStnNm" value="Y">
											<input type="hidden" name="txtMenuId" value="11">			
											<input type="hidden" name="SeandYo" value="">					
											<input type="hidden" name="txtGoStartCode2" value="">
											<input type="hidden" name="txtGoEndCode2" value="">
											<input type="hidden" name="selGoStartDay" value="">
											<input type="hidden" name="hidEasyTalk" value=""><!-- 편한대화 2012.04.13 ljy -->
											</form> 
											<div class="state" style="display:block"><!--숨은 영역-->
											</div><!--//숨은 영역-->
										<!-- //cont_info -->
										</div>
									<!-- //content -->
									</div>
										
									<div id="snv">
									<!-- sub nav -->
						 <script type="text/javascript" src="/js/pwdConfirm/pwdConfirmYn.js?v=201810111137"></script>
						 <script type="text/javascript" src="/js/egovframework/korail/common/menu_custom.js?_=1539225431602"></script>
									<!-- //sub nav -->
									</div>
									<div class="quick">
									<!-- quick -->
									<!-- //quick -->
									</div>
								<!-- //contents -->	
								</div>
							<!-- //container -->
						</div>
					</div>
						<div class="col-lg-3 ds">
					</div>
				</div>
			</section>
		</section>
		    <%@ include file="js.jspf" %>