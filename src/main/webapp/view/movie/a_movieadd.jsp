<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="Asidemenu.jsp"%>
<section id="main-content">
	<section class="wrapper">
		<h3>
			<i class="fa fa-angle-right"></i>상영 스케쥴 등록
		</h3>
		<hr>
		<form class="form-horizontal style-form col-sm-5" method="post"
		action = "movieAdd" enctype= multipart/form-data>
			<div class="form-group">
				<label class="col-sm-2 col-sm-2 control-label">영화제목</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="movieName">
				</div>
			</div>
			 <div class="form-group last">
                  <label class="control-label col-md-3">영화 이미지</label>
                  <div class="col-md-9">
                    <div class="fileupload fileupload-new" data-provides="fileupload">
                      <div class="fileupload-new thumbnail" style="width: 200px; height: 150px;">
                        <img src="http://www.placehold.it/200x150/EFEFEF/AAAAAA&text=no+image" alt="" />
                      </div>
                      <div class="fileupload-preview fileupload-exists thumbnail" style="max-width: 200px; max-height: 150px; line-height: 20px;"></div>
                      <div>
                        <span class="btn btn-theme02 btn-file">
                          <span class="fileupload-new"><i class="fa fa-paperclip"></i>이미지 선택</span>
                        <span class="fileupload-exists"><i class="fa fa-undo"></i> 변경하기</span>
                        <input type="file" class="default" name="movieImg"/>
                        </span>
                        <a href="advanced_form_components.html#" class="btn btn-theme04 fileupload-exists" data-dismiss="fileupload"><i class="fa fa-trash-o"></i> Remove</a>
                      </div>
                    </div>
                  </div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 col-sm-2 control-label">장르</label>
				<div class="col-sm-10">
					<select class="form-control" name="movieType">
						<option>선택</option>
						<c:forEach items="${movieType }" var="type">
						<option value="${type.MMT_CODE }">${type.MMT_NAME }</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 col-sm-2 control-label">상영등급</label>
				<div class="col-sm-10">
					<select class="form-control" name="movieGrade">
						<option>선택</option>
						<c:forEach items="${movieGrade }" var="grade">
						<option value="${grade.MMG_CODE }">${grade.MMG_NAME }</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 col-sm-2 control-label">줄거리</label>
				<div class="col-sm-10">
					<textarea class="form-control" name="moviePlot" id="contact-message"rows="5" data-rule="required" style="resize:none"></textarea>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 col-sm-2 control-label">트레일러 유튜브 주소</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="y_link">
					<span class="help-block">예시 : https://www.youtube.com/watch?v=clU8c2fpk2s </span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 col-sm-2 control-label">러닝타임</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="movieRunning">분
					<span class="help-block">예시 : 120</span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 col-sm-2 control-label">감독</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="movieDerector">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 col-sm-2 control-label">상영기간</label>
				<div class="col-sm-10">
			 <div class="input-group input-large" data-date="sysdate" data-date-format="yyyy/mm/dd">
                      <input type="text" class="form-control dpd1" name="movieFrom">
                      <span class="input-group-addon">To</span>
                      <input type="text" class="form-control dpd2" name="movieTo">
                    </div>
				</div>
			</div>
				<button type="submit" class="btn btn-primary btn-lg">등록하기</button>
		</form>
	</section>
</section>
<%@include file="js.jspf"%>