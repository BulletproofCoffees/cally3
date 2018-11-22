<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="../css/tbooking.css">
<style type="text/css">
#main-content{
width:800px;
padding:0% 4.5% 0% 4.5%;
}
*{
padding:0px;
margin:0px;
font-size:9pt;
}
.seatImg{
width:20px;
height:20px;
}
td{
font-size: 9pt;font-family: 돋움;
}
li{
list-style:none;
}
.seatNum{
background-color:grey;
}
.seatNum ul li{
display:inline-block;
border-right:2px solid grey;
padding:0% 2% 0% 0%;
}
.contTotal{
}
.rowcolNum{
color:blue;
}
</style>
<script type="text/javascript">

function getCar(no){
	location.href="/cally/testcar/"+no;
}
function send() {
	var getValue = $('#getCar').val();
	var f=document.forms[0];
 // 자바스트립트에서 표현식 사용 가능
 alert(getValue);
 $(".firstCar").attr("value")
var n=0;
for(var i=0; i<20; i++) {
	if(f.ch[i].checked==true)
		n++;
}
		if(n<1 || n>10) {
			alert("좌석은 1~10개 까지 가능 합니다.");
			return;
		}
	f.submit();
}
</script>
		<!--main content start-->
<section id="main-content">
<!-- 여기서부터 시작이라고 보면 됨 -->
<div class="contTotal"><!-- book_box_total -->
	<ol>
		<li><em class="no_box">1.</em><strong>원하시는 좌석을 선택하여 주십시오.</strong></li>
		<li><em class="no_box">2.</em>발매가 가능한 좌석을 선택하실 수 있습니다. </li>
		<li><em class="no_box">3.</em>원하시는 좌석을 선택 후 <strong>선택좌석 「예약하기」</strong> 버튼을 클릭하시면 예약이 완료됩니다.</li>
		<li><em class="no_box">4.</em>원하지 않은 좌석이 선택된 경우에는 좌석을 한번 더 클릭하시면 취소됩니다.</li>
	</ol>
	<form class="seatNum" action="view/tbooking/b_seats_action.jsp" method="post">
		<ul>
			<li class="firstCar" onclick="getCar(this.value)" value="1">1호차</li>
			<li class="secondCar" onclick="getCar(this.value)" value="2">2호차</li>
			<li class="thirdCar" onclick="getCar(this.value)" value="3">3호차</li>
			<li class="forthCar" onclick="getCar(this.value)" value="4">4호차</li>
			<li class="fifthCar" onclick="getCar(this.value)" value="5">5호차</li>
		</ul>
		<table class="seatTable">
		<tr height="30">
			<%
			int row=4, col=20;
				out.println("<td width='30'>&nbsp;</td>");
			    for(int i=1; i<=col; i++) {
			    	if(i!=1 && i%5==1)
			    		out.println("<td width='20'>&nbsp;</td>");
			    	out.println("<td class='rowcolNum' width='30' align='center'>"+i+"</td>");
			    }
			%>
			</tr>
			<%
			    String s;
			int a = 1;
			int b = 8;
				for(int i=1; i<=row; i++) {
					if(i!=1 && i%2==1){
					out.print("<tr height='25'></tr>");
					}
					out.println("<tr height='25'>");
					out.println("<td class='rowcolNum' align='center'>"+i+"</td>");
					for(int j=1; j<=col; j++) {
						if(j!=1 && j%5==1){
						out.println("<td width='20'>&nbsp;</td>");
						}
						if(i == a && j == b){
							out.print("<td width='30' align='center'>");
							s=i+":"+j;
							out.print("<img class='seatImg' src='img/callyPlus/redChair.jpg'>");
							out.println("</td>");
						}else{
						out.print("<td width='30' align='center'>");
						s=i+":"+j;
						out.print("<input type='checkbox' name='ch' value='"+
						    s+"'><img class='seatImg' src='img/callyPlus/greyChair.jpg'>");
						out.println("</td>");
						}
					}
					out.println("</tr>");
				}
			%>
		</table>
	</form>
	<table>
		<tr>
		      <td align="left">
		           <input type="button" value="좌석예약" onclick="send();">
		      </td>
		</tr>
	</table>
</div><!-- //book_box_total -->
<!-- 여기까지가 끝이라고 보면 됨 -->
</section>