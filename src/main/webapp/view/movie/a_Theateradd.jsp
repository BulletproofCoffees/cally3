<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="Asidemenu.jsp"%>
<section id="main-content">
	<section class="wrapper">
		<h3>
			<i class="fa fa-angle-right"></i>극장등록
		</h3>
		<hr>
		<form class="form-horizontal style-form col-sm-5" method="post" action="theaterAdd_b">
		<div class="form-group">
				<label class="col-sm-2 col-sm-2 control-label">지역선택</label>
				<div class="col-sm-10">
					<select class="form-control" name="local_no">
					<option>선택</option>
					<c:forEach items="${ local}" var="loc" varStatus="status">
					<option value="${status.count }">${loc.MTIL_NAME }</option>
					</c:forEach>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 col-sm-2 control-label">지점명</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="local_name">
					<span class="help-block">예시 > 영등포지점 / 구월로데오지점 /</span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 col-sm-2 control-label">상세위치</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="local_detail">
				</div>
			</div>
			<button type="submit" class="btn btn-primary btn-lg">등록하기</button>
		</form>
		</section>
		</section>
		<%@include file="js.jspf"%>