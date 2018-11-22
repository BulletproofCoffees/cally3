<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ include file="submenu.jspf" %>
<style>
tr>td:nth-child(1) { 
    width: 20%;
}

</style>

   <section id="main-content">
      <section class="wrapper">
         <div class="col-lg-12 main-chart js_hame  ">
         <div class="col-lg-12 showback">
 <form action="${pageContext.request.contextPath}/sj/changingcal" method="post">
            <table class="table table-condensed">
               <thead>
                  <tr>
                     <th>설정변경</th>
                     <th></th>
                  </tr>
               </thead>
               
               <c:forEach items="${c_te}" var="c_te">
               <tbody>
                      <tr>
                     <td>이름</td>
                     <td>
                        <div class="form-inline">                								
     ${sessionScope.loginUser.mem_name}     
                        </div>
                     </td>
                  </tr>
                  <tr>
                     <td>성별</td>
                     <td>
                        <div class="form-inline">
                 								
      <p>${c_te.MEM_SEX}</p><input type="hidden" value="${c_te.MEM_SEX}" name="sex" readonly>
      
                        </div>
                     </td>
                  </tr>
                  <tr>
                     <td>현재Cal</td>
                     <td>
                        <div class="form-inline">
                           <input type="text" class="form-control" name="m_cal"  value="${c_te.M_CAL}" readonly>
                           <label for="exampleInputName2">Cal</label>
                        </div>
                     </td>
                  </tr>
                  <tr>
                     <td>나이</td>
                     <td>
                        <div class="form-inline">
                           <input type="text" class="form-control" name="age" value="${c_te.AGE}" readonly>
                           <label for="exampleInputName2"></label>
                        </div>
                     </td>
                  </tr>
                  <tr>
                     <td>체중</td>
                     <td>
                        <div class="form-inline">
                           <input type="text" class="form-control" name="kg" value="${c_te.KG}" readonly>
                           <label for="exampleInputName2">Kg</label>
                        </div>
                     </td>
                  </tr>
                  <tr>
                     <td>신장</td>
                     <td>
                        <div class="form-inline">
                           <input type="text" class="form-control" name="stature" value="${c_te.STATURE}" readonly>
                           <label for="exampleInputName2">Cm</label>
                        </div>
                     </td>
                  </tr>
                  <tr>
                     <td>목표</td>
                     <td>
                        <div class="form-inline">
                           <select class="form-control" name="mygoal">
                              <option value="1">체중 유지 하기</option>
                              <option value="2">체중 증가</option>
                              <option value="3">느린 체중 증가</option>
                              <option value="4">느린 체중 감소</option>
                              <option value="5">체중 감소</option>
                           </select>
                        </div>
                     </td>
                  </tr>
                  <tr>
                     <td>활동레벨</td>
                     <td>
                     <input type="radio" name="blankRadio" id="blankRadio1" value="activity1" aria-label="..." checked>정적활동 
                     <input type="radio" name="blankRadio" id="blankRadio1" value="activity2" aria-label="...">적은활동 
                     <input type="radio" name="blankRadio" id="blankRadio1" value="activity3" aria-label="...">활동적 
                     <input type="radio" name="blankRadio" id="blankRadio1" value="activity4"aria-label="...">매우 활동적
                     </td>
                  </tr>

               </tbody>
               </c:forEach>
               <tfoot>
                  <tr>
                     <td></td>
                     <td><button class="btn btn-primary col-md-2 col-md-offset-10">권장칼로리변경</button></td>
                  </tr>
               </tfoot>
            </table>
</form>

            <div class="col-lg-12">
               <b>* 어떤 활동레벨을 선택해야합니까?</b><br> <br> 
               <b>정주</b><small>
                  – 휴식, 책상작업 또는 운전등은 일상생활 활동입니다. 가벼운 가사 및 서있기도 포함가능하지만 가벼운 운동은 포함되지
                  않습니다.</small><br>
               <br> <b>낮은 활동적</b><small> – 일상생활 활동이외에, 장시간의 서있기 또는
                  가사일과 같이 격렬한 활동을 더하세요. 가벼운 운동의 형태로 천천히 걷기, 천천히 자전거타기 또는 정원관리등이
                  있습니다.</small><br>
               <br> <b>활동적</b><small> – 최소한 앉기와/또는 휴식및 작업환경은 서있기와 또는
                  신체적으로 움직임을 요구할 수도 있습니다. 정기적으로 댄스, 상쾌한 산책 또는 수영과 같은 적당한 운동을 수행하세요.</small><br>
               <br> <b>매우 활동적</b><small> – 건설일과 같이 신체적 격한 활동 및/또는 조깅,
                  체육관 장비 이용또는 스포츠같은것을 대부분의 날에 합니다.</small>
            </div>
         </div>


      </div>
      </section>
    
    </section>
    <%@ include file="js/js.jspf" %>
    
    <script type="text/javascript">
$(function() {
	a = "${ok}";
	if(a == ''){		
	}else {
		alert(a);	
	}	
});
</script>
    