<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../incs/lec_top.jspf" %>
<style>
</style>
    <section id="main-content">
      <section class="wrapper" id="lec_plan">
        <div class="col-md-12">
          <h3><i class="fa fa-angle-right"></i>강의계획서조회</h3>
          <!-- page start-->
          <div class="content-panel">
        <div class="row">
          <table class="lec_search">
                <tbody>
                  <tr>
                  <td></td>
                    <td class="like_th">강의년도</td>
                    <td width="90px;">
          <select class="form-control">
          <option>2018</option>
          <option>2017</option>
           </select>
           </td>
           <td class="like_th">강의학기</td>
           <td width="90px;">
          <select class="form-control">
          <option>1학기</option>
          <option>2학기</option>
           </select>
           </td>
           <td class="like_th">과목번호</td>
           <td class="lec_button"><button class="btn btn-theme" type="button"><i class="fa fa-search"></i></button></td>
          <td width="190px"><input class="form-control" type="text" placeholder="7308"></td>
          <td width="190px"><input class="form-control" id="disabledInput" type="text" disabled></td>
          <td><button class="btn btn-small btn-theme" style="float:right;">조회</button></td>
          <td></td>
          </tr>
          </tbody>
          </table>
          </div>
          <hr>
            <div>
              <table id="plan_info" cellpadding="0" cellspacing="0" border="0" class="display table table-bordered" id="hidden-table-info">
                <tbody>
                  <tr class="gradeU">
                    <th>교과목명</th>
                    <td colspan="2"></td>
                    <th>과목번호</th>
                    <td></td>
                    <th>구분(학점)</th>
                    <td>시간 ()학점</td>
                  </tr>
                  <tr class="gradeU">
                    <th>수강대상</th>
                    <td colspan="2">학년</td>
                    <th>강의유형</th>
                    <td></td>
                    <th>언어구분</th>
                    <td></td>
                  </tr>
                  <tr class="gradeU">
                  <th>강의실(강의시간)</th>
                  <td colspan="6"></td>
                  </tr>
                  <tr class="gradeU">
                    <th>담당교수</th>
                    <td class="like_th">성명</td>
                    <td></td>
                    <td class="like_th">소속</td>
                    <td></td>
                    <td class="like_th">연락처</td>
                    <td></td>
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
			<h4>교과목개요</h4>
            <div>
              <table id="plan_cont" cellpadding="0" cellspacing="0" border="0" class="display table table-bordered">
                <tbody>
                  <tr class="gradeU">
                    <th rowspan="2">강의방법</th>
                    <th>강의식</th>
                    <th>실험/실습</th>
                    <th>현장학습</th>
                    <th>E러닝</th>
                    <th rowspan="2">평가방법</th>
                    <th>출석률</th>
                    <th>중간고사</th>
                    <th>기말고사</th>
                    <th>과제</th>
                  </tr>
                  <tr class="gradeU">
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
                  </tr>
                  <tr class="gradeU">
                  <th>강의개요</th>
                  <td colspan="9"></td>
                  </tr>
                  <tr class="gradeU">
                  <th>강의목표</th>
                  <td colspan="9"></td>
                  </tr>
                  <tr class="gradeU">
                    <th rowspan="2">강의교재</th>
                    <th colspan="3">교재명</th>
                    <th colspan="2">저자</th>
                    <th colspan="2">출판사</th>
                    <th colspan="2">출판년도</th>
                  </tr>
                  <tr class="gradeU">
                    <td colspan="3"></td>
                    <td colspan="2"></td>
                    <td colspan="2"></td>
                    <td colspan="2"></td>
                  </tr>
                </tbody>
              </table>
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
    