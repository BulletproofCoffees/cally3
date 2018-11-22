<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../css/tbooking.css">
<style>
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
<ul>
	<li>추가</li>
	<li>삭제</li>
	<li>변경</li>
	
	
	<li>종류</li> KTX 새마을호 무궁화호 등등
	<li>시간</li>
	<li>요금</li> 1인석 어린이 어른 일반석 어린이 어른/
	<li>좌석</li> 좌석행 열
	<li>기종점여부</li>
	<li>노선</li>

    ㄴ.개/폐역사 등록관리
	
</ul>
</div><!-- //book_box_total -->
<!-- 여기까지가 끝이라고 보면 됨 -->
				</div>
			</div>
		</div>
	</section>
</section>
<%@ include file="js.jspf" %>