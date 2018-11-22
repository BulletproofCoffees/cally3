<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
<%@ include file="/admin/incs/top.jspf"%>
<%@ include file="../incs/lec_top.jspf" %>
<style>
td, th {text-align:center;}
#enroll_bottom {position:fixed; bottom:0; background:#ccc;}
</style>
<script type="text/javascript">
$(document).ready(function(){

});
</script>
<!--main content start-->
   <section id="main-content">
      <section class="wrapper" id="lec_plan">
        <div class="col-md-12">
          <h3><i class="fa fa-angle-right"></i>성적등록/수정</h3>
          <div class="content-panel">
        <div>
              <table class="display table table-bordered">
                <tbody>
                  <tr class="gradeU">
                    <th>강의명</th>
                    <th>학생명</th>
                    <th width="10%">중간고사성적</th>
                    <th width="10%">기말고사성적</th>
                    <th width="10%">과제성적</th>
                    <th width="10%">최종성적</th>
                    <th width="3%"></th>
                  </tr>
                  <c:forEach items="${detail}" var="m">
                  <form action="${pageContext.request.contextPath}/lecture/rec_update" method="post">
                  <tr class="gradeU">
                  <td>${m.LEC_NAME}</td>
                  	<td>${m.MEM_NAME}</td>
                    <td><input type="number" class="form-control" name="lec_mid_po" value="${m.LEC_MID_PO}"></td>
                    <td><input type="number" class="form-control" name="lec_fin_po" value="${m.LEC_FIN_PO}"></td>
                    <td><input type="number" class="form-control" name="lec_assi_po" value="${m.LEC_ASSI_PO}"></td>
                    <td><input type="number" class="form-control" name="lec_grade" value="${m.LEC_GRADE}"></td>
                    <td><button class="btn btn-theme btn-xs"><i class="fa fa-sign-out" ></i></button></td>
                    </tr>
                    </form>
                  </c:forEach>
                </tbody>
              </table>
</div>
            </div>
            </div>
          <!-- page end-->
        <!-- /row -->
      </section>
      <!-- /wrapper -->
    </section>
    <!-- /MAIN CONTENT -->
    <!--main content end-->
    <%@ include file="../incs/bottom.jspf" %>
     <%@ include file="/admin/incs/bottom.jspf"%>