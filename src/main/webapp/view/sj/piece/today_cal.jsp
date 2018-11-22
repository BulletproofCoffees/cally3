<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   

<c:choose>
		<c:when test="${tdy_cal == '[]'}">
		<div class=" col-lg-12 " style="padding:37px 0 37px; font-size: 50px">
		<p style="text-align:center;">등록된 칼로리가 없습니다.</p>
		</div>
		</c:when>
		<c:otherwise>
		<table class="col-md-7">
 <tr>
    <th><p>일일 섭취량</p></th>
    </tr>
    <tr>
    <th><a id="cal" style=" font-size:90px; font-weight: bolder;"></a><a>cal</a> </th>
    </tr>
 </table>
 
 <div class="col-md-4" style="
    padding-top: 50px;
"> 
<table class="col-md-12"> 
  <tbody>
  <tr>
      <th> <p>탄수화물 </p> </th>
      <th><p><a id="Glucose"></a><a>g</a> </p> </th>
    </tr>
    <tr>
      <th><p>단백질</p> </th>
      <th> <p><a id="Protein"></a><a>g</a> </p> </th>
    </tr>
    <tr>
      <th><p>지방</p> </th>
      <th><p><a id="Fat"></a><a>g</a> </p> </th>
    </tr>   
  </tbody> 
</table>	
 </div>
		</c:otherwise>
		</c:choose>



 


 
 <!-- 카운터 업 스크립트  -->
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
<c:forEach items="${tdy_cal}" var="tdy_cal">
new numberCounter("cal", ${tdy_cal.CAL});
new numberCounter("Glucose", ${tdy_cal.CARBOHYDRATEEKS});
new numberCounter("Protein", ${tdy_cal.PROTEIN});
new numberCounter("Fat", ${tdy_cal.FAT});
</c:forEach>
</script>
 