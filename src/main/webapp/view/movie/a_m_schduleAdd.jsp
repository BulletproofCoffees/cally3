<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="Asidemenu.jsp"%>
<section id="main-content">
	<section class="wrapper">
		<h3>
			<i class="fa fa-angle-right"></i>상영 스케쥴 등록
		</h3>
		<hr>
		<form class="form-horizontal style-form col-sm-5" method="post"
		action = "scheduleAdd_b">
		<div class="form-group">
				<label class="col-sm-2 col-sm-2 control-label">영화선택</label>
				<div class="col-sm-10">
					<select class="form-control" name="sel_mname" id="sel_mname">
					<option>선택</option>
					<c:forEach items="${mname }" var="mn">
					<option value="${mn.MMI_NO }">${mn.MMI_NAME }</option>
					</c:forEach>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 col-sm-2 control-label">극장</label>
				<div class="col-sm-10">
					<select class="form-control" name="sel_theater" id="sel_theater">
					<option value="0" selected>선택</option>
					<c:forEach items="${theater_info }" var="tinfo">
					<option value="${tinfo.MTI_CODE }">${tinfo.MTI_NAME }</option>
					</c:forEach>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 col-sm-2 control-label">관</label>
				<div class="col-sm-10">
					<select class="form-control" name="sel_cno">
					<option>선택</option>
					<c:forEach items="${c_no }" var="cno">
					<option value="${cno.M_C_NO }">${cno.M_C_NO }관</option>
					</c:forEach>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 col-sm-2 control-label">상영날짜</label>
				<div class="col-sm-10">
			 <div class="input-group input-large" data-date="sysdate" data-date-format="yyyy/mm/dd">
                      <input type="text" class="form-control dpd2" name="ms_date">
                    </div>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-2 col-sm-2 control-label">상영시간</label>
				<div class="col-sm-10">
					<select class="form-control" name="stime">
					<option>선택</option>
					<c:forEach items="${stime}" var="mt">
					<option value="${mt.MST_CODE}">${mt.DT}</option>
					</c:forEach>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 col-sm-2 control-label">금액</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="moviePay">
					<span class="help-block">> 표 하나에 대한 가격</span>
				</div>
			</div>
			<button type="submit" class="btn btn-primary btn-lg">등록하기</button>
		</form>
		</section>
		</section>
		<%@include file="js.jspf"%>