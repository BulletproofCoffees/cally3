<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../incs/lec_top.jspf" %>
<style>
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
	$('#semd').val("2");
	}
else {
	$("#appsem").val("1").prop("selected", true);
	$("#startsem").val("1").prop("selected", true);
	$('#semd').val("1");
	}

$("#appyear").val(yearstr).prop("selected", true);
$("#startyear").val(yearstr).prop("selected", true);
$("#backyear").val(yearstr).prop("selected", true);

$('.appday').val(NowTime);
$('#yeard').val(yearstr);


$('#leaterm').on('change', function() {
	var backt= this.value;
	var startsem = $("#startsem").val(); 
	if (backt == 1){ $("#backyear").val(yearstr+1).prop("selected", true);
	 $("#backsem").val(startsem).prop("selected", true);}
	else {$("#backyear").val(yearstr+2).prop("selected", true);
	 $("#backsem").val(startsem).prop("selected", true);
	}
});



});  
</script>
<!--main content start-->
    <section id="main-content">
      <section class="wrapper" id="lec_leave">
        <h3><i class="fa fa-angle-right"></i>휴학신청/취소</h3>
        <c:choose>
        <c:when test="${stinfo eq 'a'}">
                <form action="${pageContext.request.contextPath}/lecture/leave_app" method="post">
        <div class="col-md-12">
          <!-- page start-->
          <div class="content-panel">
          <h4>휴학신청</h4>
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
                    <td class="hidden"><input type="text" name="year" id="yeard"><input type="text" name="sem" id="semd"></td>
                    <th width="150">신청일자</th>
                    <td width="220"><input class="form-control appday" id="disabledInput" type="text" disabled></td>
                  </tr>
                  <tr class="gradeU">
                    <th>휴학사유</th>
                    <td>
                    <select class="form-control" name="lec_res_code">
                    <option value="1">가사휴학</option>
                    <option value="2">입대휴학</option>
                    <option value="3">질병휴학</option>
                    <option value="4">창업휴학</option>
                    <option value="5">육아휴학</option>
                    </select>
                    </td>
                    <th>휴학시작년도</th>
                    <td>
                    <select class="form-control" id="startyear" disabled>
                    <option value="19">2019</option>
                    <option value="18">2018</option>
                    <option value="17">2017</option>
                    <option value="16">2016</option>
                    </select>
                    </td>
                    <th>휴학시작학기</th>
                    <td>
                    <select class="form-control" id="startsem" disabled>
                    <option value="1">1학기</option>
                    <option value="2">2학기</option>
                    </select>
                    </td>
                    </tr>
                    <tr class="gradeU">
                    <th width="150">휴학기간</th>
                    <td>
                    <select id="leaterm" class="form-control">
                    <option></option>
                    <option value="1">1년</option>
                    <option value="2">2년</option>
                    </select>
                    </td>
                    <th>복학예정년도</th>
                    <td><select class="form-control" id="backyear" disabled>
                    <option value="21">2021</option>
                    <option value="20">2020</option>
                    <option value="19">2019</option>
                    <option value="18">2018</option>
                    <option value="17">2017</option>
                    <option value="16">2016</option>
                    </select></td>
                    <th>복학예정수강학기</th>
                    <td>
                    <select class="form-control" id="backsem" disabled>
                    <option value="1">1학기</option>
                    <option value="2">2학기</option>
                    </select>
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
          <!-- page end-->
        </div>
                <div class="col-md-12 mt">
          <!-- page start-->
          <div class="content-panel">
          <h4>신청결과</h4>
            <div class="adv-table">
              <table cellpadding="0" cellspacing="0" border="0" class="display table table-bordered" id="hidden-table-info">
                <tbody>
                  <tr class="gradeU">
                    <th width="150">처리일자</th>
                    <td width="220"><input class="form-control" id="disabledInput" type="text" placeholder="처리일자" disabled></td>
                    <th width="150">처리상태</th>
                    <td width="220">
                    <select class="form-control">
                    <option>신청중</option>
                    <option>준비중</option>
                    </select>
                    </td>
                    <th width="150">불가사유</th>
                    <td colspan="2"><input class="form-control" id="disabledInput" type="text" placeholder="불가사유" disabled></td>
                  </tr>
                  <tr class="gradeU">
                    <th>등록여부</th>
                    <td>
                    <select class="form-control">
                    <option>Y</option>
                    <option>N</option>
                    </select>
                    </td>
                    <th>성적인정여부</th>
                    <td>
                    <select class="form-control">
                    <option>Y</option>
                    <option>N</option>
                    </select></td>
                    <td colspan="3"></td>
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
        </c:when>
        <c:when test="${stinfo eq 'l'}">
        
                <script>
                $(document).ready(function(){
        var leav_code = $("#leav_code").val();
        var leav_day = $("#leav_day").val(); 
        var end_code = $("#end_code").val(); 
        var lec_res = $("#lec_res_code").val(); 
        var year = leav_code.substr(0,2);
        var endyear = end_code.substr(0,2);
        var sem = leav_code.substr(2,1);
        var endsem = end_code.substr(2,1);
        var leave_day = leav_day.substr(0,10);   
        
        var years = endyear-year;
        
        $('.year').val("20"+year);
        $('.sem').val(sem+"학기");
        $('.appday').val(leave_day);
        
        if(lec_res == '1') {$('.lecres').val("가사휴학");}
        else if(lec_res == '2') { $('.lecres').val("입대휴학"); }
        else if(lec_res == '3') {$('.lecres').val("질병휴학"); }
        else if(lec_res == '4'){ $('.lecres').val("창업휴학"); }
        else { $('.lecres').val("육아휴학"); }
        
        $('.years').val(years+"년");
        $('.endyear').val("20"+endyear);
        $('.endsem').val(endsem+"학기");
                });
        </script>
        
                <form action="${pageContext.request.contextPath}/lecture/back" method="post">
        <div class="col-md-12">
          <!-- page start-->
          <div class="content-panel">
          <h4>휴학취소</h4>
            <div>
                <table cellpadding="0" cellspacing="0" border="0" class="display table table-bordered" id="hidden-table-info">
                <tbody>
                <tr>
                <td class="hidden">
                <input type="text" name="leav_code" id="leav_code" value="${a.LEC_LEAV_CODE}">
               	<input type="text" id="leav_day" value="${a.LEC_LEAV_DAY}">
               	<input type="text" id="lec_res_code" value="${a.LEC_RES_CODE}">
               	<input type="text" id="end_code" value="${a.LEC_SEM_CODE2}">
                </td>
                
                </tr>
                  <tr class="gradeU">
                    <th width="150">신청년도</th>
                    <td width="220">
					<input type="text" class="form-control year" disabled>
                    </td>
                    <th width="150">신청학기</th>
                    <td width="220">
					<input type="text" class="form-control sem" disabled>
                    </td>
                    <th width="150">신청일자</th>
                    <td width="220"><input class="form-control appday" id="disabledInput" type="text" disabled></td>
                  </tr>
                  <tr class="gradeU">
                    <th>휴학사유</th>
                    <td>
					<input type="text" class="form-control lecres" disabled>
                    </td>
                    <th>휴학시작년도</th>
                    <td>
					<input type="text" class="form-control year" disabled>
                    </td>
                    <th>휴학시작학기</th>
                    <td>
 					<input type="text" class="form-control sem" disabled>
                    </td>
                    </tr>
                    <tr class="gradeU">
                    <th width="150">휴학기간</th>
                    <td>
                    <input type="text" class="form-control years" disabled>
                    </td>
                    <th>복학예정년도</th>
                    <td><input type="text" class="form-control endyear" disabled></td>
                    <th>복학예정수강학기</th>
                    <td>
					<input type="text" class="form-control endsem" disabled>
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
          <!-- page end-->
        </div>
                <div class="col-md-12 mt">
          <!-- page start-->
          <div class="content-panel">
          <h4>신청결과</h4>
            <div class="adv-table">
              <table cellpadding="0" cellspacing="0" border="0" class="display table table-bordered" id="hidden-table-info">
                <tbody>
                  <tr class="gradeU">
                    <th width="150">처리일자</th>
                    <td width="220"><input class="form-control" id="disabledInput" type="text" placeholder="처리일자" disabled></td>
                    <th width="150">처리상태</th>
                    <td width="220">
                    <select class="form-control">
                    <option>신청중</option>
                    <option>준비중</option>
                    </select>
                    </td>
                    <th width="150">불가사유</th>
                    <td colspan="2"><input class="form-control" id="disabledInput" type="text" placeholder="불가사유" disabled></td>
                  </tr>
                  <tr class="gradeU">
                    <th>등록여부</th>
                    <td>
                    <select class="form-control">
                    <option>Y</option>
                    <option>N</option>
                    </select>
                    </td>
                    <th>성적인정여부</th>
                    <td>
                    <select class="form-control">
                    <option>Y</option>
                    <option>N</option>
                    </select></td>
                    <td colspan="3"></td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
          <!-- page end-->
        </div>
        <div class="col-md-12 mt">
        <button class="btn btn-small btn-theme" style="float:right;">휴학취소하기</button>
        </c:when>
        <c:otherwise>
        <p>먼저 학생등록을 해주세요</p>
        </div>
        </form>
        </c:otherwise>
        </c:choose>

        <!-- /row -->
      </section>
      <!-- /wrapper -->
    </section>
    <!-- /MAIN CONTENT -->
    <!--main content end-->
    <%@ include file="../incs/bottom.jspf" %>