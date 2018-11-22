<%@ include file="incs/lec_top.jspf" %>
<style>
</style>
    <section id="main-content">
      <section class="wrapper" id="lec_plan">
        <div class="col-md-12">
          <h3><i class="fa fa-angle-right"></i>성적목록/등록</h3>
          <!-- page start-->
          <div class="content-panel">
        <div class="row">
          <table class="lec_search">
                <tbody>
                                    <tr>
                  <td></td>
                    <td class="like_th">연도</td>
                    <td width="90px;">
          <select class="form-control">
          <option>2018</option>
          <option>2017</option>
           </select>
           </td>
           <td class="like_th">학기</td>
           <td width="90px;">
          <select class="form-control">
          <option>1학기</option>
          <option>2학기</option>
           </select>
           </td>
           <td class="like_th">단과</td>
           <td width="90px;">
          <select class="form-control">
          <option>사회과학</option>
          <option>2학기</option>
           </select>
           </td>
           <td class="like_th">유형</td>
           <td width="90px;">
          <select class="form-control">
          <option>전선</option>
          <option>교양</option>
           </select>
           </td>
          <td width="190px"><input class="form-control" id="disabledInput" type="text" placeholder="교수명"></td>
          
          <td>
          <button class="btn btn-small btn-theme" style="margin-right:5px; float:right;">검색</button>
          </td>
          <td></td>
          </tr>
          </tbody>
          </table>
          </div>
          <hr>
            <div>
              <table id="apply" class="display table table-bordered">
                <tbody>
                  <tr class="gradeU">
                    <th>이수구분</th>
                    <th>과목번호</th>
                    <th>교과목명</th>
                    <th>학점</th>
                    <th>강의요일/시간</th>
                    <th>담당교수</th>
                    <th>성적등록여부</th>
                  </tr>
                  <tr class="gradeU">
                    <td></td>
                    <td></td>
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
    <%@ include file="incs/bottom.jspf" %>