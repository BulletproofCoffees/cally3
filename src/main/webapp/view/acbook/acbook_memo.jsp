<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <!-- 가계부 서브메뉴 인클루즈 -->
    <%@ include file="acbook_submenu.jspf" %>
    
    
    <style>
    span {
    margin-right: 3px;}
    
    .form-control {
    height: 30px;
    padding: 0px 5px;
    font-size: 1em;
    } 
    
    table {
    text-align: center;
    }
    
    .table {
    margin-bottom: 10px;
    }
    
    table th {
    background-color: #f9f9f9;
     text-align: center;
    }
    
    .datetd {
    cursor: pointer;
    }
    
.forsearch {
margin-bottom: 0px;
}

.forsearch > tbody > tr >td {
border-top: 0px;
}
   
    </style>
    
    
 <section id="main-content">
      <section class="wrapper">
        <h3><i class="fa fa-angle-right"></i> 메모 리스트</h3>
        <!-- page start-->
        <div class="row mt">

          <aside class="col-lg-12 mt">
            <section class="panel">
              <div class="panel-body">
              <form method="get" action="/cally/acbook/memolist">
              <table class="table forsearch">
              <tr>
              <td style="width: 1%; white-space: nowrap; padding-top:11px;">기간</td>
              <td style="width: 1%; white-space: nowrap;" >
         
             <div class="input-group input-large" data-date-format="yyyy/mm/dd">
                      <input type="text" class="form-control dpd1" name="from" value="${from}" style="width: 90px;">
                      <span class="input-group-addon">~</span>
                      <input type="text" class="form-control dpd2" name="to" value="${to}" style="width: 90px;">
                    </div>
             
             
             <td>&nbsp;</td>
              <td style="width: 1%; white-space: nowrap;"><input type="text" name="memo_value" class="form-control pull-right" placeholder="검색어" size="3"  style="width: 120px;"></td>
              <td style="width: 1%; white-space: nowrap; padding-left: 0px;"><button class="btn btn-theme03 btn-sm pull-right" type="submit"><i class="fa fa-search"></i></button></td>
              </tr>
              </table>
              </form>
               <div style="max-height: 800px; overflow-y : scroll; margin-bottom: 10px;">
               <table class="table table-hover table-bordered table-condensed">
              <tr>
              <th style="width: 15%;">날짜</th>
              <th>메모 내용</th>
              <c:if test="${empty memolist}">
              메모가 없습니다.
              </c:if>
              <c:forEach items="${memolist}" var="memo">
              <tr>
              <td class="datetd">
              <fmt:formatDate value="${memo.memo_date}" pattern="yyyy/MM/dd"/>
              </td>
              <td class="goleft">${memo.memo_value}</td>
              </tr>
              </c:forEach>
               </table>
               </div>
               -날짜를 클릭하면 해당 날짜 페이지로 이동합니다.
              </div>
            </section>
          </aside>
          

          
     
        </div>
        <!-- page end-->
      </section>
      <!-- /wrapper -->
    </section>
    <!-- /MAIN CONTENT -->
    
  <!-- 가계부 자바스크립트 인클루드 -->
    <%@ include file="acbook_js.jspf" %>
    <script>
    $("#ac_sub_2").addClass("active");
    $("#ac_sub_memolist").addClass("active");
    
    function getContextPath(){
        var offset=location.href.indexOf(location.host)+location.host.length;
        var ctxPath=location.href.substring(offset,location.href.indexOf('/',offset+1));
        return ctxPath;
    }
    
    $(".datetd").click(function(){
    	
    	var date = $(this).text().split("/");
    	var year = date[0];
    	var month = date[1];
    	var day = date[2];
    	$(location).attr("href",getContextPath()+"/acbook/dailypage?year=" + year +"&month=" + month + "&day=" + day);
    });
    </script>