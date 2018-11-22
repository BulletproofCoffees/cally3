<%@ include file="../incs/lec_top.jspf" %>
<style>
</style>
<!--main content start-->
    <section id="main-content">
      <section class="wrapper">
        <h3><i class="fa fa-angle-right"></i>복학신청/취소</h3>
        <div class="col-md-12">
          <!-- page start-->
          <div class="content-panel">
          <h4>휴학신청</h4>
            <div class="adv-table">
              <table cellpadding="0" cellspacing="0" border="0" class="display table table-bordered" id="hidden-table-info">
                <tbody>
                  <tr class="gradeU">
                    <th width="150">신청년도</th>
                    <td width="220"><input class="form-control" id="disabledInput" type="text" placeholder="2018" disabled></td>
                    <th width="150">신청학기</th>
                    <td width="220">
                    <select class="form-control">
                    <option>1학기</option>
                    <option>2학기</option>
                    </select>
                    </td>
                    <th width="150">신청일자</th>
                    <td width="220"><input class="form-control" id="disabledInput" type="text" placeholder="20181015" disabled></td>
                    <td colspan="2"></td>
                  </tr>
                  <tr class="gradeU">
                    <th>휴학사유</th>
                    <td>
                    <select class="form-control">
                    <option>가사휴학</option>
                    <option>입대휴학</option>
                    </select>
                    </td>
                    <th>휴학시작년도</th>
                    <td><input class="form-control" id="disabledInput" type="text" placeholder="20181015" disabled></td>
                    <th>휴학시작학기</th>
                    <td>
                    <select class="form-control">
                    <option>1학기</option>
                    <option>2학기</option>
                    </select>
                    </td>
                    <th width="150">휴학기간</th>
                    <td>
                    <select class="form-control">
                    <option>1년</option>
                    <option>2년</option>
                    </select>
                    </td>
                  </tr>
                  <tr class="gradeU">
                    <th>복학예정년도</th>
                    <td><input class="form-control" id="disabledInput" type="text" placeholder="20181015" disabled></td>
                    <th>복학예정수강학기</th>
                    <td>
                    <select class="form-control">
                    <option>1학기</option>
                    <option>2학기</option>
                    </select>
                    </td>
                    <th>입대일자</th>
                    <td>
                    <div data-date-viewmode="years" style="width:82%;"
                    data-date-format="dd-mm-yyyy" data-date="01-01-2014" class="input-append date dpYears">
                      <input type="text" readonly="" value="01-01-2014" size="16" class="form-control">
                      <span class="input-group-btn add-on">
                        <button class="btn btn-theme" type="button"><i class="fa fa-calendar"></i></button>
                        </span>
                    </div>
                    </td>
                    <td colspan="2"></td>
                  </tr>
                  <tr class="gradeU">
                    <th>서류구분방법</th>
                    <td colspan="3">2018</td>
                    <th>파일첨부</th>
                    <td colspan="3">2학기</td>
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
                    <th width="150">처리일자</th>
                    <td width="220"><input class="form-control" id="disabledInput" type="text" placeholder="처리일자" disabled></td>
                    <th width="150">처리상태</th>
                    <td width="220">
                    <select class="form-control">
                    <option>신청중</option>
                    <option>준비중</option>
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
        <!-- /row -->
      </section>
      <!-- /wrapper -->
    </section>
    <!-- /MAIN CONTENT -->
    <!--main content end-->
    <%@ include file="../incs/bottom.jspf" %>