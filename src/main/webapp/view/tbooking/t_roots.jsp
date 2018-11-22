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
.panel-body ul li{
border-right:1px solid grey;
display:inline-block;
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
.mapviewdivul li{
border-shadow:1px grey;
padding:0% 2% 0% 2%;
}
</style>
<script>
</script>
<%@ include file="/view/tbooking/sidebar.jsp" %>
		<!--main content start-->
<section id="main-content">
	<section class="wrapper">
		<div class="row">
			<div class="col-lg-9 main-chart">
				<div id="container">
<!-- 여기서부터 시작이라고 보면 됨 -->
<div class="contTotal"><!-- book_box_total -->
<h2>기차노선도</h2>
	<div class="panel panel-info">
		<div class="panel-body">
			<ul class="mapviewdivul">
				<li><c:url value="/t_station" var="t_station"/><a class="callymenu c_tbooking" href="${t_roots}">기차노선도</li>
				<li><c:url value="/t_roots" var="t_roots"/><a class="callymenu c_tbooking" href="${t_station}">기차역검색</li>
				<li>
					<a title="새창열림" href="img/callyPlus/allrootmap.jpg" >
					<img style="VERTICAL-ALIGN: middle" alt="한국철도노선도 이미지 파일열기" src="img/callyPlus/imgmap_button.gif"></a>
				</li>
			</ul>
		</div>
	</div>
	<div>
		<img class="img-rounded" width="100%" height="auto%" src="img/callyPlus/allrootmap.jpg" />
	</div>
</div><!-- //북 박스 디테일 끝 -->
</div><!-- //book_box_total -->
<!-- 여기까지가 끝이라고 보면 됨 -->
				</div>
			</div>
		</div>
	</section>
</section>
<%@ include file="js.jspf" %>