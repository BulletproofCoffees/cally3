<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 주 평균  -->    
<div class="col-lg-12 " style="padding: 0px;">    
<div class=" col-lg-12 showback">
<div class="col-md-7">

 <p>평균 섭취량</p>
 <a id="counter1" style="margin-left: 30px; font-size:50px; font-weight: bolder;"></a><a>cal</a> 
</div>
<div class="col-md-4" style="
    padding-top: 15px;
"> 
<table class="col-md-12"> 
  <tbody>
  <tr>
      <td> <p>탄수화물</p> </td>
      <td><p><a id="Glucose"></a><a>g</a> </p> </td>
    </tr>
    <tr>
      <td><p>단백질</p> </td>
      <td> <p><a id="Protein"></a><a>g</a> </p> </td>
    </tr>
    <tr>
      <td><p>지방</p> </td>
      <td><p><a id="Fat"></a><a>g</a> </p> </td>
    </tr>   
  </tbody> 
</table>	
 </div>
 

 
</div>
</div>
<!-- /주 평균  -->  
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
<c:forEach items="${average}" var="average">
new numberCounter("counter1",${average.AVERAGE});
new numberCounter("Glucose", ${average.CAR});
new numberCounter("Protein", ${average.PROTEIN});
new numberCounter("Fat", ${average.FAT});
</c:forEach>


</script>