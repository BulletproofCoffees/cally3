<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <!-- 가계부 서브메뉴 인클루즈 -->
    <%@ include file="acbook_submenu.jspf" %>
    
    <style>
    span {
    margin-right: 3px;}
   
    .form-control {
    height: 22px;
    padding: 0px 5px;
    font-size: 1em;
    }
    
     input[type=text], input[type=number] {
    border: 0px;
    background-color: rgba(0,0,0,0);
    box-shadow: inset 0 0px 0px rgba(0,0,0,0);
    }
    
    .table  th:first-child, .table  th:last-child {
    text-align: center;
    }
    .table tr td:first-child, .table tr td:last-child {
    text-align: center;
    }
   .numeric {
   text-align: right;}
    </style>
 
    
 <section id="main-content">
      <section class="wrapper">
        <h3><i class="fa fa-angle-right"></i> 지출 쓰기</h3>
        <!-- page start-->
        <div class="row mt">
        
          <aside class="col-lg-12 mt">
            <section class="panel">
              <div class="panel-body">
               <table class="table table-bordered table-hover table-striped table-condensed">
               <tr>
               <th><input type="checkbox"></th>
               <th>날짜</th>
               <th>내역</th>
               <th>금액</th>
               <th>출금통장</th>
               <th colspan="2">분류</th>
               <th></th>
               </tr>
               <tr>
               <td><input type="checkbox"></td>
               <td>2018.08.11</td>
               <td>파스타</td>
               <td class="numeric">30000</td>
               <td><span class="label label-success label-mini">적금</span>우리적금통장</td>
               <td colspan="2">식비>식사</td>
               <td> <button class="btn btn-danger btn-xs"><i class="fa fa-trash-o "></i></button></td>
               </tr>
               <tr>
               <td><input type="checkbox"></td>
               <td>2018.10.11</td>
               <td>간식</td>
               <td class="numeric">30000</td>
               <td><span class="label label-info label-mini">현금</span>지갑속현금</td>
               <td colspan="2">식비>간식</td>
               <td> <button class="btn btn-danger btn-xs"><i class="fa fa-trash-o "></i></button></td>
               </tr>
               <tr>
               <td><input type="checkbox"></td>
               <td>2018.08.11</td>
               <td>칫솔</td>
               <td class="numeric">5000</td>
               <td><span class="label label-info label-mini">현금</span>지갑속현금</td>
               <td colspan="2">생활비>생활용품</td>
               <td> <button class="btn btn-danger btn-xs"><i class="fa fa-trash-o "></i></button></td>
               </tr>
               
               <!-- ****************** 입력줄 ****************-->
               
                <tr>
               <td></td>
               <td>
               <div>
               <input class="form-control form-control-inline input-medium callydate default-date-picker callydate" size="3"  type="text" value="">
               </div>
               </td>
               <td><input type="text" class="form-control"></td>
               <td class="numeric"><input type="number" class="form-control">
</td>
               <td> <select class="form-control">
               <option>현금</option>
               <option>우리입출금통장</option>
               <option>국민통장</option>
               </select>
</td>
               <td><select class="form-control">
               <option>주수입</option>
               <option>부수입
               </option>
               </select></td><td>
               <select class="form-control">
               <option>용돈</option>
               <option>기타
               </option>
               </select></td>
               <td><button class="btn btn-success btn-xs"><i class="fa fa-check"></i></button>
               </td>
               </tr>
               </table>
               <button class="btn">선택삭제</button>
               
               <hr>
               -계좌간 이체방법 : A통장에서 B통장으로 이체시, '출금통장'은 A통장으로 '분류'는 '이체/대체>B통장' 선택
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
    $(".callydate").blur(function(){
    	var vall = $(this).val().split("-");
    	var slash = "/";
    	var newval = vall[2] + slash + vall[0] + slash + vall[1];
    	alert(newval);
    	$(this).val(slash);
    });
    
    </script>
