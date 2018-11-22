<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
<%@ include file="/admin/incs/top.jspf"%>
<%@ include file="../incs/lec_top.jspf" %>
<style>
td, th {text-align:center;}
#enroll_bottom {position:fixed; bottom:0; background:#ccc;}
</style>
<script type="text/javascript">
function sear_st(x){
	location.href="${pageContext.request.contextPath}/admin/lecture/lec_st_search/"+x;
}
$(document).ready(function(){

	
});
</script>
<!--main content start-->
   <section id="main-content">
      <section class="wrapper" id="lec_plan">
        <div class="col-md-12">
          <h3><i class="fa fa-angle-right"></i>학생 리스트</h3>
          <input type="text" class="hidden" id="getmsg" value="${getmsg}">
          <!-- page start-->
          <div class="content-panel">
        <div class="row">
          <table class="lec_search">
           <tbody>
            <tr>
          <td width="70%"></td>
          <form action="${pageContext.request.contextPath}/admin/lecture/st_search" method="post">
          <td>
          <span style="float:right;">
          <input type="radio" name="lec_st_info" value="l" onclick="sear_st(this.value)">
          <label>휴학중</label>
          </span>
          </td>
          <td width="5%">
          <span>
          <input type="radio" class="st_search" name="lec_st_info" value="a" onclick="sear_st(this.value)">
          <label>재학중</label>
          </span>
          </td>
          </form>
          <form action="${pageContext.request.contextPath}/admin/lecture/lec_st_name_sear" method="post">
          <td width="190px"><input class="form-control" name="name" id="disabledInput" type="text" placeholder="학생이름"></td>
          <td><button class="btn btn-small btn-theme" style="float:left;">조회</button></td>
          </form>
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
                    <th width="100px">학생번호</th>
                    <th>학생이름</th>
                    <th width="150px">현재상태</th>
                    <th width="150px">할당학점</th>
                    <th></th>
                  </tr>
                                    
                  <c:forEach items="${list}" var="m">

                  <tr class="gradeU">
                  	<td>${m.MEM_NUM}</td>
                    <td><c:url value="/admin/lecture/st_lec_list/${m.MEM_NUM}" var="lec_detUrl"/><a href="${lec_detUrl}">${m.MEM_NAME}</a></td>
                    <td>
                    <c:choose>
                    <c:when test="${m.LEC_ST_INFO=='a'}">재학중</c:when>
                    <c:otherwise>휴학중</c:otherwise>
                    </c:choose>
                    </td>
                    <td>${m.LEC_ST_PO}</td>
                    <td></td>
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