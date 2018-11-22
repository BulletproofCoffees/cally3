<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="../css/tbooking.css">
<style>
*{
padding:0 0 0 0;
margin:0%;
}
.main-chart{
width:80%;
margin:0% 5% 0% 10%;
}
.contTotal{
padding:0px 10%;
}
.startDateList li{
display:inline-block;
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
.h4title{
font-size:1em;
}
.calPopPage{
display:none;
width:300px;
height:200px;
}
.book_box_detail{
display:none;
}
.contTotal{
padding:0px 10%;
}
.tab ul li , .step_tick ul li{
display:inline-block;
}
.smallcon{
vertical-align:middle;
width:30px;
height:30px;
}
</style>
<script>
function search(){
	if ($(".book_chx02").is(":hidden")) { 
		$(".book_chx02").slideDown("slow"); 
	} else { 
		$(".book_chx02").hide(); 
	}
}
</script>
<%@ include file="/view/tbooking/sidebar.jsp" %>
<!-- **********************************************************************************************************************************************************
    MAIN CONTENT
    *********************************************************************************************************************************************************** -->
<!--main content start-->
<section id="main-content">
	<section class="wrapper">
		<div class="row">
			<div class="col-lg-9 main-chart">
				<div id="container">
<!-- 여기서부터 시작이라고 보면 됨 -->
<div class="contTotal"><!-- book_box_total -->
        <div class="row mt">
          <div class="col-lg-12">
            <div class="content-panel">
              <h4><i class="fa fa-angle-right"></i> Responsive Table</h4>
              <section id="unseen">
              
                <table class="table table-bordered table-striped table-condensed">
                  <thead>
                    <tr>
                      <th>Code</th>
                      <th>Company</th>
                      <th class="numeric">Price</th>
                      <th class="numeric">Change</th>
                      <th class="numeric">Change %</th>
                      <th class="numeric">Open</th>
                      <th class="numeric">High</th>
                      <th class="numeric">Low</th>
                      <th class="numeric">Volume</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td><span class="glyphicon glyphicon-play"></span>인원정보</td>
                      <td>어른</td>
                      <td>$1.38</td>
                      <td class="numeric">-0.01</td>
                      <td class="numeric">-0.36%</td>
                      <td class="numeric">$1.39</td>
                      <td class="numeric">$1.39</td>
                      <td class="numeric">$1.38</td>
                      <td class="numeric">9,395</td>
                    </tr>
                    <tr>
                      <td>좌석선택</td>
                      <td>ARDENT LEISURE GROUP</td>
                      <td class="numeric">$1.15</td>
                      <td class="numeric"> +0.02</td>
                      <td class="numeric">1.32%</td>
                      <td class="numeric">$1.14</td>
                      <td class="numeric">$1.15</td>
                      <td class="numeric">$1.13</td>
                      <td class="numeric">56,431</td>
                    </tr>
                    <tr>
                      <td>AAX</td>
                      <td>AUSENCO LIMITED</td>
                      <td class="numeric">$4.00</td>
                      <td class="numeric">-0.04</td>
                      <td class="numeric">-0.99%</td>
                      <td class="numeric">$4.01</td>
                      <td class="numeric">$4.05</td>
                      <td class="numeric">$4.00</td>
                      <td class="numeric">90,641</td>
                    </tr>
                    <tr>
                      <td>ABC</td>
                      <td>ADELAIDE BRIGHTON LIMITED</td>
                      <td class="numeric">$3.00</td>
                      <td class="numeric"> +0.06</td>
                      <td class="numeric">2.04%</td>
                      <td class="numeric">$2.98</td>
                      <td class="numeric">$3.00</td>
                      <td class="numeric">$2.96</td>
                      <td class="numeric">862,518</td>
                    </tr>
                    <tr>
                      <td>ABP</td>
                      <td>ABACUS PROPERTY GROUP</td>
                      <td class="numeric">$1.91</td>
                      <td class="numeric">0.00</td>
                      <td class="numeric">0.00%</td>
                      <td class="numeric">$1.92</td>
                      <td class="numeric">$1.93</td>
                      <td class="numeric">$1.90</td>
                      <td class="numeric">595,701</td>
                    </tr>
                    <tr>
                      <td>ABY</td>
                      <td>ADITYA BIRLA MINERALS LIMITED</td>
                      <td class="numeric">$0.77</td>
                      <td class="numeric"> +0.02</td>
                      <td class="numeric">2.00%</td>
                      <td class="numeric">$0.76</td>
                      <td class="numeric">$0.77</td>
                      <td class="numeric">$0.76</td>
                      <td class="numeric">54,567</td>
                    </tr>
                    <tr>
                      <td>ACR</td>
                      <td>ACRUX LIMITED</td>
                      <td class="numeric">$3.71</td>
                      <td class="numeric"> +0.01</td>
                      <td class="numeric">0.14%</td>
                      <td class="numeric">$3.70</td>
                      <td class="numeric">$3.72</td>
                      <td class="numeric">$3.68</td>
                      <td class="numeric">191,373</td>
                    </tr>
                    <tr>
                      <td>ADU</td>
                      <td>ADAMUS RESOURCES LIMITED</td>
                      <td class="numeric">$0.72</td>
                      <td class="numeric">0.00</td>
                      <td class="numeric">0.00%</td>
                      <td class="numeric">$0.73</td>
                      <td class="numeric">$0.74</td>
                      <td class="numeric">$0.72</td>
                      <td class="numeric">8,602,291</td>
                    </tr>
                    <tr>
                      <td>AGG</td>
                      <td>ANGLOGOLD ASHANTI LIMITED</td>
                      <td class="numeric">$7.81</td>
                      <td class="numeric">-0.22</td>
                      <td class="numeric">-2.74%</td>
                      <td class="numeric">$7.82</td>
                      <td class="numeric">$7.82</td>
                      <td class="numeric">$7.81</td>
                      <td class="numeric">148</td>
                    </tr>
                    <tr>
                      <td>AGK</td>
                      <td>AGL ENERGY LIMITED</td>
                      <td class="numeric">$13.82</td>
                      <td class="numeric"> +0.02</td>
                      <td class="numeric">0.14%</td>
                      <td class="numeric">$13.83</td>
                      <td class="numeric">$13.83</td>
                      <td class="numeric">$13.67</td>
                      <td class="numeric">846,403</td>
                    </tr>
                    <tr>
                      <td>AGO</td>
                      <td>ATLAS IRON LIMITED</td>
                      <td class="numeric">$3.17</td>
                      <td class="numeric">-0.02</td>
                      <td class="numeric">-0.47%</td>
                      <td class="numeric">$3.11</td>
                      <td class="numeric">$3.22</td>
                      <td class="numeric">$3.10</td>
                      <td class="numeric">5,416,303</td>
                    </tr>
                  </tbody>
                </table>
              </section>
            </div>
            <!-- /content-panel -->
          </div>
          <!-- /col-lg-4 -->
        </div>
        <!-- /row -->
	<div class="search">	<!-- 조회하기버튼 -->
		<button onclick="search()" class="btn btn-info">조회하기</button>
	</div>
</div><!-- //book_box_total -->
<!-- 여기까지가 끝이라고 보면 됨 -->
				</div>
			</div>
		</div>
	</section>
</section>