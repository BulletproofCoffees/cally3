<link href="${pageContext.request.contextPath}/sj/accordion.css" rel="stylesheet">  
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="https://unpkg.com/metismenu/dist/metisMenu.min.css" />



		<div class="col-md-6 ">
			<!-- 아침 ---------------------------------------------------------------------------------------------------------------------------------------- -->
	<div class="col-md-12 showback">
		<!-- 리스트 -->
		<div class="col-md-12">
			<div class="white-panel">
				<div class="custom-check goleft mt" style="margin-left: 25px; margin-right: 25px;">

					<div>
						<h4>아침</h4>
					</div>
					<table class="table  table-striped custom-check col-md-12 Line" > 
						<thead>
							<tr>
								<th class="col-md-4">식품명</th>
								<th>탄수화물</th>
								<th>단백질</th>
								<th>지방</th>
								<th>Cal</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${day_list_1}" var="day_list_1">
							<tr class="re_list">
								<td><div >
										<a href="${pageContext.request.contextPath}/sj/Ingredient/${day_list_1.DESC_KOR}">${day_list_1.DESC_KOR}</a><b>(${day_list_1.AMOUNT}개)</b>  
									</div></td>
								<td><p>${day_list_1.NUTR_CONT2*day_list_1.AMOUNT}</p></td>
								<td><p>${day_list_1.NUTR_CONT3*day_list_1.AMOUNT}</p></td>
								<td><p>${day_list_1.NUTR_CONT4*day_list_1.AMOUNT}</p></td>
								<td><p>${day_list_1.NUTR_CONT1}</p></td>
								<td><button class="close" aria-hidden="true" data-dismiss="alert" name="button" type="${day_list_1.RE_NO}">×</button></td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<!-- /리스트 -->
		<div class="col-md-12">
			<div class="metismenu faq-menu">
				<div class="faq-item mb-2">
					<h4 class="faq-link has-arrow">아침칼로리추가</h4>
					<div class="faq-answer text-muted ">					
						<%@ include file="accordion_piece/search1.jsp"%>
					</div>
				</div>
			</div>
		</div>
	</div>
	  <!--/아침 ---------------------------------------------------------------------------------------------------------------------------------------- -->
	<!-- 점심 ---------------------------------------------------------------------------------------------------------------------------------------- -->
			<div class="col-md-12 showback">
			<div class="col-md-12">
			<div class="white-panel">
				<div class="custom-check goleft mt"
					style="margin-left: 25px; margin-right: 25px;">

					<div>
						<h4>점심</h4>
					</div>
					<table class="table  table-striped custom-check col-md-12 Line" > 
						<thead>
							<tr>
								<th class="col-md-4">식품명</th>
								<th>탄수화물</th>
								<th>단백질</th>
								<th>지방</th>
								<th>Cal</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${day_list_2}" var="day_list_2">
							<tr class="re_list">
								<td><div >
									<a href="${pageContext.request.contextPath}/sj/Ingredient/${day_list_2.DESC_KOR}">${day_list_2.DESC_KOR}</a><b>(${day_list_2.AMOUNT}개)</b>
									</div></td>
								<td><p>${day_list_2.NUTR_CONT2*day_list_2.AMOUNT}</p></td>
								<td><p>${day_list_2.NUTR_CONT3*day_list_2.AMOUNT}</p></td>
								<td><p>${day_list_2.NUTR_CONT4*day_list_2.AMOUNT}</p></td>
								<td><p>${day_list_2.NUTR_CONT1*day_list_2.AMOUNT}</p></td>
								<td><button class="close" aria-hidden="true" data-dismiss="alert" name="button" type="${day_list_2.RE_NO}">×</button></td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		
		<div class="col-md-12">
			<div class="metismenu faq-menu">
				<div class="faq-item mb-2">
					<h4 class="faq-link has-arrow">점심칼로리추가</h4>
					<div class="faq-answer text-muted ">					
						<%@ include file="accordion_piece/search2.jsp"%>
				</div>
			</div>
		</div>
		</div>
			</div>
			
			<!--/점심 ---------------------------------------------------------------------------------------------------------------------------------------- -->
	
	</div>

			
			<div class="col-md-6 ">
			<!-- 저녁 ---------------------------------------------------------------------------------------------------------------------------------------- -->
	<div class="col-md-12 showback">
		<!-- 리스트 -->
		<div class="col-md-12">
			<div class="white-panel">
				<div class="custom-check goleft mt"
					style="margin-left: 25px; margin-right: 25px;">

					<div>
						<h4>저녁</h4>
					</div>
					<table class="table  table-striped custom-check col-md-12 Line" > 
						<thead>
							<tr>
								<th class="col-md-4">식품명</th>
								<th>탄수화물</th>
								<th>단백질</th>
								<th>지방</th>
								<th>Cal</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${day_list_3}" var="day_list_3">
							<tr class="re_list">
								<td><div >
									<a href="${pageContext.request.contextPath}/sj/Ingredient/${day_list_3.DESC_KOR}">${day_list_3.DESC_KOR}</a><b>(${day_list_3.AMOUNT}개)</b>
									</div></td>
								<td><p>${day_list_3.NUTR_CONT2*day_list_3.AMOUNT}</p></td>
								<td><p>${day_list_3.NUTR_CONT3*day_list_3.AMOUNT}</p></td>
								<td><p>${day_list_3.NUTR_CONT4*day_list_3.AMOUNT}</p></td>
								<td><p>${day_list_3.NUTR_CONT1*day_list_3.AMOUNT}</p></td>
								<td><button class="close" aria-hidden="true" data-dismiss="alert" name="button" type="${day_list_3.RE_NO}">×</button></td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="col-md-12">
			<div class="metismenu faq-menu">
				<div class="faq-item mb-2">
					<h4 class="faq-link has-arrow">저녁칼로리추가</h4>
					<div class="faq-answer text-muted ">					
						<%@ include file="accordion_piece/search3.jsp"%>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--/저녁 ---------------------------------------------------------------------------------------------------------------------------------------- -->
			
			
			<!-- 간식 ---------------------------------------------------------------------------------------------------------------------------------------- -->
	<div class="col-md-12 showback">
			<div class="col-md-12">
			<div class="white-panel">
				<div class="custom-check goleft mt"
					style="margin-left: 25px; margin-right: 25px;">

					<div>
						<h4>간식</h4>
					</div>
					<table class="table  table-striped custom-check col-md-12 Line" > 
						<thead>
							<tr>
								<th class="col-md-4">식품명</th>
								<th>탄수화물</th>
								<th>단백질</th>
								<th>지방</th>
								<th>Cal</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${day_list_4}" var="day_list_4">
							<tr class="re_list">
							
								<td><div>
									<a href="${pageContext.request.contextPath}/sj/Ingredient/${day_list_4.DESC_KOR}">${day_list_4.DESC_KOR}</a><b>(${day_list_4.AMOUNT}개)</b>
									</div></td>
								<td><p>${day_list_4.NUTR_CONT2*day_list_4.AMOUNT}</p></td>
								<td><p>${day_list_4.NUTR_CONT3*day_list_4.AMOUNT}</p></td>
								<td><p>${day_list_4.NUTR_CONT4*day_list_4.AMOUNT}</p></td>
								<td><p>${day_list_4.NUTR_CONT1*day_list_4.AMOUNT}</p></td>
								<td><button class="close" aria-hidden="true" data-dismiss="alert" name="button" type="${day_list_4.RE_NO}">×</button></td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="col-md-12">
			<div class="metismenu faq-menu">
				<div class="faq-item mb-2">
					<h4 class="faq-link has-arrow">간식칼로리추가</h4>
					<div class="faq-answer text-muted ">					
						<%@ include file="accordion_piece/search4.jsp"%>
				</div>
			</div>
		</div>
		</div>
			</div>
			<!--/간식 ---------------------------------------------------------------------------------------------------------------------------------------- -->
			
			</div>
	
	
			

		


<%-- <script src="${pageContext.request.contextPath}/sj/accordion.js"></script> --%>

<script src="https://unpkg.com/metismenu"></script>
<script>
        $(function() {
        	  $('.metismenu').metisMenu({
        	    toggle: false,
        	    triggerElement: '.faq-link',
        	    parentTrigger: '.faq-item',
        	    subMenu: '.faq-answer'
        	  });

        	});
	$('tr.re_list button.close').on("click", function() {
		var re_list = $(this).parents("tr.re_list");
		var click = $(this).attr('type');

		$.ajax({
			url : "${pageContext.request.contextPath}/sj/counter_ajax",
			data : {
				button : click
			},
			type : 'POST',
			dataType : 'text',
			success : function(response) {
				re_list.empty();
			},
			error : function(response) {
				 alert('error');
			}
		});
	});
</script>
      
    
      