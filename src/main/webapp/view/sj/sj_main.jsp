<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

 <style>
  #calendar {
    color: white;
}
 

 
    .fc-button-month, .fc-button-basicWeek, .fc-button-basicDay, .fc-button-today {
    display: none;
    }
    .js_text{font-size: 15px} /*텍스트 사이즈  */
    
    </style>
 
<style type="text/css">
.showback_a {
	border: 3px solid #ccc;
}

.showback_b {
	background: #ffffff;
	padding: 15px;
	margin-bottom: 15px;
	/* box-shadow: 0px 3px 2px #aab2bd; */	
}

td{	padding: 10px;
}

.Line>thead>tr>th {
	border-bottom: 3px solid;
	font-size: 25px;
}

.Line>tbody>tr>td {
	border-bottom: 1px solid;
	
}

.Line2>tbody>tr>th {
	border-bottom: 1px solid;
	
}

.Line>tbody>tr>td{ 
    width: 20%;
}



</style>
    
    
    
 
<!-- 작성 -->
    
<c:choose>
		<c:when test="${id == '[]'}">
		  
 <section class="wrapper site-min-height" >
 <div class=" js_hame">
		
		
 <div class="content">
 <form action="${pageContext.request.contextPath}/sj" method="post">
      <nav class="form-login" style="max-width: 50%; box-shadow: 5px 5px 3px #aaaaaa;">
        <h2 class="form-login-heading">Calorie counter join</h2>
        <div class="login-wrap">
        <input type="hidden" class="form-control"  value="${sessionScope.loginUser.mem_num}" name="mem_num" readonly>
         <input type="text" class="form-control"  value="${sessionScope.loginUser.mem_name}" disabled>
          <br>
           <div style="text-align: center;">           
           <input type="radio" name="sex" value="m" required>남자
           <input type="radio" name="sex" value="w" required>여자 
         </div>
          <br>
          
          <button class="btn btn-theme btn-block"><i class="fa fa-check-square-o"></i> Consent</button>
          <hr>
          <div class="login-social-link centered">
            <p>Calorie counter를 이용하기 위해서 동의 해주세요</p>        
          </div>
        </div>      
      </nav>
        </form>
      </div>
    
            </div> 
</section>
   
      				
		</c:when>
		<c:otherwise>
		<%@ include file="submenu.jspf" %>		
			  <section id="main-content">
 <section class="wrapper site-min-height" >
 <div class=" js_hame">
 
 
 <!-- 최근활동 -->
					<div class="col-lg-7 main-chart js_hame" style="padding-top: 0px;">
						<div class="col-md-12 ds">
							<c:choose>
								<c:when test="${re_list == '[]'}">
								<div class="col-md-12 showback" style=" height: 800px;">
									<p>등록된 칼로리카운터가 없습니다!</p>
									</div>
								</c:when>
								
								<c:otherwise>
									<p>최근활동</p>
									<c:forEach items="${re_list}" var="list">
										<div class="col-md-12 showback">
											<div class="col-md-12" style="padding: 15px;">
												<a href="${counter}/=${list.TDAY}">${list.TDAY}</a>
												<table class="col-md-12 Line">
													<tbody>
														<tr>

															<td>총칼로리</td>
															<td>지방</td>
															<td>탄수화물</td>
															<td>단백질</td>
														</tr>
														<tr>

															<td>${list.CAL}Cal</td>
															<td>${list.CAL}g</td>
															<td>${list.CARBOHYDRATEEKS}g</td>
															<td>${list.PROTEIN}g</td>
														</tr>
													</tbody>
												</table>
											</div>
											<div class="col-md-12" style="background: #f5f5f5;">
											<c:if test="${list.IMG != null}">
												<div class=" showback" style="margin-top: 15px;">												
													<img style="max-width: 100%; height: auto" src="${pageContext.request.contextPath}/sj/img/${list.IMG}">													
												</div>
												</c:if>
											</div>
										</div>
									</c:forEach>

								</c:otherwise>
							</c:choose>

						</div>
					</div>
					<!-- /최근활동  -->


<div class="col-lg-5" >
					<div class="col-lg-12" >
				<!-- 달력-->
				      	<%@ include file="piece/my_calendar.jsp"%>				
				<!-- /달력-->
				</div>
 <div class=" col-lg-12" >
				<div >
				<div class="col-lg-12 showback">
				  <h4><i class="fa fa-angle-right"></i> 오늘의 추천 음식 </h4>
				<c:forEach items="${admin_food}" var="admin_food">            
              <div class="alert alert-success">
              <a href="${pageContext.request.contextPath}/sj/Ingredient/${admin_food.DESC_KOR}">${admin_food.DESC_KOR}</a>
              <p>${admin_food.EXP}</p>
              </div>              
            </c:forEach>
            </div>
            
			<div>
				<a class="col-md-6" style="
    padding-left: 0px;
"><c:url value="/sj/counter" var="counter"/><button type="button" class="btn btn-theme02 col-sm-12 js_hame_button today_b" onclick="location='${counter}/#'" id='day'></button></a> 
				<a class="col-md-6 " style="
    padding-right: 0px;
"><c:url value="/sj/analysis" var="analysis"/><button type="button"class="btn btn-theme02 col-sm-12 js_hame_button" onclick="location='${analysis}/#'">칼로리 분석</button></a>
			</div>

		
			</div>
		
   </div>       
   </div>
          
          </div> 
</section>
</section>	
		</c:otherwise>
	</c:choose>

          
<!-- /작성 -->



   <%@ include file="js/js.jspf" %>
   
   
<!-- 날짜 스크립트 -->
<script type="text/javascript">
$(function() {
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1; //January is 0!	
	today = mm+'월'+dd+'일 식단작성';	
	 $("#day").append(today);
    }); 
    
$(function() {
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1; //January is 0!	
	var yyyy = today.getFullYear();

	today = yyyy+'-'+mm+'-'+dd;	
	 $("#day").attr("onclick", "location='${counter}/="+today+"'");
    });    
</script>
<!-- /날짜 스크립트 -->


<script type="text/javascript">
$(function() {
	a = "${ok}";
	if(a == ''){		
	}else {
		alert(a);	
	}	
});
</script>













































