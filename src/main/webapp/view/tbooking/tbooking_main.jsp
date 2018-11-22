<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="../css/tbooking.css">



<style>
*{
padding:0 0 0 0;
margin:0%;
}
.stationsF{
width:10rem;
display:inline-block;
}
.searBB{
height:20px;
font-size:10px;
vertical-align:middle;
}
.main-chart{
width:80%;
margin:0% 5% 0% 10%;
}
.startDateList li{
display:inline-block;
}
.info,  td{
border:1px solid none;
text-align:center;
}
.h4title{
font-size:1em;
}
.calPopPage{
display:none;
width:300px;
height:200px;
}
/* .book_box_detail{
display:none;
} */
table div div{
text-align:left;
}
.tab ul li , .step_tick ul li, .listdiv ul li{
display:inline-block;
}
.smallcon{
vertical-align:middle;
width:30px;
height:30px;
}
.col-md-2{
width:100%;
}
</style>
<script>
function search(){
	$("#boxdetail").empty();
	$("#boxdetail").append("<thead><tr><th>열차이름</th><th>열차번호</th><th>출발/시간</th><th>도착/시간</th><th>좌석</th><th>소요시간</th></tr></thead>")
	$("#boxdetail").append("<tbody><tr class='danger'><td>ex)KTX</td><td>ex)101</td><td>ex)1223/07:30</td><td>ex)1223/09:30</td><td><input type='button' onclick='seatPop()' value='좌석선택' alt='좌석선택'/></td><td>ex)00:44</td></tr></tbody>")

}
function seatPop() {
	window.open("b_t_form.jsp", "좌석선택팝업창", "width=900, height=320, resizable=no");
}
</script>
<%@ include file="/view/tbooking/sidebar.jsp" %>
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
휴
<!-- 여기까지가 끝이라고 보면 됨 -->
				</div>
			</div>
		</div>
	</section>
</section>
<%@ include file="js.jspf" %>