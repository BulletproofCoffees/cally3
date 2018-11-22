<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="../css/tbooking.css">
<style>
.table{
border-top:1px solid grey;
margin-bottom: 0;
}
.main-chart{
width:80%;
margin:0% 5% 0% 10%;
}
.gridAll{
padding:0% 0% 0% 0%;
}
.gridFirst{
height:100%;
padding:0% 1% 1% 1%;
margin:0px;
}
*{
margin:0%;
padding:0% 0% 0% 0%;
}
.book_chx01{
height:auto;
}
.book_chx02{
display: none;
font-size:8px;
}
</style>
<script>
function scheCh(){
	if ($(".book_chx02").is(":hidden")) { 
		$(".book_chx02").slideDown("slow"); 
	} else { 
		$(".book_chx02").hide(); 
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
<img class="img-rounded" width="100%" height="30%" src="img/callyPlus/trainm1.jpg" />
<div class="contTotal content-panel"><!-- book_box_total -->
	<div class="book_chx01"><!-- 체크박스2시작 -->
		<table class="table" summary="여정정보 1열 승차일자,2열 열차번호,3열 열차종별,4열 출발역,5열 출발시각,6열 도착역,7열 도착시각,8열 예약매수,9열 총결제금액">
			<caption>예매변경 및 취소</caption>
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
					<td><button onclick="scheCh()">상세</button></td>
					<c:forEach var="cTModList" items="cTMod">
						<td>${bk_bding_time}</td>
						<td>${tn_num}</td>
						<td>${tn_kind_name}</td>
						<td>${dep_station}</td>
						<td>${dep_time}</td>
						<td>${desti_station}</td>
						<td>${desti_time}</td>
						<td>${bk_ticekt_count}</td>
						<td>${bk_total_fare}</td>   						
					</c:forEach>
				</tr>
			</tbody>
		</table>
	</div>
	<div id="book_chx02" class="book_chx02"><!-- 체크박스2시작 -->
		<div class="gridAll gridFirst">
			<table class="table detailInfo" summary="좌석정보 1열 객실등급,2열 좌석정보,3열 승객유형,4열 운임요금,5열 할인금액,6열 영수금액,7열 승차자명">
				<thead>
					<tr>
						<th></th>
						<th>객실등급</th>
						<th>좌석정보</th>
						<th>승객유형</th>
						<th>운임요금</th>
						<th>할인금액</th>
						<th>영수금액</th>
					</tr>
				</thead>
				<tbody>
					<tr class="danger">
						<td><button class="modButton" onclick="scheCh()">취소/변경</button></td>
						<td>ex)10월12일</td>
						<td>ex)1223</td>
						<td>ex)서울</td>
						<td>ex)10:23</td>
						<td>ex)부산</td>
						<td>ex)00:44</td>   
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div><!-- //book_box_total -->
<!-- 여기까지가 끝이라고 보면 됨 -->
				</div>
			</div>
		</div>
	</section>
</section>
    <%@ include file="js.jspf" %>