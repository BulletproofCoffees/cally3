<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
<%@ include file="/admin/incs/top.jspf"%>
<%@ include file="../incs/lec_top.jspf" %>
<style>
td, th {text-align:center;}
#enroll_bottom {position:fixed; bottom:0; background:#ccc;}
</style>
<script type="text/javascript">
$(document).ready(function(){
 var getmsg = $('#getmsg').val();
if($('#getmsg').val().length != 0) {alert(getmsg);}
	
});
</script>
<!--main content start-->
   <section id="main-content">
      <section class="wrapper" id="lec_plan">
        <div class="col-md-12">
          <h3><i class="fa fa-angle-right"></i>강의등록/수정</h3>
          <input type="text" class="hidden" id="getmsg" value="${getmsg}">
          <!-- page start-->
          <div class="content-panel">
        <div class="row">
          <table class="lec_search">
                <tbody>
                          <form action="${pageContext.request.contextPath}/admin/lecture/lec_search" method="post">
                   <tr>
                  <td></td>
                    <td class="like_th">년도</td>
                    <td width="90px;">
          <select class="form-control">
          <option disabled selected>2018</option>
          <option disabled>2017</option>
          <option disabled>2016</option>
           </select>
           </td>
           <td class="like_th">수강학기</td>
           <td width="90px;">
          <select class="form-control">
          <option disabled>1학기</option>
          <option disabled selected>2학기</option>
           </select>
           </td>
           <td class="like_th">단과선택</td>
           <td width="140px;">
          <select name="lec_dan" class="form-control">
          <option value="디자인대학">디자인대학</option>
          <option value="과학기술대학">과학기술대학</option>
          <option value="인문사회대학">인문사회대학</option>
          <option value="교양대학">교양대학</option>
           </select>
          <td width="190px"><input class="form-control" name="lec_name" id="disabledInput" type="text" placeholder="과목이름"></td>
          <td>
          <button class="btn btn-small btn-theme" style="float:left;">조회</button></td>
          </form>
          <c:url value="/admin/lecture/lec_regi" var="lec_regiUrl"/>
          <td><button class="btn btn-small btn-theme02" style="float:right;" onclick="location='${lec_regiUrl}'">강의등록</button></td>
          <td></td>
          </tr>
          </tbody>
          </table>

          </div>
          <hr>
            <div>
              <table class="display table table-bordered">
                <tbody>
                  <tr class="gradeU">
                    <th width="100px">이수구분</th>
                    <th>과목번호</th>
                    <th>단과</th>
                    <th>교과목명</th>
                    <th>학점</th>
                    <th>강의실</th>
                    <th>강의요일</th>
                    <th>강의시간</th>
                    <th>담당교수</th>
                  </tr>
                  <c:forEach items="${list}" var="m">
                  <tr class="gradeU">
                  	<td>${m.lec_type}</td>
                    <td class ="lec_type">${m.lec_sche_code}</td>
                    <td>${m.lec_dan}</td>
                    <td><c:url value="/admin/lecture/lec_detail/${m.lec_sche_code}" var="lec_detUrl"/><a href="${lec_detUrl}">${m.lec_name}</a></td>
                    <td>${m.lec_point}</td>
                    <td>
                    <c:choose>
                    <c:when test="${m.lec_dan_code=='1'}">디</c:when>
                    <c:when test="${m.lec_dan_code=='2'}">과</c:when>
                    <c:when test="${m.lec_dan_code=='3'}">인</c:when>
                    <c:when test="${m.lec_dan_code=='4'}">교</c:when>
                    <c:otherwise> </c:otherwise>
                    </c:choose>
                     ${m.lec_room_num}</td>
                    <td>${m.lec_day}</td>
                    <td>${m.lec_hour}~${m.lec_hour+(m.lec_point*100)}</td>
                    <td>${m.lec_pro_name}</td>
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
     <%@ include file="/admin/incs/bottom.jspf"%>