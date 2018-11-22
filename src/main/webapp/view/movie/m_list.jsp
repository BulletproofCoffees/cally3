<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="sidemenu.jsp" %>
<section id="main-content">
      <section class="wrapper site-min-height">
        <h3><i class="fa fa-angle-right"></i>상영목록</h3>
        <hr>
        <div class="row mt">
        <c:forEach items="${movieL}" var="ml">
          <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 desc">
            <div class="project-wrapper">
              <div class="project">
                <div class="photo-wrapper">               
                  <div class="photo">
                  <c:url value="/movie/movieDetail/${ml.MMI_NO}?detail=${ml.MMI_NO}&tinfo=${ml.MTI_CODE}&cno=${ml.M_C_NO }&ms_no=${ml.MS_NO }" var="detail"/>
                    <a class="fancybox" href="${detail}"><img class="img-responsive"
                    src="../img/callyPlus/${ml.MMI_IMG }"></a>
                  </div>         
                  <div class="overlay">test</div>
                </div>
              </div>
            </div>
          </div>
          
          </c:forEach>
      	</div>
        <!-- /row -->
      </section>
      <!-- /wrapper -->
    </section>
    <%@include file="js.jspf" %>