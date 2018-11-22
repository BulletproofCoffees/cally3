<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ include file="incs/lec_top.jspf" %>
   <section id="main-content">
      <section class="wrapper site-min-height">
      <div></div>
        <div class="row mt">
          <div class="col-lg-12">
            <!-- CHART PANELS -->
            <div class="row">
            <div class="col-lg-12 col-md-8 col-sm-8 mb">
            <div class="product-panel-2 pn" style="height:553px; background:url(img/callyPlus/lec/university2.jpg)center; background-size: cover;">
                    <div style="background:rgba(0, 0, 0, 0.3);">
                    <h1 style="padding:257px 0; color:#fff;">Welcome to CALLY UNIVERSITY</h1>
                    </div>
            </div>
            </div>
            </div>
            <div class="row">
             <!-- 1 -->
 			<div class="col-lg-4 col-md-4 col-sm-4 mb">
                <div class="product-panel-2 pn">
                  <c:choose>
                  <c:when test="${stinfo eq 'a'}">
                  <img src="img/callyPlus/lec/book.png" width="200" alt="">
                  <div class="badge badge-hot">HELLO</div>
  					<h1>12/1~12/10</h1>
  					<h6>수강신청 기간입니다.</h6>
  					<c:url value="/lecture/lec_list" var="rec_lecListUrl"/> 
  					<button class="btn btn-small btn-theme04" onclick="location='${rec_lecListUrl}'">신청하기</button>
					</c:when>
    		     <c:when test="${stinfo eq 'l'}">
    		      <img src="img/callyPlus/lec/book.png" width="200" alt="">
    		     <div class="badge badge-hot">HELLO</div>
  					<h5>휴학중입니다!</h5>
  					<h6>수강신청을 하려면 복학신청을 해주세요</h6>
  					<c:url value="/lecture/leave" var="rec_leaveUrl"/>
  					<button class="btn btn-small btn-theme04" onclick="location='${rec_leaveUrl}'">복학신청하기</button>
				</c:when>
				 <c:otherwise>
				  <img src="img/callyPlus/lec/book.png" width="200" alt="">
				 <div class="badge badge-hot">NEW</div>
					 <h5>먼저! CALLY의 학생이 되세요!</h5>
                  <h6>학생등록 후 학사관리 서비스를<br/> 이용할 수 있습니다.</h6>           
                  <c:url value="/lecture/enroll" var="rec_enrollUrl"/>      
                  <button class="btn btn-small btn-theme04" onclick="location='${rec_enrollUrl}'">신청하기</button>
                   </c:otherwise>
					</c:choose>         
                </div>
                </div>
              <!-- 2 -->
              <div class="col-lg-4 col-md-4 col-sm-4 mb">
                <div class="content-panel pn">
                  <div id="profile-02">
                    <div class="user" style="color:#fff;">
                    <h1>12/1~12/10</h1>
                    <h5>수강신청 기간입니다</h5>
                    <h3></h3>
                    </div>
                  </div>
                  <div class="pr2-social centered">
                    <a href="#">수강신청 하러가기!</a>
                  </div>
                </div>
              </div>
              <!-- 2 -->
              <div class="col-md-4 col-sm-4 mb">
                <div class="weather pn">
                  <i class="fa fa-thumbs-o-up fa-4x"></i>
                  <h2>10/30</h2>
                  <h4><a style="color:#fff;" href="http://job.seoul.go.kr/www/jobfair/JobfairMng.do?method=selectWwwJobfairMngList">취업성공일구데이</a></h4>
                </div>
              </div>
            </div>
          </div>
          </div>
      </section>
      <!-- /wrapper -->
    </section>
    <!-- /MAIN CONTENT -->

    <%@ include file="incs/bottom.jspf" %>