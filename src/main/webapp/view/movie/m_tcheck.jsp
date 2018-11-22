<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="sidemenu.jsp"%>
<section id="main-content">
	<section class="wrapper">
		<h3>
			<i class="fa fa-angle-right"></i> 예매정보
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
								<th>취소</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${seat }" var="reservList">
							<tr class="rtr">
								<td class="mr_${reservList.MR_NO }">${reservList.MR_NO }</td> <!-- 예매번호 -->
								<td>${reservList.MEM_NAME}</td>	<!-- 예매자이름 -->
								<td>${reservList.MTI_NAME }</td>	<!-- 극장명 -->
								<td>${reservList.MMI_NAME }</td>	<!-- 영화제목 -->
								<td>${reservList.M_C_NO }관</td>	<!-- 상영관 -->
								<td>${reservList.MDATE }</td>
								<td>${reservList.STIME }</td>
								<td>${reservList.SEAT }</td>
								<td>${reservList.PAY }</td>
								<td><button class="btn btn-danger btn-xs" onclick="reserv_del(${reservList.MR_NO})">
                              <i class="fa fa-trash-o "></i>
                           </button></td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
				<!-- /content-panel -->
			</div>
			<!-- /col-md-12 -->
		</div>
		<!-- /row -->
	</section>
</section>
<script>
	function reserv_del(val){
		$.ajax({
			url : "del_reserv",
			type : "post",
			data : {
				mr_no : $('.rtr').find('.mr_'+val).html()
			},
			success : function(data) {
				window.location.reload();
			}
		});  
	}
</script>
<%@ include file="js.jspf"%>
