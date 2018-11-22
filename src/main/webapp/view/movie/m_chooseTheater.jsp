<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="sidemenu.jsp"%>
<section id="main-content">
	<section class="wrapper">
		<h3>
		<!-- onsubmit="do_ajax()" -->
			<i class="fa fa-angle-right"></i>극장/상영관 선택
		</h3>
		<hr>
		<form action="m_nextstep1" method="post" class="form-horizontal style-form col-sm-5" >
			<div class="form-group">
				<label class="col-sm-2 col-sm-2 control-label">극장</label>
				<div class="col-sm-10">
					<select class="form-control" name="tinfo">
					<option selected="selected">선택</option>
					<c:forEach items="${theater_info }" var="tinfo">
					<option value="${tinfo.MTI_CODE }">${tinfo.MTI_NAME }</option>
					</c:forEach>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 col-sm-2 control-label">관</label>
				<div class="col-sm-10">
					<select class="form-control" name="cno">
					<option selected="selected">선택</option>
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
                      <input type="text" class="form-control dpd2" name="c_date">
                    </div>
				</div>
			</div>
			<%-- <input type="hidden" value="${tinfo_t.MTI_CODE }" name="t_test"> --%>
			<button type="submit" class="btn btn-primary btn-lg">다음으로</button>
		</form>
	</section>
</section>

<%@include file="js.jspf"%>