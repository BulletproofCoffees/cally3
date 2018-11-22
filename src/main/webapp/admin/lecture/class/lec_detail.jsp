<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
<%@ include file="/admin/incs/top.jspf"%>
<%@ include file="../incs/lec_top.jspf" %>
<style>
th {text-align:center;}
</style>
<script type="text/javascript">
function del(x)
{
	var result = confirm('강의를 삭제하시겠습니까?');
	if(result) { 
		location.href="${pageContext.request.contextPath}/admin/lecture/lec_sche_del/"+x;
	} else { alert('취소되었습니다.'); }
}
$(document).ready(function(){
	 var getmsg = $('#getmsg').val();
	 if($('#getmsg').val().length != 0) {alert(getmsg);}
	
	$("#modify_sche").click(function(){
		var result = confirm('강의를 수정하시겠습니까?');
		if(result) { 
			document.modify.submit();
		} else { alert('취소되었습니다.') }
	});

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
	
var selected_day = $('#selected_day').val();

if(selected_day == 'mon') {$('#lec_day').val(1).prop("selected", true);}
else if(selected_day == 'tue') {$('#lec_day').val(2).prop("selected", true);}
else if(selected_day == 'wed') {$('#lec_day').val(3).prop("selected", true);}
else if(selected_day == 'thu') {$('#lec_day').val(4).prop("selected", true);}
else {$('#lec_day').val(5).prop("selected", true);};

var selected_hour = $('#selected_hour').val();
var selected_dan = $('#selected_dan').val();

if(selected_dan == '디자인대학') {$('#lec_dan').val(1).prop("selected", true);}
else if(selected_dan == '과학기술대학') {$('#lec_dan').val(2).prop("selected", true);}
else if(selected_dan == '인문사회대학') {$('#lec_dan').val(3).prop("selected", true);}
else if(selected_dan == '교양대학') {$('#lec_dan').val(4).prop("selected", true);}
else {$('#lec_dan').val(5).prop("selected", true);};


var selected_room = $('#selected_room').val();
$('#lec_hour').val(selected_hour).prop("selected", true);
$('#lec_room').val(selected_room).prop("selected", true);


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
        <h3><i class="fa fa-angle-right"></i>강의수정/삭제</h3>
        <input type="text" class="hidden" id="getmsg" value="${getmsg}">
        <div class="col-md-12">
          <!-- page start-->
          <div class="content-panel">
          <h4>강의정보</h4>
            <div>
              <table cellpadding="0" cellspacing="0" border="0" class="display table table-bordered" id="hidden-table-info">
                <tbody>
                  <form action="${pageContext.request.contextPath}/admin/lecture/lec_modify" name="modify" method="post">
                  <tr class="gradeU">
                    <th width="150">신청년도</th>
                    <td width="220">
                    <select class="form-control" name="year" id="appyear" disabled>
                    <option value="19">2019</option>
                    <option value="18">2018</option>
                    <option value="17">2017</option>
                    <option value="16">2016</option>
                    </select>
                    </td>
                    <th width="150">신청학기</th>
                    <td width="220">
                    <select class="form-control" name="sem" id="appsem" disabled>
                    <option value="1">1학기</option>
                    <option value="2">2학기</option>
                    </select>
                    </td>
                    <th>강의유형</th>
                    <td><input type="text" class="form-control" value="${detail.LEC_TYPE}" disabled></td>
                    <td colspan="2">
                  </tr>
                  <tr class="gradeU">
                    <th>강의명</th>
                    <td>
                    <input type="text" value="${detail.LEC_NAME}" class="form-control" disabled>              
                    </td>
                    <th>강의코드</th>
                    <td>
					<input type="text" class="form-control" value="${detail.LEC_CODE}" disabled>
                    </td>
                    <th width="150">언어구분</th>
                    <td><input type="text" class="form-control" value="${detail.LEC_LANG}" disabled></td>
                    <th>강의방법</th>
                    <td><input type="text" class="form-control" value="${detail.LEC_WAY}" disabled></td>
                    </tr>
                </tbody>
              </table>
            </div>
          </div>
          <!-- page end-->
        </div>
        <div class="col-md-12 mt">
        <div class="content-panel">
        <h4>교수 정보</h4>
        <div class="adv-table">
       <table cellpadding="0" cellspacing="0" border="0" class="display table table-bordered" id="hidden-table-info">
               <tbody>
        <tr class="gradeU">
                    <th width="150">교수명</th>
                    <td width="180"><input type="text" class="form-control" value="<c:choose><c:when test="${detail.LEC_DAN_CODE=='1'}">디자인대학</c:when><c:when test="${detail.LEC_DAN_CODE=='2'}">과학기술대학</c:when><c:when test="${detail.LEC_DAN_CODE=='3'}">인문사회대학</c:when><c:when test="${detail.LEC_DAN_CODE=='4'}">교양대학</c:when></c:choose>" disabled>
                    <td width="200"><input type="text" class="form-control" value="${detail.LEC_PRO_NAME}" disabled></td>
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
          <h4>수정할 강의정보를 입력해 주세요</h4>
                    <div class="hidden">
          <input type="text" id="selected_day" value="${detail.LEC_DAY}">
          <input type="text" id="selected_hour" value="${detail.LEC_HOUR}">
          <input type="text" id="selected_dan" value="${detail.LEC_DAN}">
          <input type="text" id="selected_room" value="${detail.LEC_ROOM_NUM}">
          </div>
            <div class="adv-table">
              <table cellpadding="0" cellspacing="0" border="0" class="display table table-bordered" id="hidden-table-info">
              <input class="hidden" type="text" value="${detail.LEC_SCHE_CODE}" name="lec_sche_code">
                <tbody>
                  <tr class="gradeU">
                    <th width="150">시작시간</th>
                    <td>
                    <select class="form-control" id="lec_day" name="lec_day">
                    <c:forEach items="${d}" var="m">
                    <option value="${m.LEC_DAY_CODE}">${m.LEC_DAY}</option>
                    </c:forEach>
                    </select>
                    </td>
                    <td>
                    <select class="form-control" id="lec_hour" name="lec_hour">
                    <c:forEach items="${h}" var="m">
                    <option value="${m.LEC_HOUR}">${m.LEC_HOUR}</option>
                    </c:forEach>
                    </select>
                    </td>
                    <th rowspan="2">강의교재</th>
                  <td><input type="text" name="lec_book_name" placeholder="교재명" class="form-control" value="${detail.LEC_BOOK_NAME}"></td>
                  <td><input type="number" name="lec_publ_year" placeholder="출판년도" class="form-control" value="${detail.LEC_PUBL_YEAR}"></td>
                    <th width="150">최대강의인원</th>
                    <td><input type="number" name="lec_perso" class="form-control" value="${detail.LEC_PERSO}"></td>
                  </tr>
                  <tr class="gradeU">
                    <th width="150">강의실</th>
                    <td width="180">
                    <select class="form-control" id="lec_dan" name="lec_dan">
                    <c:forEach items="${r}" var="m">
                    <option value="${m.LEC_DAN_CODE}">${m.LEC_DAN}</option>
                    </c:forEach>    
                    </select>
                    </td>
                    <td>
                    <select class="form-control" id="lec_room" name="lec_room">
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
                  <td><input type="text" name="lec_publisher" placeholder="출판사" class="form-control" value="${detail.LEC_PUBLISHER}"></td>
                  <td><input type="text" name="lec_athor" placeholder="저자" class="form-control" value="${detail.LEC_ATHOR}"></td>
                  
                  </tr>
                  <tr class="gradeU">
                  <th>강의개요</th>
                  <td colspan="10"><textarea style="height:150px;" name="lec_sum" class="form-control">${detail.LEC_SUM}</textarea></td>
                  </tr>
                  <tr class="gradeU">
                  <th>강의목표</th>
                  <td colspan="10"><textarea style="height:150px;" name="lec_goal" class="form-control">${detail.LEC_GOAL}</textarea></td>
                  <td class="hidden">
                  <input type="text" name="lec_code" value="${detail.LEC_CODE}">
                  <input type="text" name="lec_sem" class="semd">
                  <input type="text" name="lec_year" class="yeard">
                  <input type="text" name="lec_point" value="${detail.LEC_POINT}">
                  </td>
                  </tr>
                </tbody>
                                  </form>
              </table>
            </div>
          </div>

          <!-- page end-->
        </div>
        <div class="col-md-12 mt">
        <!--c:url value="/admin/lecture/lec_list" var="lec_listUrl"/><a href="${lec_listUrl}"-->
        <!-- button class="btn btn-small btn-theme04 cancel" style="float:right;"onclick="location='${lec_listUrl}'">취소</button-->
        <button class="btn btn-small btn-theme04" onclick="del(${detail.LEC_SCHE_CODE})" style="float:right; margin-right:20px;">삭제하기</button>
        <button class="btn btn-small btn-theme" id="modify_sche" style="float:right; margin-right:5px;">수정하기</button>
        </div>

        <!-- /row -->
      </section>
      <!-- /wrapper -->
    </section>
    <!-- /MAIN CONTENT -->
    <!--main content end-->
    <%@ include file="../incs/bottom.jspf" %>
     <%@ include file="/admin/incs/bottom.jspf"%>