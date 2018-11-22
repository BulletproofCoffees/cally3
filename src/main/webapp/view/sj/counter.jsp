<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="submenu.jspf"%>

  <!-- url 가져오기 -->
     <script>
     $(function(){       
        var url = decodeURIComponent(location.href);      
        var params = decodeURIComponent(location.href).substring( url.indexOf('=')+1, url.length );
        $("#day").append(params);  
        $(".dayurl").attr("value", params);
        var url = params
        $(".sjurl").attr("action", '${pageContext.request.contextPath}/sj/counter/='+params);
        $(".imgform").attr("action", '${pageContext.request.contextPath}/sj/counter/='+params);        
     });
   </script>
  
 

<!-- HTML -->
<section id="main-content">
	<section class="wrapper site-min-height ">
		<div class="col-md-12 ds" style="margin-top: 25px;">	
		<!-- 일일 섭취칼로리 -->
		<div class="col-md-12 " >
		<div class="col-md-8 " >
			<div class="col-md-12 showback" id='day' style="font-size: 20px; font-weight: bolder; letter-spacing:5px;"></div><!-- 날짜 -->
		
			<div class="col-md-12 showback">
			<%@ include file="piece/today_cal.jsp"%>
			<%-- <%@ include file="piece/jqbar.jsp"%> --%></div> 
			</div>
			
			<div class="col-md-4 showback"><%@ include file="piece/chart.jsp"%> </div><!-- 그래프 --> 
			</div>
		
			
			<!--이미지업  -->
			<div class="col-md-12 " >		
			<div class="col-md-8 ">								
					<div class="showback col-md-12">

						<c:choose>
							<c:when test="${img == '[null]'}">
								<form method="post" enctype="multipart/form-data" class="imgform">
									<input type="hidden" name="dayurl" class=" dayurl" readonly><!-- 저장날짜  -->
									<div class="col-md-12 img_event">
										<input type="file" id="input-file-events"class="dropify-event" name='img' />
									</div>
									<div class="col-md-12" style="padding-top: 15px;">
										<textarea class="form-control" rows="3" style="height: 100px;"name='text'></textarea>
										<button class="btn btn-primary  col-md-offset-8 col-md-4"style="margin-top: 15px;">이미지업로드</button>
									</div>
								</form>
							</c:when>
							<c:otherwise>
								<c:forEach items="${img}" var="img">
									<form method="post"enctype="multipart/form-data" class="imgform">
										<input type="hidden" name="dayurl" class=" dayurl" readonly><!-- 저장날짜  -->
										<div class="col-md-12 img_event">
										<input type="file" id="input-file-events"class="dropify-event" name='img' />
										<input type="hidden" class="myimg"value="${pageContext.request.contextPath}/sj/img/${img.IMG}"name="mem_num">
									</div>										
										<div class="col-md-12" style="padding-top: 15px;">
											<textarea class="form-control" rows="3"style="height: 100px;" name='text'>${img.COM}</textarea>
										<button class="btn btn-primary  col-md-offset-8 col-md-4" style="margin-top: 15px;">이미지 변경</button>
										</div>
									</form>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</div>                  
                    </div>
				<!--/이미지업  -->
				
						 <!-- 달력-->    
			 	<div class="col-md-4" style="padding: 0px;">	
        <%@ include file="piece/my_calendar.jsp"%>
            	</div>  
  		  <!-- /달력-->    
			</div>
			
			<!-- /일일 섭취칼로리 -->

	

		<!-- 식단 추가  -->
		<div class="col-md-12 ds" style="padding-bottom: 20px;padding-right: 0px;">
		<img alt="" src="">
			<%@ include file="piece/accordion.jsp"%>
		</div>
		<!-- /식단추가  -->

</div>

	</section>
</section>
 
 

   <%@ include file="js/js.jspf" %>
    
   
   
   
 <!-- 이미지 업로드 스크립트 -->  
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,300,700,900|Roboto+Condensed:400,300,700' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/sj/lib/dist/css/dropify.min.css">
    <link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath}/sj/lib/dist/js/dropify.min.js"></script>
        <script> 
      /*   alert($("input#input-file-events").attr("id")); */
             $(document).ready(function(){
                // Basic
                $('.dropify').dropify();

              
                
                // Used events
                var drEvent = $('.dropify-event').dropify();

              /*   drEvent.on('dropify.beforeClear', function(event, element){
                    return confirm("Do you really want to delete \"" + element.filename + "\" ?");
                }); */

                drEvent.on('dropify.afterClear', function(event, element){
                	
                });
               
                
            }); 
            
             
       
        </script>


  





  <style>
.dropify-wrapper{height: 227px;}
</style>







































  