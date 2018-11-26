<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>   
<%@ include file="/admin/incs/top.jspf"%>
 
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> 
<script src="${pageContext.request.contextPath}/lib/bootstrap/js/bootstrap.min.js"></script>

<section>
	<section class="wrapper">  
          <div class="col-lg-12">
            <div class="row ">
            
              <div class="panel-heading">
                <ul class="nav nav-tabs nav-justified">
                  <li class="active">
                    <a data-toggle="tab" href="#overview">통계</a>
                  </li>
                 <!--  <li>
                    <a data-toggle="tab" href="#contact" class="contact-map">Contact</a>
                  </li> -->
                  <li>
                    <a data-toggle="tab" href="#edit">food list</a>
                  </li>
                </ul>
              </div>
              
              <div class="panel-body">
                <div class="tab-content">
                
                  <div id="overview" class="tab-pane active">
<!--그래프-------------------------------------------------------------------------------->
							<div class="col-md-12">
							
								<div class="col-md-6">	
								  							
									<span class="b_bold b_fontsize20">남자회원평균섭취량</span>
									<div id="hero-donut" class="graph"></div>
									<span id="counter1" style="margin-left: 30px; font-size:50px; font-weight: bolder;"></span><span>cal</span>
								</div>
								
								<div class="col-md-6">
								
									<span class="b_bold b_fontsize20">여자회원평균섭취량</span>
									<div id="hero-donut2" class="graph"></div>
									<span id="counter2" style="margin-left: 30px; font-size:50px; font-weight: bolder;"></span><span>cal</span> 
								</div>
							</div>

  </div>
<!---------------------------------------------------------------------------------->
  
                  
<!---------------------------------------------------------------------------------->
						<div id="contact" class="tab-pane">
							<div class="row">
								<div class="col-md-12">
									<div class="col-md-12">방보싶 머하지???</div>
								</div>
							</div>
						</div>
<!---------------------------------------------------------------------------------->

<!---------------------------------------------------------------------------------->
						<div id="edit" class="tab-pane">
                    <div class="row">
                      <div class="col-lg-12">

									<table  class="table table-striped">
									<thead>
											<tr>
											    <td><span class="check"><input type="checkbox" class="checked"></span></td>
												<td>넘버</td>
												<td>식품명</td>
												<td>제조사</td>
												<td>1회제공량 (g)</td>
												<td>열량 (kcal)</td>
												<td>탄수화물 (g)</td>
												<td>단백질 (g)</td>
												<td>지방 (g)</td>
												<td>당류 (g)</td>
												<td>나트륨 (mg)</td>
												<td>콜레스테롤 (mg)</td>
												<td>포화지방산 (g)</td>
												<td>트랜스지방산 (g)</td>	
																							
											</tr>

										</thead>
										<tbody>
										<c:forEach items="${foodlist}" var="foodlist">
											<tr class="re_list">
											<td><span class="check"><input type="checkbox" class="checked"></span></td>											
												<td>${foodlist.F_NO}</td>
												<td><a href="${pageContext.request.contextPath}/sj/Ingredient/${foodlist.DESC_KOR}">${foodlist.DESC_KOR}</a></td>
												<td>${foodlist.MN}</td>
												<td>${foodlist.SERVING_WT}</td>
												<td>${foodlist.NUTR_CONT1}</td>
												<td>${foodlist.NUTR_CONT2}</td>
												<td>${foodlist.NUTR_CONT3}</td>
												<td>${foodlist.NUTR_CONT4}</td>
												<td>${foodlist.NUTR_CONT5}</td>
												<td>${foodlist.NUTR_CONT6}</td>
												<td>${foodlist.NUTR_CONT7}</td>
												<td>${foodlist.NUTR_CONT8}</td>
												<td>${foodlist.NUTR_CONT9}</td>	
											<td><button class="close" aria-hidden="true" data-dismiss="alert" name="button" value="${foodlist.F_NO}">×</button></td>											
											</tr>
								       </c:forEach>
										</tbody>
									</table>
								</div>
                    </div>
                  </div>
                  
                  <script type="text/javascript">
                  $('tr.re_list button.close').on("click", function() {
                	  alert('삭제하시겠습니까?');
                	  var re_list = $(this).parents("tr.re_list");
                  var no =  $(this).val(); 
                  alert(re_list);
                  $ .ajax({
                	  url : "${pageContext.request.contextPath}/admin/sj", 
                	  data : {
                		  f_no : no
          			},
          			type : 'POST',
          			dataType : 'text',
          			success : function(response) {
          				re_list.empty();
        			},
        			error : 
        				function(response) {
        				 alert('error');
        			}
                  }); 
                 
                  
                  });
                  </script>
<!---------------------------------------------------------------------------------->
                  
                  
                </div>
              </div>
            
            </div>       
          </div>
      </section>
    </section>
<%--    <%@ include file="/admin/incs/bottom.jspf"%> 
    --%>
    
<!--페이지  -->
 <script>
    $('.contact-map').click(function() {

      //google map in tab click initialize
      function initialize() {
        var myLatlng = new google.maps.LatLng(40.6700, -73.9400);
        var mapOptions = {
          zoom: 11,
          scrollwheel: false,
          center: myLatlng,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        }
        var map = new google.maps.Map(document.getElementById('map'), mapOptions);
        var marker = new google.maps.Marker({
          position: myLatlng,
          map: map,
          title: 'Dashio Admin Theme!'
        });
      }
      google.maps.event.addDomListener(window, 'click', initialize);
    });
  </script>
  
  
<!--  그래프 -->
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>							
<script>
  Morris.Donut({
      element: 'hero-donut',
      data: [
        {label: '지방', value: ${m[0].NUTR_CONT4} },
        {label: '단백질', value: ${m[0].NUTR_CONT3} },
        {label: '탄수화물', value: ${m[0].NUTR_CONT2} }
   
      ],
        colors: ['#4ECDC4', '#ED5565', '#f0AD4E', '#CCC'],
      formatter: function (y) { return y + "%" }
    });
  
  Morris.Donut({
      element: 'hero-donut2',
      data: [
        {label: '지방', value: ${w[0].NUTR_CONT4} },
        {label: '단백질', value: ${w[0].NUTR_CONT3} },
        {label: '탄수화물', value: ${w[0].NUTR_CONT2} }
   
      ],
        colors: ['#4ECDC4', '#ED5565', '#f0AD4E', '#CCC'],
      formatter: function (y) { return y + "%" }
    });  
  </script>
 <!--/ 그래프 -->
 <!--숫자스크립트  -->
 <script type="text/javascript">
function numberCounter(target_frame, target_number) {
    this.count = 0; this.diff = 0;
    this.target_count = parseInt(target_number);
    this.target_frame = document.getElementById(target_frame);
    this.timer = null;
    this.counter();
};
numberCounter.prototype.counter = function() {
    var self = this;
    this.diff = this.target_count - this.count;
     
    if(this.diff > 0) {
        self.count += Math.ceil(this.diff / 5);
    }
     
    this.target_frame.innerHTML = this.count.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
     
    if(this.count < this.target_count) {
        this.timer = setTimeout(function() { self.counter(); }, 20);
    } else {
        clearTimeout(this.timer);
    }
};

new numberCounter("counter1",${m[0].NUTR_CONT1});
new numberCounter("counter2",${w[0].NUTR_CONT1});
</script>
  <!--/숫자스크립트  -->

        	  	  


