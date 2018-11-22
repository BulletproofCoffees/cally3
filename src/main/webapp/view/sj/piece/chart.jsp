<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:choose>
		<c:when test="${tdy_cal == '[]'}">
		<div class=" col-lg-12 " style="padding:37px 0 37px; font-size: 50px;   height: 229px; ">
		<p style="text-align:center;">정보 없음</p>
		</div>
		</c:when>
		<c:otherwise>
		<div class="col-md-12" >
        		  	<span class="b_bold b_fontsize20">일일 칼로리</span>
        	  	  	<div id="hero-donut" class="graph"style="
    height: 211px;
"></div>
</div>  
		
		</c:otherwise>
		</c:choose>



        	  	  
<!--  모리스 css -->
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">

	<script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script> 
<script>
<c:forEach items="${tdy_cal}" var="tdy_cal">
var a = ${tdy_cal.CARBOHYDRATEEKS};
var b = ${tdy_cal.PROTEIN};
var c = ${tdy_cal.FAT};

</c:forEach>
  Morris.Donut({
      element: 'hero-donut',
      data: [
        {label: '지방', value: c },
        {label: '단백질', value: b },
        {label: '탄수화물', value: 2 }
   
      ],
        colors: ['#4ECDC4', '#ED5565', '#f0AD4E', '#CCC'],
      formatter: function (y) { return y + "g" }
    });
  			
  
  </script>
