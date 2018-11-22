<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@include file="Asidemenu.jsp" %>
   <script>
   
   </script>
<section id="main-content">
   <section class="wrapper">
   <h3><i class="fa fa-angle-right"></i>상영물 관리</h3><hr>
      <div class="row mt">
         <div class="col-md-12">
            <div class="content-panel">
               <table class="table table-striped table-advance table-hover">
                  <thead>
                     <tr>
                     <th>영화번호</th>
                     <th width="20%">이미지</th>
                     <th>영화이름</th>
                     <th>장르</th>
                     <th>러닝타임</th>
                     <th>감독</th>
                     <th>수정/삭제</th>
                     </tr>
                  </thead>
                  <tbody>
                  <c:forEach items="${alist}" var="al">
                     <tr class="mtr">
                     <td class="mmi_${al.MMI_NO}">${al.MMI_NO }</td>
                     <td><img src="../img/callyPlus/${al.MMI_IMG }" height="150px"></td>
                     <td>${al.MMI_NAME }</td>
                     <td>${al.MMT_NAME }</td>
                     <td>${al.MMI_R_TIME }분</td>
                     <td>${al.MMC_NAME }</td>
                        <td><button class="btn btn-primary btn-xs">
                              <i class="fa fa-pencil"></i>
                           </button>
                           <button class="btn btn-danger btn-xs" onclick="movie_del(${al.MMI_NO})">
                              <i class="fa fa-trash-o "></i>
                           </button></td>
                     </tr>
                     </c:forEach>
                  </tbody>
               </table>
            </div>
            <!-- /content-panel -->
         </div>
         <!-- /col-md-12 -->
      </div>
      <!-- /row -->
   </section>
</section>
<script>
	function movie_del(val){
		  $.ajax({
			url : "del_movie",
			type : "post",
			data : {
				mmi_no : $('.mtr').find('.mmi_'+val).html()
			},
			success : function(data) {
				window.location.reload();
			}
		});  
	}
</script>
<%@include file="js.jspf" %>