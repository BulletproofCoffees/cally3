<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="Asidemenu.jsp"%>
<section id="main-content">
	<section class="wrapper">
		<h3>
			<i class="fa fa-angle-right"></i> 예매관리 페이지
		</h3>
		<hr>
		<div class="row mt">
			<div class="col-md-12">
				<div class="content-panel">
					<table class="table table-striped table-advance">
						<thead>
							<tr>
								<th>예매번호</th>
								<th>예매자이름</th>
								<th>극장장소</th>
								<th>영화제목</th>
								<th>상영관</th>
								<th>상영일</th>
								<th>상영시작시간</th>
								<th>좌석</th>
								<th>금액</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${admin_reserv }" var="are">
							<tr>
								<td>${are.MR_NO }</td>
								<td>${are.MEM_NAME }</td>
								<td>${are.MTI_NAME }</td>
								<td>${are.MMI_NAME }</td>
								<td>${are.M_C_NO }</td>
								<td>${are.MDATE }</td>
								<td>${are.STIME }</td>
								<td>${are.SEAT }</td>
								<td>${are.PAY }원</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</section>
</section>
<%@include file="js.jspf" %>