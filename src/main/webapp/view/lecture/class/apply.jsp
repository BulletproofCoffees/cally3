<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../incs/lec_top.jspf" %>
<style>
</style>
    <section id="main-content">
      <section class="wrapper" id="lec_plan">
        <div class="col-md-12">
          <h3><i class="fa fa-angle-right"></i>수강신청내역조회/삭제</h3>
          <!-- page start-->
          <div class="content-panel">
        <div class="row">
          <form action="${pageContext.request.contextPath}/lecture/lec_indi_search" method="post">
          <table class="lec_search">
                <tbody>
                  <tr>
                  <td></td>
                    <td class="like_th">수강년도</td>
                    <td width="90px;">
          <select name="lec_year" class="form-control">
          <option value="18">2018</option>
          <option value="17">2017</option>
          <option value="16">2016</option>
           </select>
           </td>
           <td class="like_th">수강학기</td>
           <td width="90px;">
          <select name="lec_sem" class="form-control">
          <option value="1">1학기</option>
          <option value="2">2학기</option>
           </select>
           </td>
           <td class="like_th">학번</td>
          <td width="190px"><input class="form-control" id="disabledInput" type="text" placeholder="${sessionScope.loginUser.mem_num}" disabled></td>
          <td width="190px"><input class="form-control" type="text" placeholder="${sessionScope.loginUser.mem_name}" disabled></td>
          <td><button class="btn btn-small btn-theme" style="float:right;">조회</button></td>
          <td></td>
          </tr>
          </tbody>
          </table>
        </form>
          </div>
          <hr>
            <div>
              <table id="apply" class="display table table-bordered">
                <tbody>
                  <tr class="gradeU">
                    <th>이수구분</th>
                    <th>과목번호</th>
                    <th>교과목명</th>
                    <th>학점</th>
                    <th>강의요일/시간</th>
                    <th colspan="2">담당교수</th>
                  </tr>
                  <c:forEach items="${list}" var="m">
                  <tr class="gradeU">
                  	<td>${m.lec_type}</td>
                    <td>${m.lec_sche_code}</td>
                    <td>${m.lec_name}</td>
                    <td>${m.lec_point}</td>
                    <td>${m.lec_day} ${m.lec_hour}~${m.lec_hour+(m.lec_point*100)}</td>
                    <td>${m.lec_pro_name}</td>
                    <c:choose>
                    <c:when test="${m.lec_sem_code == 182}">
                    
                    <form action="${pageContext.request.contextPath}/lecture/lec_del" method="post">
					<td class="hidden"><input type="text" name="lec_app_code" value="${m.lec_app_code}">
					<input type="text" name="mem_num" value="${sessionScope.loginUser.mem_num}">
					<input type="text" name="lec_sem_code" value="${m.lec_sem_code}">
					
					</td>
                    <td><button class="btn btn-danger btn-xs"><i class="fa fa-trash-o "></i></button></td>
                    </form>
                    
                    </c:when>
                    <c:otherwise>
                    </c:otherwise>
                    </c:choose>
                    </tr>
                  </c:forEach>
                </tbody>
              </table>
            </div>
          </div>
          <!-- page end-->
        </div>
        <!-- /row -->
      </section>
      <!-- /wrapper -->
    </section>
    <!-- /MAIN CONTENT -->
    <!--main content end-->
    <%@ include file="../incs/bottom.jspf" %>