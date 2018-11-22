<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../css/tbooking.css">
<style>
.panel, .startDateList{
margin:0%;
}
.mapviewer li{
display:inline-block;
}
.panel-heading, .panel-body{
padding:0% 0% 0% 0%;
}
.panel-body ul li{
border-right:1px solid grey;
display:inline-block;
}
.main-chart{
width:80%;
margin:0% 5% 0% 10%;
}
.book_box_detail{
display:none;
}
.book_chx01{
paading:0px 0px;
}
.table{
margin:0px;
padding:0px 0px;
}
.info,  td{
border:1px solid none;
text-align:center;
}
.imgSp{
width:30%;
}
.mapviewdivul{
padding:2% 0% 0% 2%;
}
.mapviewdivul li{
padding:0% 2% 0% 2%;
}
#stationImg{
 width:100%;
}
#imgSp img{
position:static;
}
#stationlist li{
font-size:12px;
background-color:white;
border:1px solid grey;
box-shadow:1px 1px 1px grey;
position:absolute;
}
footer{
margin:5% 0% 0% 0%;
}
</style>
<script>
<%@ include file="/view/tbooking/t_stationcode.jsp" %>
$('#stationlist').append(gog);

function selectStation(ammm){
	$.ajax({
			url : 't_station',
			data : {
				"stInfoList" : ammm
			}, 
			type : 'GET',
			success : function(data) {
				$(".shadow").empty();
				$("#stationName").append("경부선 -" + $(data).find('input[id=st_name]').val() + "역")
				$("#addr").append($(data).find('input[id=st_address]').val());
				$("#tel").append($(data).find('input[id=st_tel]').val());
			}
		});

	}
	function mapobj(a) {
		$(".shadow, .mapviewdiv, #imgSp, #stationlist").empty();
		if (a == '1') {
			$(".mapviewdiv")
					.append(
							"<ul class='mapviewdivul'><li onclick='ktxmapview(this.value)' value='1'>경부선</li><li onclick='ktxmapview(this.value)' value='2'>호남선</li><li onclick='ktxmapview(this.value)' value='3'>경전선</li><li onclick='ktxmapview(this.value)' value='4'>전라선</li><li onclick='ktxmapview(this.value)' value='5'>강릉선</li></ul>")
			$("#stationName").append("경부선 -역코드입력")
			$('#stationlist').append(gog)
		} else if (a == '2') {
			$(".mapviewdiv")
					.append(
							"<ul class='mapviewdivul'><li onclick='mainmapview(this.value)' value='1'>수도권</li><li onclick='mainmapview(this.value)' value='2'>충청권</li><li onclick='mainmapview(this.value)' value='3'>강원권</li><li onclick='mainmapview(this.value)' value='4'>경상권</li><li onclick='mainmapview(this.value)' value='5'>전라권</li></ul>")
			$("#imgSp")
					.append(
							"<img class='img-rounded' src='img/callyPlus/map_main01sudo.png' />")
			$("#stationName").append("수도권 -역코드입력")
		}
	}
	function ktxmapview(a) {
		$(".shadow").empty();
		$("#imgSp").empty();
		if (a == '1' || a == null) {
			$("#imgSp")
					.append(
							"<img class='img-rounded' src='img/callyPlus/map_ktx01kyungbu.png' />")
			$("#stationName").append("경부선 -역코드입력")
			$('#stationlist').append(gog)
		} else if (a == '2') {
			$("#imgSp")
					.append(
							"<img class='img-rounded' src='img/callyPlus/map_ktx02honam.png' />")
			$("#stationName").append("호남선 -역코드입력")
			$("#stationlist").empty();
		} else if (a == '3') {
			$("#imgSp")
					.append(
							"<img class='img-rounded' src='img/callyPlus/map_ktx03gyungjeon.png' />")
			$("#stationName").append("경전선 -역코드입력")
			$("#stationlist").empty();
		} else if (a == '4') {
			$("#imgSp")
					.append(
							"<img class='img-rounded' src='img/callyPlus/map_ktx04jeolla.png' />")
			$("#stationName").append("전라선 -역코드입력")
			$("#stationlist").empty();
		} else if (a == '5') {
			$("#imgSp")
					.append(
							"<img class='img-rounded' src='img/callyPlus/map_ktx05gangneung.png' />")
			$("#stationName").append("강릉선 -역코드입력")
			$("#stationlist").empty();
		}
	}
	function mainmapview(a) {
		$(".shadow").empty();
		$("#imgSp").empty();
		if (a == '1') {
			$("#imgSp")
					.append(
							"<img class='img-rounded' src='img/callyPlus/map_main01sudo.png' />")
			$("#stationName").append("수도권 -역코드입력")
		} else if (a == '2') {
			$("#imgSp")
					.append(
							"<img class='img-rounded' src='img/callyPlus/map_main02chungcheong.png' />")
			$("#stationName").append("충청권 -역코드입력")
		} else if (a == '3') {
			$("#imgSp")
					.append(
							"<img class='img-rounded' src='img/callyPlus/map_main03gangwon.png' />")
			$("#stationName").append("강원권 -역코드입력")
		} else if (a == '4') {
			$("#imgSp")
					.append(
							"<img class='img-rounded' src='img/callyPlus/map_main04gyeongsang.png' />")
			$("#stationName").append("경상권 -역코드입력")
		} else if (a == '5') {
			$("#imgSp")
					.append(
							"<img class='img-rounded' src='img/callyPlus/map_main05jeolla.png' />")
			$("#stationName").append("전라권 -역코드입력")
		}
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
<input type="hidden" id="st_name" value=${stInfoStation.ST_NAME }> 
<input type="hidden" id="st_tel" value=${stInfoStation.ST_TEL }>
<input type="hidden" id="st_img" value=${stInfoStation.ST_IMG }>
<input type="hidden" id="st_address" value=${stInfoStation.ST_ADDRESS }>

<div class="contTotal"><!-- book_box_total -->
<%-- <c:forEach var="stInfo" items="${stationInfo}">
 	${stInfo}
</c:forEach> --%>
<h2>기차역</h2> 
	<div class="panel panel-body">
		<ul class="mapviewdivul">
			<li onclick="mapobj(this.value), ktxmapview(this.value)" value="1" >KTX</li>
			<li onclick="mapobj(this.value)" value="2">일반열차</li>		
		</ul>
	</div>
	<div class="ktxTrain panel panel-info">
		<div class="mapviewdiv panel-body">
			<ul class='mapviewdivul'>
				<li onclick='ktxmapview(this.value)' value='1'>경부선</li>
				<li onclick='ktxmapview(this.value)' value='2'>호남선</li>
				<li onclick='ktxmapview(this.value)' value='3'>경전선</li>
				<li onclick='ktxmapview(this.value)' value='4'>전라선</li>
				<li onclick='ktxmapview(this.value)' value='5'>강릉선</li>
			</ul>
		</div>
	</div>
	<div>
		<ul class="mapviewer">
			<li class="col-sm-6">
				<div id="imgSp"><img class='img-rounded stationCodeup' src='img/callyPlus/map_ktx01kyungbu.png'/>
				</div>
					<ul id="stationlist">
					</ul>
			</li>
			<li id="mapviewer" class="col-sm-6">
				<div class="box_rol"><!-- 기차역 요약정보 영역 -->
					<h3><span id="stationName" class="shadow">경부선 -서울역</span></h3>
					<p><img id="stationImg" class="shadow" src="http://info.korail.com/upload/station/basic/d793880d5ba70feb1c2e259d1a373add.jpg" alt=""></p>
					<table class="table" summary="위치 및 안내정보, 담당자 정보">
						<colgroup><col width="30%"><col width="*"></colgroup>
						<tbody>
						    <tr>
						        <th scope="row">위치</th>
						        <td><span  class="shadow" id="addr">서울시 용산구 한강대로 405</span></td>
						    </tr>
						    <tr>
						        <th scope="row">연락처</th>
						        <td><span  class="shadow" id="tel">1544-7788</span></td>
						    </tr>
						</tbody>
					</table>
					<p>
						<a href="#" onclick="return MoveDeteilView()"><img src="/images/btn_train_view.gif" alt="기차역상세정보"></a>&nbsp;&nbsp;
					</p>
				</div><!-- //기차역 요약정보 영역 -->
			</li>
		</ul>
	</div>

	<!-- <img class="img-rounded" width="100%" height="30%" src="img/callyPlus/.jpg" /> -->
</div><!-- //book_box_total -->
<!-- 여기까지가 끝이라고 보면 됨 -->
				</div>
			</div>
		</div>
	</section>
</section>
<%@ include file="js.jspf" %>