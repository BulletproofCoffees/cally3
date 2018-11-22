<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../incs/lec_top.jspf" %>
<script type="text/javascript">

$(document).ready(function(){
	var one = $("#qone").val();
	var two = $("#qtwo").val();
	var thr = $("#qthr").val();
	var fou = $("#qfou").val();
	var fiv = $("#qfiv").val();
	var six = $("#qsix").val();
	var appcode = $("#appcode").val();

	$("input:radio[name='lec_qone']:radio[value="+one+"]").prop('checked', true);
	$("input:radio[name='lec_qtwo']:radio[value="+two+"]").prop('checked', true);
	$("input:radio[name='lec_qthr']:radio[value="+thr+"]").prop('checked', true);
	$("input:radio[name='lec_qfou']:radio[value="+fou+"]").prop('checked', true);
	$("input:radio[name='lec_qfiv']:radio[value="+fiv+"]").prop('checked', true);
	$("input:radio[name='lec_qsix']:radio[value="+six+"]").prop('checked', true);
	$("#category option[value="+appcode+"]").attr('selected','selected');
});      
    	</script>

<style>
</style>
    <section id="main-content">
      <section class="wrapper" id="eval">
        <div class="col-md-12">
          <h3><i class="fa fa-angle-right"></i>강의평가</h3>
          <!-- page start-->
          <div class="content-panel">
        <div class="row">
    
    <!-- 검색 -->
          <form action="${pageContext.request.contextPath}/lecture/eval_selected" method="post">
          <table class="eval_search">
                <tbody>
                 <tr>
                  <td></td>
           <td width="300px;">
          <select id="category" name="lec_app_code" class="form-control">
          <option disabled selected>강의를 선택해주세요</option>
          <c:forEach items="${list}" var="m">
			<option value="${m.lec_app_code}">${m.lec_name}(${m.lec_whe})</option>
			</c:forEach>
           </select>
           </td>
          <td><button class="btn btn-small btn-theme" style="float:right;">조회</button></td>
     <!-- 검색끝 -->   
          <td></td>
          </tr>
          </tbody>
          </table>
          </form>
          </div>
          <hr>
          <h1></h1>
          <div class="hidden">
           <input type="text" id="qone" value="${t_list.LEC_QONE}">
           <input type="text" id="qtwo" value="${t_list.LEC_QTWO}">
           <input type="text" id="qthr" value="${t_list.LEC_QTHR}">
           <input type="text" id="qfou" value="${t_list.LEC_QFOU}">
           <input type="text" id="qfiv" value="${t_list.LEC_QFIV}">
           <input type="text" id="qsix" value="${t_list.LEC_QSIX}">
           </div>
           <form action="${pageContext.request.contextPath}/lecture/eval_app" method="post">
           <input type="text" class="hidden" name="lec_app_code" id="appcode" value="${t_list.LEC_APP_CODE}" required>
			<h4>사전평가 문항</h4>
              <table class="display table table-bordered eval_cont">
                <tbody>
                  <tr class="gradeU">
                    <th width="4%">번호</th>
                    <th>문항내용</th>
                    <th width="4%">배점</th>
                    <th width="8%">매우그렇다</th>
                    <th width="8%">그렇다</th>
                    <th width="8%">보통이다</th>
                    <th width="8%">그렇지않다</th>
                    <th width="8%">매우그렇지않다</th>
                  </tr>
                  <tr class="gradeU">
                    <td>1</td>
                    <td>나는 이 수업을 다른 학생에게 추천하겠다.</td>
                    <td>5</td>
                    <td><input type="radio" name="lec_qone" value="5" required></td>
                    <td><input type="radio" name="lec_qone" value="4" required></td>
                    <td><input type="radio" name="lec_qone" value="3" required></td>
                    <td><input type="radio" name="lec_qone" value="2" required></td>
                    <td><input type="radio" name="lec_qone" value="1" required></td>
                  </tr>
                  <tr class="gradeU">
                    <td>2</td>
                    <td>나는 이 수업에 대해 전반적으로 만족한다.</td>
                    <td>5</td>
                    <td><input type="radio" name="lec_qtwo" value="5" required></td>
                    <td><input type="radio" name="lec_qtwo" value="4" required></td>
                    <td><input type="radio" name="lec_qtwo" value="3" required></td>
                    <td><input type="radio" name="lec_qtwo" value="2" required></td>
                    <td><input type="radio" name="lec_qtwo" value="1" required></td>
                  </tr>
                  <tr class="gradeU">
                    <td>3</td>
                    <td>이 수업은 전공이나 진로설정에 도움이 되었다.</td>
                    <td>5</td>
                    <td><input type="radio" name="lec_qthr" value="5" required></td>
                    <td><input type="radio" name="lec_qthr" value="4" required></td>
                    <td><input type="radio" name="lec_qthr" value="3" required></td>
                    <td><input type="radio" name="lec_qthr" value="2" required></td>
                    <td><input type="radio" name="lec_qthr" value="1" required></td>
                  </tr>                  
                </tbody>
              </table>
          </div>
          </div>
          <!-- page end-->
          <div class="col-md-12 mt">
                    <div class="content-panel">
                    <h4>CIPP별 문항</h4>
              <table class="display table table-bordered eval_cont">
                <tbody>
                  <tr class="gradeU">
                    <th width="4%">번호</th>
                    <th>문항내용</th>
                    <th width="4%">배점</th>
                    <th width="8%">매우그렇다</th>
                    <th width="8%">그렇다</th>
                    <th width="8%">보통이다</th>
                    <th width="8%">그렇지않다</th>
                    <th width="8%">매우그렇지않다</th>
                  </tr>
                  <tr class="gradeU">
                    <td>1</td>
                    <td>나는 이 수업을 다른 학생에게 추천하겠다.</td>
                    <td>5</td>
                    <td><input type="radio" name="lec_qfou" value="5" required></td>
                    <td><input type="radio" name="lec_qfou" value="4" required></td>
                    <td><input type="radio" name="lec_qfou" value="3" required></td>
                    <td><input type="radio" name="lec_qfou" value="2" required></td>
                    <td><input type="radio" name="lec_qfou" value="1" required></td>
                  </tr>
                  <tr class="gradeU">
                    <td>2</td>
                    <td>나는 이 수업에 대해 전반적으로 만족한다.</td>
                    <td>5</td>
                    <td><input type="radio" name="lec_qfiv" value="5" required></td>
                    <td><input type="radio" name="lec_qfiv" value="4" required></td>
                    <td><input type="radio" name="lec_qfiv" value="3" required></td>
                    <td><input type="radio" name="lec_qfiv" value="2" required></td>
                    <td><input type="radio" name="lec_qfiv" value="1" required></td>
                  </tr>
                  <tr class="gradeU">
                    <td>3</td>
                    <td>이 수업은 전공이나 진로설정에 도움이 되었다.</td>
                    <td>5</td>
                    <td><input type="radio" name="lec_qsix" value="5" required></td>
                    <td><input type="radio" name="lec_qsix" value="4" required></td>
                    <td><input type="radio" name="lec_qsix" value="3" required></td>
                    <td><input type="radio" name="lec_qsix" value="2" required></td>
                    <td><input type="radio" name="lec_qsix" value="1" required></td>
                  </tr>  
                </tbody>
              </table>
          </div>
          </div>
          
          <div class="col-md-12 mt">
                    <div class="content-panel">
                    <h4>서술형 문항</h4>
              <table class="display table table-bordered eval_cont">
                <tbody>
                  <tr class="gradeU">
                    <th width="4%">번호</th>
                    <th>문항내용</th>
                    <th width="50%">답변</th>
                  </tr>
                  <tr class="gradeU">
                    <td>1</td>
                    <td>이 수업의 교수(강사), 수업내용, 수업방법, 평가와 관련하여 좋았던 점을 적으시기 바랍니다.</td>
                    <td><textarea class="form-control" name="lec_qsev" required>${t_list.LEC_QSEV}</textarea></td>
                  </tr>
                  <tr class="gradeU">
                    <td>2</td>
                    <td>이 수업의 교수(강사), 수업내용, 수업방법, 수업평가와 관련하여 개선(보완)할 사항을 적으시기 바랍니다.</td>
                    <td><textarea class="form-control" name="lec_qeig" required>${t_list.LEC_QEIG}</textarea></td>
                  </tr>
                </tbody>
              </table>
          </div>
          </div>
          
         <div class="col-md-12 mt">
        <button class="btn btn-small btn-theme" style="float:right;">저장하기</button>
        </div>
        </form>
        <!-- /row -->
      </section>

      <!-- /wrapper -->
    </section>
    <!-- /MAIN CONTENT -->
    <!--main content end-->
    <%@ include file="../incs/bottom.jspf" %>