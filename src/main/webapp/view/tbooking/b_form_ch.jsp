<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../css/tbooking.css">
<style>
.panel{
margin:0%;
}
.startDateList{
margin:0%;
}
.startDateList li{
display:inline-block;
}
.panel-heading, .panel-body{
padding:0% 0% 0% 0%;
}
.main-chart{
width:80%;
margin:0% 5% 0% 10%;
}
.book_box_detail{
display:none;
}
.book_chx01{
paading:0px 0px;
}
.table{
margin:0px;
padding:0px 0px;
}
.info,  td{
border:1px solid none;
text-align:center;
}
</style>
<script>
function search(){
	if ($(".book_box_detail").is(":hidden")) { 
		$(".book_box_detail").slideDown("slow"); 
	} else { 
		$(".book_box_detail").hide(); 
	}
}
</script>
<%@ include file="/view/tbooking/sidebar.jsp" %>
		<!--main content start-->
<section id="main-content">
	<section class="wrapper">
		<div class="row">
			<div class="col-lg-9 main-chart">
				<div id="container">
<!-- 여기서부터 시작이라고 보면 됨 -->
<img class="img-rounded" width="100%" height="30%" src="img/callyPlus/trainm3.jpg" />
<div class="contTotal"><!-- book_box_total -->
	<div class="book_chx01" ><!-- 체크박스2시작 -->
		<div class="panel panel-info">
			<div class="panel-body">
				<div class="col-lg-3 "><h5>승차일별 조회</h5></div>
					<ul class="startDateList">
						<li>
							<input type="date" id="date" class="form-control" name="date">
						</li>
						<li>
							 ~ 
						</li>
						<li>
							<input type="date" id="date" class="form-control" name="date">
						</li>
					</ul>
				</div>
			<div class="panel-heading">
				<div class="col-lg-3"><h5>승차월별 조회</h5></div>
				<div>
					<ul class="startDateList">
						<li>
							<select id="s_year" class="form-control" name="selGoYear" onchange="isValidDateSetting(form1.selGoYear,form1.selGoMonth,form1.selGoDay,form1.selGoHour);" title="출발일시 : 년도">
								<option value="2018" selected="selected">2018</option>
								<option value="2019">2019</option>
								<option value="2020">2020</option>
							</select>
						</li>
						<li>
							<select id="s_month" class="form-control" name="selGoMonth" onchange="isValidDateSetting(form1.selGoYear,form1.selGoMonth,form1.selGoDay,form1.selGoHour);" title="출발일시 : 월">
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
							</select>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="search">	<!-- 조회하기버튼 -->
		<button onclick="search()" class="btn btn-info">조회하기</button>
	</div>
	<div id="book_box_detail" class="book_box_detail"><!-- 조회하기 버튼 클릭스 생성되는 곳 북 박스 디테일 시작 -->
		<table class="table" summary="여정정보 1열 승차일자,2열 열차번호,3열 열차종별,4열 출발역,5열 출발시각,6열 도착역,7열 도착시각,8열 예약매수,9열 총결제금액">
			<caption>여정정보</caption>
			<thead>
				<tr>
					<th></th>
					<th>승차일자</th>
					<th>열차번호</th>
					<th>열차종별</th>
					<th>출발역</th>
					<th>출발시간</th>
					<th>도착역</th>
					<th>도착시간</th>
					<th>예약매수</th>
					<th>총결제금액</th>
				</tr>
			</thead>
			<tbody>
				<tr class="info">
					<td><button onclick="test()">상세</button></td>
					<td>ex)10월12일</td>
					<td>ex)1223</td>
					<td>ex)서울</td>
					<td>ex)10:23</td>
					<td>ex)부산</td>
					<td>ex)00:44</td>
					<td>ex)1</td>
					<td>ex)10000</td>
					<td>ex)무궁화호</td>   
				</tr>
			</tbody>
		</table>
	</div><!-- //북 박스 디테일 끝 -->
</div><!-- //book_box_total -->
<!-- 여기까지가 끝이라고 보면 됨 -->
				</div>
			</div>
		</div>
	</section>
</section>
<%@ include file="js.jspf" %>