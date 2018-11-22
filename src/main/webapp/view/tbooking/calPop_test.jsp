<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko"><head>
	


<meta http-equiv="Content-Type" content="application/xhtml+xml; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta http-equiv="Content-Script-Type" content="text/javascript">

<title>열차운행 달력조회</title>
<meta name="author" content="한국철도공사">
<meta name="copyright" content="300-720 대전광역시 동구 중앙로 240">
 
<script type="text/javascript" src="/com/selectKorailCoMessage.do"></script>

<!-- 메뉴관련 -->
<script type="text/javascript" src="/js/common/korailMenu.js"></script>
<script type="text/javascript" src="/js/egovframework/korail/common/menu1.js"></script>
<script type="text/javascript" src="/js/egovframework/korail/common/menu2.js"></script>
<script type="text/javascript" src="/js/egovframework/korail/common/menu3.js"></script>
<script type="text/javascript" src="/js/egovframework/korail/common/menu4.js"></script>
<script type="text/javascript" src="/js/egovframework/korail/common/menu5.js"></script>
<script type="text/javascript" src="/js/egovframework/korail/common/menu6.js"></script>
<script type="text/javascript" src="/js/egovframework/korail/common/menu7.js"></script>
<script type="text/javascript" src="/js/egovframework/korail/common/menu8.js"></script>
<script type="text/javascript" src="/js/egovframework/korail/common/menu9.js"></script>
<script type="text/javascript" src="/js/egovframework/korail/common/menu10.js"></script>
<script type="text/javascript" src="/js/egovframework/korail/common/menu11.js"></script>
<script type="text/javascript" src="/js/egovframework/korail/common/menu12.js"></script>
<script type="text/javascript" src="/js/egovframework/korail/common/menu13.js"></script>
<script type="text/javascript" src="/js/egovframework/korail/common/menu14.js"></script>
<script type="text/javascript" src="/js/egovframework/korail/common/menu15.js"></script>
<script type="text/javascript" src="/js/egovframework/korail/common/menu16.js"></script>
<script type="text/javascript" src="/js/egovframework/korail/common/menu17.js"></script>
<script type="text/javascript" src="/js/egovframework/korail/common/menu18.js"></script>
<script type="text/javascript" src="/js/egovframework/korail/common/menu19.js"></script>
<script type="text/javascript" src="/js/egovframework/korail/common/menu20.js"></script>
<script type="text/javascript" src="/js/egovframework/korail/common/menu21.js"></script>

<script type="text/javascript" src="/js/jquery.ui/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="/js/jquery.ui/jquery-ui-1.9.2.min.js"></script>
<script type="text/javascript" src="/js/jquery.ui/jquery.ui.core.js"></script>
<!-- <script type="text/javascript" src="/js/jquery.ui/jquery.ui.button.js"></script>		-->
<!-- <script type="text/javascript" src="/js/jquery.ui/jquery.ui.tabs.js"></script>			-->
<!-- <script type="text/javascript" src="/js/jquery.ui/jquery.ui.mouse.js"></script>		-->
<!-- <script type="text/javascript" src="/js/jquery.ui/jquery.ui.draggable.js"></script>	-->
<!-- <script type="text/javascript" src="/js/jquery.ui/jquery.ui.droppable.js"></script>	-->
<!-- <script type="text/javascript" src="/js/common/korailJquery.cookie.js"></script>  		-->
<script type="text/javascript" src="/js/common/korailCommon.js"></script>
<script type="text/javascript" src="/js/common/korailCommonUtil.js"></script>
<script type="text/javascript" src="/js/common/korailWindow.js"></script>

<script src="/js/jquery.plainmodal/jquery.plainmodal.min.js"></script>
<link rel="stylesheet" type="text/css" href="/js/jquery.plainmodal/jquery.plainmodal.css">

<link rel="stylesheet" type="text/css" href="/css/jquery.ui/jquery.ui.all.css">

<!-- 공통 CSS -->
<link rel="stylesheet" type="text/css" href="/css/korail.css">

<script>
function fn_chk_loginMsg(m_url) {
	var event = window.event || e ;
	var url = location.href;
	var menuURI = m_url;
	
	
		if (confirm("코레일멤버십 로그인 후 이용 가능합니다.\n\n계속하시겠습니까?")) {
			location.href = menuURI;
			return false;
		} else {
	 		if (event.stopImmediatePropagation) {
			 	event.stopImmediatePropagation(); 
			} else {
				location.href = url;
				return false;			
			}
		}
	
}
</script>



	
	
	
<link rel="stylesheet" type="text/css" href="/css/basic.css">
<link rel="stylesheet" type="text/css" href="/css/default.css">
<link rel="stylesheet" type="text/css" href="/css/sub_prd.css">
<link rel="stylesheet" type="text/css" href="/css/reserve.css">
	<style>
		.cal_red { color: #CC0000 }
		.cal_blue { color: #6666CC }
		.cal_black { color: #333333 }
		
		
		
		.bookable {cursor:pointer}
		.bookable:hover {text-decoration:underline}
		.unbookable {text-decoration:none; cursor:default}
	</style>

	
	
	<script language="javascript">
	var aBookableDate = new Array();
	var aUnBookableDate = new Array();
	
	function putDate(Year, Mon1, Mon, day1, day, yoil){
		var year     	= Year;
		var month    	= Mon;
	
		var opYear   	= 'sel'+'Go'+'Year';
		var opMonth  	= 'sel'+'Go'+'Month';
		var opDay    	= 'sel'+'Go'+'Day';
		var opHour   	= 'sel'+'Go'+'Hour';
		var opYoil   	= 'txt'+'Go'+'Yoil';
		var opStartDay  = 'sel'+'Go'+'StartDay';
		
		var objYear  	= opener.document.form1.elements[opYear ];
		var objMonth 	= opener.document.form1.elements[opMonth];
		var objDay   	= opener.document.form1.elements[opDay  ];
		var objHour  	= opener.document.form1.elements[opHour ];
		var opjStartDay = opener.document.form1.elements[opStartDay ];
		
	
		var ddd = year+Mon1+day1;
	
		var opFlag 		= "";
		
		
	
	
		/////////////////////////////////////////////////////////////////////////////////////
		yy = parseInt(year, 10);
		mm = parseInt(month, 10);
	
		if(mm == 1)
			max_days = 31;
		else if(mm == 2) {
			if(((yy % 4 == 0) && (yy % 100 != 0)) || (yy % 400 == 0))
				max_days = 29;
			else
				max_days = 28;
		}
		else if (mm == 3)   max_days = 31;
		else if (mm == 4)   max_days = 30;
		else if (mm == 5)   max_days = 31;
		else if (mm == 6)   max_days = 30;
		else if (mm == 7)   max_days = 31;
		else if (mm == 8)   max_days = 31;
		else if (mm == 9)   max_days = 30;
		else if (mm == 10)  max_days = 31;
		else if (mm == 11)  max_days = 30;
		else if (mm == 12)  max_days = 31;
	
	
		//for(i = 0; i < objDay.length; i++) { // 초기화
		//     objDay.options[i].value = "";
		//     objDay.options[i].text  = "";
		//}
		
		
		//메인이 아닌경우만..
		if(opFlag != "main"){
			
			objDay.length = max_days;
		
			for (i = 28; i < objDay.length; i++){ // 자료 Setting
				if (i < 9){
					objDay.options[i].value = '0'+(i+1);
					objDay.options[i].text  = i+1;
				}else{
					objDay.options[i].value = i+1;
					objDay.options[i].text  = i+1;
				}
			}
			/////////////////////////////////////////////////////////////////////////////////////
			
			for(i=0; i<objYear.length; i++)
			{
				if(objYear.options[i].text==year) objYear.options[i].selected = true;
			}
		
			for(i=0; i<objMonth.length; i++)
			{
				if(objMonth.options[i].text==month) objMonth.options[i].selected = true;
			}
		
			for(i=0; i<objDay.length; i++)
			{
				if(objDay.options[i].text==day) objDay.options[i].selected = true;
			}
		
		}
			// set Hour
			if('20181016' == ddd)
			{
				if (objHour.length > 2)
				{
					for(i=0; i<objHour.length; i++)
					{
						if(objHour.options[i].text==16) objHour.options[i].selected = true;
					}
				}
			}
			else
			{
				if (objHour.length > 2)
				{
					objHour.options[0].selected = true;
				}
			}
	
		// nkh 예매할인 공지
		//opener.isValidDateSetting(objYear,objMonth,objDay,objHour);
		if(opFlag == "main"){
		
			objYear.value 		= year;
			objMonth.value 		= Mon1;
			objDay.value 		= day1;
			opjStartDay.value 	= year+'.'+Mon+'.'+day;

			opener.document.form1.elements[opYoil].value = yoil;
			
			opener.fn_chgDateMain(ddd, 'Go');
		
		}else{
			
			opener.document.form1.elements[opYoil].value = yoil;
			
			if('form1' == 'form1'){
				opener.fn_chgDate(ddd, 'Go');

			}else if('form1' == 'searchfrm'){
				opener.fn_chgDate3(ddd, 'Go');
			}
			
			try{
				opener.hideResult();
			}catch(e){}
			
		}
		
		

	
		self.close();
		/////////////////////////////////////////////////////////////////////////////////////
	}
	
	function setHoliday(){
		//양력 - 매년동일
		// 1월  1일 신정
		// 3월  1일 삼일절
		// 5월  5일 어린이날
		// 6월  6일 현충일
		// 8월 15일 광복절
		//10월  3일 개천절
		//10월  9일 한글날
		//12월 25일 크리스마스
	
		//음력
		// 2월  6일 ~ 2월 10일 설날 (연휴)
		// 5월 14일 석가탄신일
		// 9월 14일 ~ 18일 추석 (연휴)
		
		//임시
		// 4월 13일 국회의원 선거
	
		var year = '2016';
		var aHolyday1 = Array('0101','0301','0505','0606','0815','1003','1009','1225');
		var aHolyday2 = Array('0206','0207','0208','0209','0210','0514','0914','0915','0916','0917','0918','0413');
		var aHolyday = aHolyday1.concat(aHolyday2);
		for (var i=0,oDate;i<aHolyday.length;i++)
			(oDate = document.getElementById('d'+year+aHolyday[i])) && (oDate.className = 'cal_red');
		(oDate = document.getElementById('d20151225')) && (oDate.className = 'cal_red');
	}
	
	function setData(){
		//aUnBookableDate = ['20140303','20140311','20140318'];
	
		
	
		for (var i=0;i<aBookableDate.length;i++){
			setBookableDate(aBookableDate[i], true);
		}
	
		for (var i=0;i<aUnBookableDate.length;i++){
			setBookableDate(aUnBookableDate[i], false);
		}
	}
	
	function setBookableDate(date, flag){
		if (flag){
			$('#d'+date).parent().parent().css('background','#85c135');
			$('#d'+date).attr('class','bookable');
		}else{
			$('#d'+date).parent().parent().css('background','#ff7800');
			$('#d'+date).parent().attr('class','unbookable');
		}
	}
	
	$(document).ready(function(){
			setHoliday();
		
		
		// ie
		if (document.all) {
			window.dialogWidth  = '550px';
			window.dialogHeight = '472px';
		}
		else {
			window.resizeTo(550, 472);
		}
		
	});
	</script>
	<style type="text/css">
		.tbl_h tr td{font-weight:bold;color:#017cab}
	</style>
</head>
<body class="popup">
	<div class="popup_ly">
		<div class="header">
			<h1>열차운행 달력 조회</h1>
			<a href="javascript:window.close();" class="pop_close" title="팝업 닫기">닫기</a>
		</div>
		<div class="cont">
		<!-- popup content -->
				
			<!-----------------달력테이블----------------------------------->
			<h2 class="tit_pop">승차권 예약조회는 1개월 이내 열차만 가능합니다.</h2>
			
			<table width="100%">
			<colgroup>
				<col width="*">
				<col width="3%">
				<col width="*">
			</colgroup>
			<tbody>
			<tr>
				<td colspan="3">
				
				</td>
			</tr>
			<tr>
				<td>
					<div class="calendar_wrap">
						<div class="box2"><!-- 달력시작 -->
						
							<div class="header">
								<strong class="dayRed">10</strong>월
							</div>
							<table class="tbl_calendar">
								<thead>
								<tr>
									<th class="dayRed">일</th>
									<th>월</th>
									<th>화</th>
									<th>수</th>
									<th>목</th>
									<th>금</th>
									<th class="dayBlue">토</th>
								</tr>
								</thead>
								<tbody>
								<!--------------------------------------------------------------------------------->
								<tr bgcolor="#FFFFFF">
<td></td>
<td class="">
<font color="#d3d3d3">1</font>
</td>
<td class="">
<font color="#d3d3d3">2</font>
</td>
<td class="">
<font color="#d3d3d3">3</font>
</td>
<td class="">
<font color="#d3d3d3">4</font>
</td>
<td class="">
<font color="#d3d3d3">5</font>
</td>
<td class="dayBlue">
<font color="#d3d3d3">6</font>
</td>
</tr>
<tr bgcolor="#FFFFFF">
<td class="dayRed">
<font color="#d3d3d3">7</font>
</td>
<td class="">
<font color="#d3d3d3">8</font>
</td>
<td class="">
<font color="#d3d3d3">9</font>
</td>
<td class="">
<font color="#d3d3d3">10</font>
</td>
<td class="">
<font color="#d3d3d3">11</font>
</td>
<td class="">
<font color="#d3d3d3">12</font>
</td>
<td class="dayBlue">
<font color="#d3d3d3">13</font>
</td>
</tr>
<tr bgcolor="#FFFFFF">
<td class="dayRed">
<font color="#d3d3d3">14</font>
</td>
<td class="">
<font color="#d3d3d3">15</font>
</td>
<td class="today" bgcolor="#d3d3d3">
<a href="javascript:putDate('2018','10','10','16','16','화')"><span id="d20181016">16</span></a>
</td>
<td class="">
<a href="javascript:putDate('2018','10','10','17','17','수')"><span id="d20181017">17</span></a>
</td>
<td class="">
<a href="javascript:putDate('2018','10','10','18','18','목')"><span id="d20181018">18</span></a>
</td>
<td class="">
<a href="javascript:putDate('2018','10','10','19','19','금')"><span id="d20181019">19</span></a>
</td>
<td class="dayBlue">
<a href="javascript:putDate('2018','10','10','20','20','토')"><span id="d20181020">20</span></a>
</td>
</tr>
<tr bgcolor="#FFFFFF">
<td class="dayRed">
<a href="javascript:putDate('2018','10','10','21','21','일')"><span id="d20181021">21</span></a>
</td>
<td class="">
<a href="javascript:putDate('2018','10','10','22','22','월')"><span id="d20181022">22</span></a>
</td>
<td class="">
<a href="javascript:putDate('2018','10','10','23','23','화')"><span id="d20181023">23</span></a>
</td>
<td class="">
<a href="javascript:putDate('2018','10','10','24','24','수')"><span id="d20181024">24</span></a>
</td>
<td class="">
<a href="javascript:putDate('2018','10','10','25','25','목')"><span id="d20181025">25</span></a>
</td>
<td class="">
<a href="javascript:putDate('2018','10','10','26','26','금')"><span id="d20181026">26</span></a>
</td>
<td class="dayBlue">
<a href="javascript:putDate('2018','10','10','27','27','토')"><span id="d20181027">27</span></a>
</td>
</tr>
<tr bgcolor="#FFFFFF">
<td class="dayRed">
<a href="javascript:putDate('2018','10','10','28','28','일')"><span id="d20181028">28</span></a>
</td>
<td class="">
<a href="javascript:putDate('2018','10','10','29','29','월')"><span id="d20181029">29</span></a>
</td>
<td class="">
<a href="javascript:putDate('2018','10','10','30','30','화')"><span id="d20181030">30</span></a>
</td>
<td class="">
<a href="javascript:putDate('2018','10','10','31','31','수')"><span id="d20181031">31</span></a>
</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>

								</tbody>
							</table>
						</div><!-- //달력끝 -->
					</div>							
				</td>
				<td>
					&nbsp;
				</td>
				<td>
					<div class="calendar_wrap">
						<div class="box2"><!-- 달력시작 -->
						
							<div class="header">
								<strong class="dayRed">11</strong>월
							</div>
							
							<table width="100%" class="tbl_calendar">
								<thead>
								<tr>
									<th class="dayRed">일</th>
									<th>월</th>
									<th>화</th>
									<th>수</th>
									<th>목</th>
									<th>금</th>
									<th class="dayBlue">토</th>
								</tr>
								</thead>
								<tbody>
								<tr bgcolor="#FFFFFF">
<td></td>
<td></td>
<td></td>
<td></td>
<td align="center" class="">
<a href="javascript:putDate('2018','11','11','01','1','목')"><span id="d20181101">1</span></a>
</td>
<td align="center" class="">
<a href="javascript:putDate('2018','11','11','02','2','금')"><span id="d20181102">2</span></a>
</td>
<td align="center" class="dayBlue">
<a href="javascript:putDate('2018','11','11','03','3','토')"><span id="d20181103">3</span></a>
</td>
</tr>
<tr>
<td align="center" class="dayRed">
<a href="javascript:putDate('2018','11','11','04','4','일')"><span id="d20181104">4</span></a>
</td>
<td align="center" class="">
<a href="javascript:putDate('2018','11','11','05','5','월')"><span id="d20181105">5</span></a>
</td>
<td align="center" class="">
<a href="javascript:putDate('2018','11','11','06','6','화')"><span id="d20181106">6</span></a>
</td>
<td align="center" class="">
<a href="javascript:putDate('2018','11','11','07','7','수')"><span id="d20181107">7</span></a>
</td>
<td align="center" class="">
<a href="javascript:putDate('2018','11','11','08','8','목')"><span id="d20181108">8</span></a>
</td>
<td align="center" class="">
<a href="javascript:putDate('2018','11','11','09','9','금')"><span id="d20181109">9</span></a>
</td>
<td align="center" class="dayBlue">
<a href="javascript:putDate('2018','11','11','10','10','토')"><span id="d20181110">10</span></a>
</td>
</tr>
<tr>
<td align="center" class="dayRed">
<a href="javascript:putDate('2018','11','11','11','11','일')"><span id="d20181111">11</span></a>
</td>
<td align="center" class="">
<a href="javascript:putDate('2018','11','11','12','12','월')"><span id="d20181112">12</span></a>
</td>
<td align="center" class="">
<a href="javascript:putDate('2018','11','11','13','13','화')"><span id="d20181113">13</span></a>
</td>
<td align="center" class="">
<a href="javascript:putDate('2018','11','11','14','14','수')"><span id="d20181114">14</span></a>
</td>
<td align="center" class="">
<a href="javascript:putDate('2018','11','11','15','15','목')"><span id="d20181115">15</span></a>
</td>
<td align="center" class="">
<a href="javascript:putDate('2018','11','11','16','16','금')"><span id="d20181116">16</span></a>
</td>
<td align="center" class="dayBlue">
<a href="javascript:putDate('2018','11','11','17','17','토')"><span id="d20181117">17</span></a>
</td>
</tr>
<tr>
<td class="dayRed">
<font color="#d3d3d3">18</font>
</td>
<td class="">
<font color="#d3d3d3">19</font>
</td>
<td class="">
<font color="#d3d3d3">20</font>
</td>
<td class="">
<font color="#d3d3d3">21</font>
</td>
<td class="">
<font color="#d3d3d3">22</font>
</td>
<td class="">
<font color="#d3d3d3">23</font>
</td>
<td class="dayBlue">
<font color="#d3d3d3">24</font>
</td>
</tr>
<tr>
<td class="dayRed">
<font color="#d3d3d3">25</font>
</td>
<td class="">
<font color="#d3d3d3">26</font>
</td>
<td class="">
<font color="#d3d3d3">27</font>
</td>
<td class="">
<font color="#d3d3d3">28</font>
</td>
<td class="">
<font color="#d3d3d3">29</font>
</td>
<td class="">
<font color="#d3d3d3">30</font>
</td>
<td>&nbsp;</td>
</tr>

								</tbody>
							</table>
						</div>
					</div>
				</td>
			</tr>
			
			
			</tbody></table>
			
			<p class="p_copy"><img src="/docs/2007/img/common/pop_copyright.gif" alt="KORAIL copyright"></p>
		<!-- //popup content -->
		</div>
	</div>


</body></html>