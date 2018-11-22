<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="submenu.jspf" %>

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

.Line>tbody>tr>td:nth-child(1) { 
    width: 70%;
}
</style>

<section id="main-content">
	<section class="wrapper">
		<div class="col-lg-12 main-chart js_hame ">
		
		
		
			<div class="col-md-12 ds">
			
			<div class="col-md-12 ">
	<form action="${pageContext.request.contextPath}/sj/Ingredient_up" method="post">

				<div class="col-md-12 showback" style="padding: 15px;">				
			<div class="col-md-4">
			<input type="text" class="form-control" placeholder="식품명" name="desc_kor">
			</div>
			<div class="col-md-2">
			<input type="text" class="form-control" placeholder="제조사" name="mn" >
			</div>
			<div class="col-md-6">
			<button  class="btn btn-primary col-md-offset-10" >업데이트</button>
			</div>
			</div>
			
<!-------------------------------------------------------------------------------------------  -->
					
						<div class="col-md-12 showback_b" style="background: #f5f5f5;">
							<div class="col-md-12 showback_a showback">

								<table class="col-md-12 Line">
									<thead>
										<tr>
											<th>영양정보</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>1회제공량 (g)</td>
											<td><input type="text" class="form-control"
												placeholder="1회제공량" name="serving_wt" required></td>
										</tr>
										<tr>
											<td>열량 (kcal)</td>
											<td><input type="text" class="form-control"
												placeholder="칼로리" name="nutr_cont1" required></td>
										</tr>
										<tr>
											<td>탄수화물 (g)</td>
											<td><input type="text" class="form-control"
												placeholder="탄수화물" name="nutr_cont2" required></td>
										</tr>
										<tr>
											<td>단백질 (g)</td>
											<td><input type="text" class="form-control"
												placeholder="단백질" name="nutr_cont3" required></td>
										</tr>
										<tr>
											<td>지방 (g)</td>
											<td><input type="text" class="form-control"
												placeholder="지방" name="nutr_cont4" required></td>
										</tr>
										<tr>
											<td>당류 (g)</td>
											<td><input type="text" class="form-control"
												placeholder="당류" name="nutr_cont5" required></td>
										</tr>
										<tr>
											<td>나트륨 (mg)</td>
											<td><input type="text" class="form-control"
												placeholder="나트륨" name="nutr_cont6" required></td>
										</tr>
										<tr>
											<td>콜레스테롤 (mg)</td>
											<td><input type="text" class="form-control"
												placeholder="콜레스테롤" name="nutr_cont7" required></td>
										</tr>
										<tr>
											<td>포화지방산 (g)</td>
											<td><input type="text" class="form-control"
												placeholder="포화지방산" name="nutr_cont8" required></td>
										</tr>

									</tbody>
									<tfoot>
										<tr>
											<td>트랜스지방산 (g)</td>
											<td><input type="text" class="form-control"
												placeholder="트랜스지방산" name="nutr_cont9" required></td>
										</tr>
									</tfoot>
								</table>
							</div>
						</div>
					
					<!-------------------------------------------------------------------------------------------  -->			
</form>					
		</div>

			</div>
			
			
			
		</div>
	</section>
</section>
          <%@ include file="js/js.jspf" %>
          
      <script>
      function check_onclick(){
    	    theForm=document.frm1;  
    	  if(theForm.input1.value=="" || theForm.input2.value=="" || theForm.input3.value=="" ){
    	        alert("필수 입력란이 비었습니다. 확인해 주세요.");
    	    }else{
    	       alert("필수 입력란을 모두 입력하셨습니다.");
    	    }
    	 }

      </script>    
          
 