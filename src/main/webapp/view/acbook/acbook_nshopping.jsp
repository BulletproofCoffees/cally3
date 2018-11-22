<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
            <!-- 가계부 서브메뉴 인클루즈 -->
    <%@ include file="acbook_submenu.jspf" %>
    <style>
    #nresultbtn {
    display : none;
    }
    </style>
    
<section id="main-content">
      <section class="wrapper">
        <h3><i class="fa fa-angle-right"></i> 가격정보 검색</h3>
        <!-- page start-->
        <div class="row mt">
        
          <aside class="col-lg-12 mt">
           <section class="panel">
              <div class="panel-body">
              <select name="sort">
              <option value="sim">유사도순</option>
              <option value="date">최근등록순</option>
              <option value="asc">낮은가격순</option>
              <option value="dsc">높은가격순</option>
              </select>
              <input type="text" name="query" value="${query}">
              <input type="hidden" name="start" value="1">
              <button class="btn btn-theme03 shopSearch"><i class="fa fa-search"></i> 검색</button>
              </div>
              </section>
          
          
            <section class="panel">
              <div class="panel-body">
              
              [ <strong>${query}</strong> ] 검색 결과입니다 (총 ${total} 건)
              <div id="nresult"></div>

              <button class="btn btn-theme03 btn-block" id="nresultbtn">더 보기</button>

              </div>
            </section>
          </aside>
       
        </div>
        <!-- page end-->
      </section>
      <!-- /wrapper -->
    </section>
    <!-- /MAIN CONTENT -->
    
      <!-- 가계부 자바스크립트 인클루드 -->
    <%@ include file="acbook_js.jspf" %>
    <script>
    $(".shopSearch").click(function(){
    	var sort = $("select[name='sort']").val();
    	var query = $("input[name='query']").val();
    	var start = $("input[name='start']").val();
    	$("#nresultbtn").css('display','block');
    	$.ajax({
      		url : 'https://openapi.naver.com/v1/search/shop',
      		type : 'GET',
      		headers: {'X-Naver-Client-Id':LRmqlOB4j8pjTXGBQuel, 'X-Naver-Client-Secret':OyTtneLaAf},
      		dataType : 'json',
      		data : {'sort' : sort,
      			'display' : 9,
      				'query' : query,
      				'start' : start},
      		success : function(Data){
      		 var obj = $(Data);
      		 alert(obj);
      		 alert("??");
      		},
      		error : function(){
      			alert("json실패");
      		}
      	});
    	alert("ajax후");
    });
    
    function naverAjax(){
    	
    }
    
    $("#nresultbtn").click(function(){
    	var start = $("input[name='start']").val();
    	$("input[name='start']").val(parseInt(start) + 9);
    });
    </script>