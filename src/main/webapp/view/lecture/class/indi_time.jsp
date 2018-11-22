<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../incs/lec_top.jspf" %>
<style>
td {height:60px;}
</style>
<script type="text/javascript">

$(document).ready(function(){
	
	var length = $("#gotong > td").length;
	
	for(var j =1; j < length+1; j++) {

	var name = $("#gotong > td:nth-child("+j+") > .t_name").attr("name");
	var point = $("#gotong > td:nth-child("+j+") > .t_point").attr("name");
	var day = $("#gotong > td:nth-child("+j+") > .t_day").attr("name");
	var hour = $("#gotong > td:nth-child("+j+") > .t_hour").attr("name")-0;

	if(day=="mon") {day = 2;}
	else if (day == "tue") {day=3;}
	else if (day == "wed") {day=4;}
	else if (day == "thu") {day=5;}
	else {day=6;}

	for(var i = 0; i < point; i++) {
        $(".t"+hour+" > td:nth-child("+day+")").append("<center>"+name+"</center>");
        hour += 100;
	}         
	}
});       
    	</script>
    <section id="main-content">
    <div class="input" id="no">
    <input type="text" class="here" id="here">
    </div>
      <section class="wrapper" id="lec_plan">
        <div class="col-md-12">
          <h3><i class="fa fa-angle-right"></i>개인강의시간표조회</h3>
          <!-- page start-->
          <div class="content-panel">
        <div class="row">
        <form action="${pageContext.request.contextPath}/lecture/lec_time_search" method="post">
          <table class="lec_search">
                <tbody>
                  <tr>
                  <td></td>
                    <td class="like_th">수강년도</td>
                    <td width="90px;">
          <select name="lec_year" class="form-control">
          <option value="18" selected>2018</option>
          <option value="17">2017</option>
          <option value="16">2016</option>
           </select>
           </td>
           <td class="like_th">수강학기</td>
           <td width="90px;">
          <select name="lec_sem" class="form-control">
          <option value="1">1학기</option>
          <option value="2" selected>2학기</option>
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
          <table>
          <tr id="gotong" class="hidden">
    	<c:forEach items="${list}" var="m">
    	<td>
    	<input class="t_name" type="text" name="${m.lec_name}" placeholder="${m.lec_name}">
    	<input class="t_point" type="text" name="${m.lec_point}" placeholder="${m.lec_point}">
    	<input class="t_day" type="text" name="${m.lec_day}" placeholder="${m.lec_day}">
    	<input class="t_hour" type="text" name="${m.lec_hour}" placeholder="${m.lec_hour}">
    	</td>
    	</c:forEach>
    	</tr>
    	</table>
          <hr>
            <div>
              <table id="indi_time" cellpadding="0" cellspacing="0" border="0" class="display table table-bordered">
                <tbody>
                  <tr class="gradeU">
                    <th>시간</th>
					<th width = "15%">월</th>
					<th width = "15%">화</th>
					<th width = "15%">수</th>
					<th width = "15%">목</th>
					<th width = "15%">금</th>
                  </tr>
                  <tr class="t600">
                  	<th>1교시(06:00~08:00)</th>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                  </tr>
                  <tr class="t800">
                  	<th>2교시(08:00~09:00)</th>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                  </tr>
                  <tr class="t900">
                  	<th>3교시(09:00~10:00)</th>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                  </tr>
                  <tr class="t1000">
                  	<th>5교시(10:00~11:00)</th>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                  </tr>
                  <tr class="t1100">
                  	<th>6교시(11:00~12:00)</th>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                  </tr>
                  <tr class="t1200">
                  	<th>7교시(12:00~13:00)</th>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                  </tr>
                  <tr class="t1300">
                  	<th>8교시(13:00~14:00)</th>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                  </tr>
                  <tr class="t1400">
                  	<th>9교시(14:00~15:00)</th>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                  </tr>
                  <tr class="t1500">
                  	<th>10교시(15:00~16:00)</th>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                  </tr>
                  <tr class="t1600">
                  	<th>11교시(16:00~17:00)</th>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                  </tr>
                  <tr class="t1700">
                  	<th>12교시(17:00~18:00)</th>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                  </tr>
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