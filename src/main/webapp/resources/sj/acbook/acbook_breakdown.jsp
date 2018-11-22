<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 가계부 서브메뉴 인클루즈 -->
<%@ include file="acbook_submenu.jspf"%>

<style>
.table tr td:first-child {
	text-align: center;
	width: 5%;
	white-space: nowrap;
}

.numeric {
	text-align: right;
}

.showback {
	display: none;
}

.form-control {
	display: inline-block !important;
}

</style>


<section id="main-content">
	<section class="wrapper">
		<h3>
			<i class="fa fa-angle-right"></i> 통장/카드 내역
		</h3>
		<!-- page start-->
		<div class="row mt">

			<aside class="col-lg-12 mt">
				<!-- 날짜패널 -->
				<div class="showback text-center" style="display: block;">

					<h2>나의 통장/카드</h2>



					<div class="" data-date-format="yyyy/mm/dd">
					<span> 기간 </span>
						<input type="text" class="form-control dpd1" name="from"
							style="width: 110px;"> <span> ~ </span>
						<input type="text" class="form-control dpd2" name="to"
							style="width: 110px;">
							<button class="btn btn-theme">조회</button>
					</div>

					

					

					<hr style="margin: 10px 0;">
					<div style="margin-bottom: 5px;"> <a href="/cally/acbook/accountset">
							<button class="btn btn-theme btn-xs">통장 관리</button>
					</a> <a href="/cally/acbook/cardset">
							<button class="btn btn-theme02 btn-xs">카드 관리</button>
					</a>


					</div>
					
					<button class="btn mycard btn-default">우리입출금통장 <i class="fa fa-plus-circle"></i>
					</button>
					<button class="btn mycard btn-default">적금통장 <i class="fa fa-plus-circle"></i>
					</button>
					<button class="btn mycard btn-default">신한체크카드 <i class="fa fa-plus-circle"></i>
					</button>
					<button class="btn mycard btn-default">현대원카드 <i class="fa fa-plus-circle"></i>
					</button>

					<div style="height: 10px;"></div>


				</div>
				<!-- 날짜패널 끝 -->
				<!-- 오늘의 수입패널 -->

				<div class="showback" id="우리입출금통장">
					<h4>
						<i class="fa fa-angle-right"></i> 우리입출금통장
					</h4>
					<table
						class="table table-bordered table-hover table-striped table-condensed">
						<tr>

							<th></th>
							<th>내역</th>
							<th>금액</th>
							<th>분류</th>
						</tr>
						<tr>

							<td>입금</td>
							<td>용돈</td>
							<td class="numeric">30000</td>

							<td>부수입>용돈</td>

						</tr>
						<tr>

							<td>입금</td>
							<td>용돈</td>
							<td class="numeric">30000</td>

							<td>부수입>용돈</td>

						</tr>
						<tr>

							<td>지출</td>
							<td>간식</td>
							<td class="numeric">3000</td>

							<td>식비>간식</td>

						</tr>


					</table>

				</div>
				<div class="showback" id="적금통장">
					<h4>
						<i class="fa fa-angle-right"></i> 적금통장
					</h4>
					<table
						class="table table-bordered table-hover table-striped table-condensed">
						<tr>

							<th></th>
							<th>내역</th>
							<th>금액</th>
							<th>분류</th>
						</tr>
						<tr>

							<td>입금</td>
							<td>용돈</td>
							<td class="numeric">30000</td>

							<td>부수입>용돈</td>

						</tr>
						<tr>

							<td>입금</td>
							<td>용돈</td>
							<td class="numeric">30000</td>

							<td>부수입>용돈</td>

						</tr>
						<tr>

							<td>지출</td>
							<td>간식</td>
							<td class="numeric">3000</td>

							<td>식비>간식</td>

						</tr>


					</table>

				</div>


				<div class="showback" id="신한체크카드">
					<h4>
						<i class="fa fa-angle-right"></i> 신한체크카드
					</h4>
					<table
						class="table table-bordered table-hover table-striped table-condensed">
						<tr>

							<th></th>
							<th>내역</th>
							<th>금액</th>
							<th>분류</th>
						</tr>
						<tr>

							<td>입금</td>
							<td>용돈</td>
							<td class="numeric">30000</td>

							<td>부수입>용돈</td>

						</tr>
						<tr>

							<td>입금</td>
							<td>용돈</td>
							<td class="numeric">30000</td>

							<td>부수입>용돈</td>

						</tr>
						<tr>

							<td>지출</td>
							<td>간식</td>
							<td class="numeric">3000</td>

							<td>식비>간식</td>

						</tr>


					</table>

				</div>


				<!-- 오늘의 지출패널 -->
				<div class="showback" id="현대원카드">
					<h4>
						<i class="fa fa-angle-right"></i> 현대원카드
					</h4>
					<table
						class="table table-bordered table-hover table-striped table-condensed">
						<tr>

							<th></th>
							<th>내역</th>
							<th>금액</th>
							<th>분류</th>
						</tr>
						<tr>

							<td>입금</td>
							<td>용돈</td>
							<td class="numeric">30000</td>

							<td>부수입>용돈</td>

						</tr>
						<tr>

							<td>입금</td>
							<td>용돈</td>
							<td class="numeric">30000</td>

							<td>부수입>용돈</td>

						</tr>
						<tr>

							<td>지출</td>
							<td>간식</td>
							<td class="numeric">3000</td>

							<td>식비>간식</td>

						</tr>


					</table>

				</div>
			</aside>

		</div>
		<!-- page end-->
	</section>
	<!-- /wrapper -->
</section>
<!-- /MAIN CONTENT -->

<!-- 가계부 자바스크립트 인클루드 -->
<%@ include file="acbook_js.jspf"%>
<script>
	$(".mycard").click(function() {
		if ($(this).hasClass("btn-default")) {
			$(this).removeClass("btn-default");
			$(this).addClass("btn-danger");
			var text = $(this).text().split(" <i class=");
			$(this).html(text[0] + " <i class='fa fa-times-circle'></i>");
			var id = "#" + text;
			$(id).css('display', 'block');
		} else {
			$(this).removeClass("btn-danger");
			$(this).addClass("btn-default");
			var text = $(this).text().split(" <i class=");
			$(this).html(text[0] + " <i class='fa fa-plus-circle'></i>");
			var id = "#" + text;
			$(id).css('display', 'none');
		}

	});
</script>