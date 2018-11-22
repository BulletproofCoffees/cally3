<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 프로젝트 - 분석 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/callyPlus/business/biz_dhtmlxgantt.css"/>
<%@ include file="biz_sidemenu.jspf" %>
<script>
	$('#biz_pjActive').addClass('active');
	$('#biz_act_an').addClass('active');
</script>
<!--main content start-->
    <section id="main-content">
      <section class="wrapper site-min-height">
        <h3><i class="fa fa-angle-right"></i> 분석</h3>
        <!-- page start-->
        <div class="row mt form-panel">
        	<div class="row show-grid mt" style="text-align: center; margin-bottom: -15px; margin-top: 5px">
        	  <div class="col-lg-1"></div>
        	  <div class="col-lg-2">시작일</div>
        	  <div class="col-lg-2">마감일</div>
        	  <div class="col-lg-2">완료일</div>
        	  <div class="col-lg-2">완료됨</div>
        	  <div class="col-lg-2">남은 업무</div>
        	  <div class="col-lg-1"></div>
        	</div>
        	<div class="row show-grid mt" style="text-align: center">
        	  <div class="col-lg-1"></div>
        	  <div class="col-lg-2"><button type="button" class="btn btn-default"><i class="fa fa-plus" style="color:#646464"></i></button></div>
        	  <div class="col-lg-2"><button type="button" class="btn btn-default"><i class="fa fa-plus" style="color:#646464"></i></button></div>
        	  <div class="col-lg-2"><button type="button" class="btn btn-default"><i class="fa fa-plus" style="color:#646464"></i></button></div>
        	  <div class="col-lg-2 biz_bold biz_lineheight30">2개 업무(30%)</div>
        	  <div class="col-lg-2 biz_bold biz_lineheight30">3개 업무(45%)</div>
        	  <div class="col-lg-1"></div>
        	</div>
        </div>
        <div class="row mt form-panel">
              <span style="float: left; font-size: 18px"><i class="fa fa-angle-right"></i> 프로젝트 개요</span>
              <div style="text-align: right">
              	<span class='biz_leftMargin'><i class="fa fa-dot-circle-o biz_i_sky"></i> 완료됨 30%</span>
              	<span class='biz_leftMargin'><i class="fa fa-dot-circle-o biz_i_red"></i> 마감일 지남 15%</span>
              	<span class='biz_leftMargin'><i class="fa fa-dot-circle-o biz_i_yellow"></i> 진행중 45%</span>
              	<span class='biz_leftMargin'><i class="fa fa-dot-circle-o biz_i_green"></i> 계획됨 10%</span>
              </div><br>
              <div class="progress biz_progress">
                <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 30%; background-color:#4ECDC4">
                </div>
                <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 15%; background-color:#ED5565">
                </div>
                <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 45%; background-color:#f0ad4e">
                </div>
                <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 10%; background-color:#5cb85c">
                </div>
              </div>
        	<div class="row mt" style="border: solid 8px #EDEDED; border-radius: 5px; text-align: center; margin: 1px 1px; padding: 3px">
        		  <div class="col-lg-6" style="border-right: solid 2px #EDEDED;">
        		  	<span class="biz_bold biz_fontsize20">나에게 배정된 업무</span>
        		  	<table style="margin: 0 auto;">
        		  		<tr>
        		  			<td style="width: 60%; padding:0 80px"><div id="biz_assignChart" class="graph" style="width: 300px;"></div></td>
        		  			<td  style="width: 40%">
        		  				<table style="width: 80%; text-align: left" class="biz_mark">
        		  					<tr>
        		  						<td><i class="fa fa-dot-circle-o biz_i_sky"></i> 완료됨</td>
        		  						<td>2</td>
        		  						<td>(30%)</td>
        		  					</tr>
        		  					<tr>
        		  						<td><i class="fa fa-dot-circle-o biz_i_red"></i> 마감일 지남</td>
        		  						<td>1</td>
        		  						<td>(15%)</td>
        		  					</tr>
        		  					<tr>
        		  						<td><i class="fa fa-dot-circle-o biz_i_yellow"></i> 진행중</td>
        		  						<td>3</td>
        		  						<td>(45%)</td>
        		  					</tr>
        		  					<tr>
        		  						<td><i class="fa fa-dot-circle-o biz_i_green"></i> 계획됨</td>
        		  						<td>1</td>
        		  						<td>(10%)</td>
        		  					</tr>
        		  				</table>
        		  			</td>
        		  		</tr>
        		  	</table>
        	  	  </div>
        	  	  <div class="col-lg-6">
        		  	<span class="biz_bold biz_fontsize20">내가 작성한 업무</span>
        		  	<table style="margin: 0 auto;">
        		  		<tr>
        		  			<td style="width: 60%; padding:0 80px"><div id="biz_writeChart" class="graph" style="width: 300px;"></div></td>
        		  			<td style="width: 40%;">
        		  				<table style="width: 80%; text-align: left" class="biz_mark">
        		  					<tr>
        		  						<td><i class="fa fa-dot-circle-o" style="color: #4ECDC4"></i> 완료됨</td>
        		  						<td>2</td>
        		  						<td>(30%)</td>
        		  					</tr>
        		  					<tr>
        		  						<td><i class="fa fa-dot-circle-o" style="color: #ED5565"></i> 마감일 지남</td>
        		  						<td>1</td>
        		  						<td>(15%)</td>
        		  					</tr>
        		  					<tr>
        		  						<td><i class="fa fa-dot-circle-o" style="color: #f0AD4E"></i> 계획됨</td>
        		  						<td>3</td>
        		  						<td>(45%)</td>
        		  					</tr>
        		  					<tr>
        		  						<td><i class="fa fa-dot-circle-o" style="color: #CCC"></i> 마감일 없음</td>
        		  						<td>1</td>
        		  						<td>(10%)</td>
        		  					</tr>
        		  				</table>
        		  			</td>
        		  		</tr>
        		  	</table>
        	  	  </div>
        	</div><br><br>
        	<span style="float: left; font-size: 18px"><i class="fa fa-angle-right"></i> 업무리스트 개요</span>
        	<div style="text-align: right; font-size: 15px;">
        		<button class='btn biz_leftMargin' style="background-color: #EDEDED">전체</button>
              	<button class='btn biz_leftMargin biz_nonbg'><i class="fa fa-dot-circle-o" style="color: #4ECDC4"></i> 완료됨</button>
              	<button class='btn biz_leftMargin biz_nonbg'><i class="fa fa-dot-circle-o" style="color: #ED5565"></i> 마감일</button>
              	<button class='btn biz_leftMargin biz_nonbg'><i class="fa fa-dot-circle-o" style="color: #f0AD4E"></i> 계획됨</button>
              	<button class='btn biz_leftMargin biz_nonbg'><i class="fa fa-dot-circle-o" style="color: #CCC"></i> 마감일 없음</button>
              </div><br>
              <canvas id="biz_outlineChart" height="62px"></canvas>
        </div>
        <!-- page end-->
      </section>
      <!-- /wrapper -->
    </section>
    <!-- /MAIN CONTENT -->
    <!--main content end-->
    <%@ include file="js.jspf" %>