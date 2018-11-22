<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="../css/tbooking.css">
<style>
.main-chart{
width:80%;
margin:0% 5% 0% 10%;
}
</style>
<script type="text/javascript">
String.prototype.trim=function(){
	var p=/(^\s*)|(\s*$)/g;
	return this.replace(p,"");
}
function send() {
	var f=document.forms[0];
	var row=f.row.value;
	if(! row) {
		alert("행수를 입력 하세요!!!");
		f.row.focus();
		return;
	}
	if(! /^[0-9]*$/g.test(row)){
		alert("행은 숫자만 가능합니다.");
		f.row.focus();
		return;
	}
	if(parseInt(row)<5){
		alert("행은 5이상만 입력 가능합니다.");
		f.row.focus();
		return;
	}
	f.row.value=row; // 앞뒤 공백 제가 한 값을 다시 대입해줌.
var col=f.col.value;
	if(! col) {
		alert("열수를 입력 하세요!!!");
		f.col.focus();
		return;
	}
if(! /^[0-9]*$/g.test(col)){
		alert("열은 숫자만 가능합니다.");
		f.col.focus();
		return;
	}
	if(parseInt(col)<5){
		alert("열은 5이상만 입력 가능합니다.");
		f.col.focus();
		return;
	}
	f.col.value=col;
	f.submit();
}
</script>
<%@ include file="/view/tbooking/sidebar.jsp" %>
		<!--main content start-->
<section id="main-content">
	<section class="wrapper">
		<div class="row">
			<div class="col-lg-9 main-chart">
				<div id="container">
<!-- 여기서부터 시작이라고 보면 됨 -->
<div class="contTotal"><!-- book_box_total -->
<form action="b_t_form.jsp" method="post">
행수 : <input type="text" name="row"><br/>
열수 : <input type="text" name="col"><br/>
<input type="button" value="보내기" onclick="send();"><br/>

</form>

</div><!-- //book_box_total -->
<!-- 여기까지가 끝이라고 보면 됨 -->
				</div>
			</div>
		</div>
	</section>
</section>
    <%@ include file="js.jspf" %>