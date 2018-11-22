<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
          <h3><i class="fa fa-angle-right"></i>수강신청</h3>
          <input type="text" class="hidden" id="getmsg" value="${getmsg}">
          <!-- page start-->
          <div class="content-panel">
        <div class="row">
          <form action="${pageContext.request.contextPath}/lecture/lec_search" method="post">
          <table class="lec_search">
                <tbody>
                   <tr>
                  <td></td>
                    <td class="like_th">수강년도</td>
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
           </td>
           <td class="like_th"></td>
          <td width="190px"><input class="form-control" name="lec_name" id="disabledInput" type="text" placeholder="과목이름"></td>
          <td>
          <button class="btn btn-small btn-theme" style="float:right;">조회</button></td>
          <td></td>
          </tr>
          </tbody>
          </table>
        </form>
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
                    <th width="20px"></th>
                  </tr>
                  <c:forEach items="${list}" var="m">
                  <tr class="gradeU">
                  	<td>${m.lec_type}</td>
                    <td class ="lec_type">${m.lec_sche_code}</td>
                    <td>${m.lec_dan}</td>
                    <td>${m.lec_name}</td>
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
                    <td><button class="btn btn-small btn-theme" onclick="javascript:app('${m.lec_name}','${m.lec_day}','${m.lec_hour}','${m.lec_sche_code}','${m.lec_sche_code}')">신청</button></td>
                    </tr>
                  </c:forEach>
                </tbody>
              </table>
           <form class="hidden" name="form1" action="${pageContext.request.contextPath}/lecture/lec_app" method="post">
					<input type="text" name="lec_day" id="day">
                    <input type="text" name="lec_hour" id="hour">
                    <input type="text" name="lec_sche_code" id="code">
                    <input type="text" name="lec_point" id="point">
                    <button id="btn1">dd</button>
           </form>
  <script type="text/javascript">       
function app(name,day,hour,code,point){
	var con_test = confirm(name+day+hour+'('+code+' '+point+'학점) 을 신청하시겠습니까?');
	document.getElementById('day').value = document.getElementById('day').value + day;	
	document.getElementById('hour').value = document.getElementById('hour').value + hour;
	document.getElementById('code').value = document.getElementById('code').value + code;
	document.getElementById('point').value = document.getElementById('point').value + point;
	if(con_test == true){		
		document.form1.btn1.click();	
	}
		else if(con_test == false){
		location.href="/cally/lecture/lec_list";
		} 
      };   
</script>

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