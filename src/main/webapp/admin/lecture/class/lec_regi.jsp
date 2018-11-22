<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
<%@ include file="/admin/incs/top.jspf"%>
<%@ include file="../incs/lec_top.jspf" %>
<style>
th {text-align:center;}
</style>
<script type="text/javascript">
$(document).ready(function(){

	
var Now = new Date();
var year = Now.getFullYear();
var month = Now.getMonth()+1;
var date= Now.getDate();

var NowTime = Now.getFullYear();
NowTime += '-' + month;
NowTime += '-' + date;

var yearstr = parseInt(year.toString().substr(2,2));

if (month>7) {
	$("#appsem").val("2").prop("selected", true);
	$("#startsem").val("2").prop("selected", true);
	$('.semd').val("2");
	
	}
else {
	$("#appsem").val("1").prop("selected", true);
	$("#startsem").val("1").prop("selected", true);
	$('.semd').val("1");
	}

$("#appyear").val(yearstr).prop("selected", true);
$("#startyear").val(yearstr).prop("selected", true);
$("#backyear").val(yearstr).prop("selected", true);

$('.appday').val(NowTime);
$('.yeard').val(yearstr);

$('#lec_code').on('change', function() {
	var lec_code= this.value;
	this.form.submit(lec_code);
});

var selected_lec = $('#selected_lec').val();
$('#lec_code').val(selected_lec).prop("selected", true);
var selected_dan = $('#selected_dan').val();
$('#lec_pro_search').val(selected_dan).prop("selected", true);


$('#lec_pro_search').on('change', function() {
	var lec_dan_code= this.value;
	var lec_code= $('#lec_code_fp').val();
	this.form.submit(lec_code,lec_dan_code);
});



});  
</script>
<!--main content start-->
    <section id="main-content">
      <section class="wrapper" id="lec_leave">
        <h3><i class="fa fa-angle-right"></i>강의등록</h3>
        <div class="col-md-12">
          <!-- page start-->
          <div class="content-panel">
          <h4>STEP 1 : 등록할 강의를 선택해 주세요</h4>
            <div>
              <table cellpadding="0" cellspacing="0" border="0" class="display table table-bordered" id="hidden-table-info">
                <tbody>
                  <tr class="gradeU">
                    <th width="150">신청년도</th>
                    <td width="220">
                    <select class="form-control" id="appyear" disabled>
                    <option value="19">2019</option>
                    <option value="18">2018</option>
                    <option value="17">2017</option>
                    <option value="16">2016</option>
                    </select>
                    </td>
                    <th width="150">신청학기</th>
                    <td width="220">
                    <select class="form-control" id="appsem" disabled>
                    <option value="1">1학기</option>
                    <option value="2">2학기</option>
                    </select>
                    </td>
                    <td class="hidden"><input type="text" name="year" class="yeard"><input type="text" name="sem" class="semd"></td>
                    <th width="150">신청일자</th>
                    <td width="220"><input class="form-control appday" id="disabledInput" type="text" disabled></td>
                  </tr>
                  <tr class="gradeU">
                    <th>강의명</th>
                    <td>
                    <form action="${pageContext.request.contextPath}/admin/lecture/lec_re_info" method="post">
                    <select class="form-control" id="lec_code" name="lec_code">
                    <c:forEach items="${list}" var="m">
                    <option value="${m.LEC_CODE}">${m.LEC_NAME}</option>
                    </c:forEach>                    
                    </select>
                    </form>
                    </td>
                    <th>강의코드</th>
                    <td>
					<input type="text" class="form-control" id="selected_lec" value="${i.LEC_CODE}" disabled>
                    </td>
                    <th>강의유형</th>
                    <td><input type="text" class="form-control" value="${i.LEC_TYPE}" disabled></td>
                    </tr>
                    <tr class="gradeU">
                    <th width="150">언어구분</th>
                    <td><input type="text" class="form-control" value="${i.LEC_LANG}" disabled></td>
                    <th>강의방법</th>
                    <td><input type="text" class="form-control" value="${i.LEC_WAY}" disabled></td>
                    <td colspan="2"></td>
                    </tr>
                </tbody>
              </table>
            </div>
          </div>
          <!-- page end-->
        </div>
        <div class="col-md-12 mt">
        <div class="content-panel">
        <h4>STEP 2 : 강의를 담당할 교수를 선택해주세요</h4>
        <div class="adv-table">
       <table cellpadding="0" cellspacing="0" border="0" class="display table table-bordered" id="hidden-table-info">
               <tbody>
        <tr class="gradeU">
                          <th width="150">교수명</th>
                    <td width="180">
                    <form action="${pageContext.request.contextPath}/admin/lecture/lec_repro_info" method="post">
                    <select class="form-control" id="lec_pro_search" name="lec_dan_code">
                    <option disabled selected>단과</option>
                    <c:forEach items="${r}" var="m">
                    <option value="${m.LEC_DAN_CODE}">${m.LEC_DAN}</option>
                    </c:forEach>  
                    </select>
                    <input class="hidden" type="text" name="lec_code" id="lec_code_fp" value="${i.LEC_CODE}">  
                    </form>
                    </td>
   <form action="${pageContext.request.contextPath}/admin/lecture/lec_re_app" method="post">
                    <td width="200">
                    <select class="form-control" name="lec_pro">
                    <option disabled selected>이름</option>
                    <c:forEach items="${p}" var="m">
                    <option value="${m.LEC_PRO_CODE}">${m.LEC_PRO_NAME}</option>
                    </c:forEach>
                    </select>
                     <c:forEach items="${p}" var="m">
                    <input type = "text" value="${m.LEC_DAN_CODE}" id="selected_dan" class="hidden">
                    </c:forEach>
                    </td>
                    <td></td>
        </tr>
        </tbody>
        </table>
        
        </div>
        </div>
        </div>
                <div class="col-md-12 mt">
          <!-- page start-->
          <div class="content-panel">
          <h4>STEP 3 : 등록할 강의정보를 입력해 주세요</h4>
            <div class="adv-table">
              <table cellpadding="0" cellspacing="0" border="0" class="display table table-bordered" id="hidden-table-info">
                <tbody>
                  <tr class="gradeU">
                    <th width="150">시작시간</th>
                    <td>
                    <select class="form-control" name="lec_day">
                    <c:forEach items="${d}" var="m">
                    <option value="${m.LEC_DAY_CODE}">${m.LEC_DAY}</option>
                    </c:forEach>
                    </select>
                    </td>
                    <td>
                    <select class="form-control" name="lec_hour">
                    <c:forEach items="${h}" var="m">
                    <option value="${m.LEC_HOUR}">${m.LEC_HOUR}</option>
                    </c:forEach>
                    </select>
                    </td>
                    <th rowspan="2">강의교재</th>
                  <td><input type="text" name="lec_book_name" placeholder="교재명" class="form-control"></td>
                                    <td><input type="number" name="lec_publ_year" placeholder="출판년도" class="form-control"></td>
                    <th width="150">최대강의인원</th>
                    <td><input type="number" name="lec_perso" class="form-control"></td>
                  </tr>
                  <tr class="gradeU">
                                      <th width="150">강의실</th>
                    <td width="180">
                    <select class="form-control" name="lec_dan">
                    <c:forEach items="${r}" var="m">
                    <option value="${m.LEC_DAN_CODE}">${m.LEC_DAN}</option>
                    </c:forEach>    
                    </select>
                    </td>
                    <td>
                    <select class="form-control" name="lec_room">
                    <option value="101">101</option>
                    <option value="102">102</option>
                    <option value="103">103</option>
                    <option value="104">104</option>
                    <option value="105">105</option>
                    <option value="201">201</option>
                    <option value="202">202</option>
                    <option value="203">203</option>
                    <option value="204">204</option>
                    <option value="205">205</option>
                    <option value="301">301</option>
                    <option value="302">302</option>
                    <option value="303">303</option>
                    <option value="304">304</option>
                    <option value="305">305</option>
                    <option value="401">401</option>
                    <option value="402">402</option>
                    <option value="403">403</option>
                    <option value="404">404</option>
                    <option value="405">405</option>
                    </select>
                    </td>
                  <td><input type="text" name="lec_publisher" placeholder="출판사" class="form-control"></td>
                  <td><input type="text" name="lec_athor" placeholder="저자" class="form-control"></td>
                  
                  </tr>
                  <tr class="gradeU">
                  <th>강의개요</th>
                  <td colspan="10"><textarea style="height:150px;" name="lec_sum" class="form-control"></textarea></td>
                  </tr>
                  <tr class="gradeU">
                  <th>강의목표</th>
                  <td colspan="10"><textarea style="height:150px;" name="lec_goal" class="form-control"></textarea></td>
                  <td class="hidden">
                  <input type="text" name="lec_code" value="${i.LEC_CODE}">
                  <input type="text" name="lec_sem" class="semd">
                  <input type="text" name="lec_year" class="yeard">
                  <input type="text" name="lec_point" value="${i.LEC_POINT}">
                  </td>
                  </tr>

                </tbody>
              </table>
            </div>
          </div>
          <!-- page end-->
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
     <%@ include file="/admin/incs/bottom.jspf"%>