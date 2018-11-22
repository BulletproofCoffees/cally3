<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%-- <style type="text/css">
.button {
    background-color: #f5f5f5;
   border-color: #fafafa;
}
</style>
<div class="accordionsj ">
	<div class="accordion-group " id="accordion-group-2">
<div class="col-md-6">
   <span class="check">
   <input type="checkbox" class="checked" name="a1" onclick="Chk_Checked()"></span> <a href="${Ingredient}?food=">고기</a>
</div>
<div class="col-md-6">000Cal</div>
<div class="col-md-12">
   <article class="accordion-group__accordion">
      <header class="accordion-group__accordion-head">         
         <button type="button" class="accordion-group__accordion-btn button"><b id ='view'>100</b><b id ='view2'>g</b>당</button>         
      </header>
      <div class="accordion-group__accordion-panel">
         <!-- ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ -->
         <div class="col-md-5">
            <input type="text" class="form-control" value="100" id='content'>
         </div>
         <div class="col-md-5">
            <select class="form-control" id='content2'>
               <option id='Choice' value='g'>g</option>
               <option id='Choice' value='인분'>인분(250g)</option>
               <option id='Choice' value='데이터베이스에서'>데이터베이스에서 불러오자</option>
               <option id='Choice' >4</option>
               <option id='Choice' >5</option>
            </select>
         </div>
         <!-- ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ -->
      </div>
   </article>
</div>
</div>
</div>


 --%>
<!-- <div class="col-md-12">
 <div class="faq-item mb-2">
          <h4 class="faq-link has-arrow"><b id ='view'>100</b><b id ='view2'>g</b>당</h4>
          <div class="faq-answer text-muted">
             <div class="col-md-6">
            <input type="text" class="form-control" value="100" id='content'>
         </div>
         <div class="col-md-6">
            <select class="form-control" id='content2'>
               <option id='Choice' value='g'>g</option>
               <option id='Choice' value='인분'>인분(250g)</option>
               <option id='Choice' value='데이터베이스에서'>데이터베이스에서 불러오자</option>
               <option id='Choice' >4</option>
               <option id='Choice' >5</option>
            </select>
         </div>
          </div>
        </div>
</div>
<script>
$('#content').keyup(function () {   
      var txtBox = document.getElementById("content");   
      var lines = txtBox.value;
          var resultString  = "";   
          for (var i = 0; i < lines.length; i++) {
            resultString += lines[i];
         }    
      var blk2 = document.getElementById("view");
      blk2.innerHTML = resultString;
   
});

   $('#content2').change(function() {     
       var choice = $(this).children("option:selected").text();   
      var blk = document.getElementById("view2");
      blk.innerHTML = choice; 
   
       /*$( "#view2" ).append( choice ); *//* 계속추가  */
   
   });
</script>

 -->

<section id="main-content">
	<section class="wrapper">
		<div class="col-lg-12 main-chart js_hame ">
<table id="todo " class="table table-hover custom-check Gram" >
										<tbody class="result">
										<!-- 그램변경------------------------------------------  -->
		<tr>
			<td><div class="col-md-4">
					<span class="check"><input type="checkbox" class="checked"
						name="a1" onclick="Chk_Checked()"></span> <a
						href="${Ingredient}?food=">
						$(DESC_KOR[i]).text()+'('+$(item.find("ANIMAL_PLANT")[i]).text()+')'
					</a>
				</div>
				<div class="col-md-3 col-md-offset-6">
					$(item.find("NUTR_CONT1")[i]).text() Cal</div>
				<div class="col-md-12">
					<h4 >
						<b class="view"> $(item.find("SERVING_WT")[i]).text()</b><b
							class="view2">g</b>당
					</h4>
					<div class="col-md-6">
						<input type="text" class="form-control content" value="100" id="content">
					</div>
					<div class="col-md-6">
						<select class="form-control2 content2" id="content2"><option
								id="Choice" value="g">g</option>
							<option id="Choice" value="인분">인분(250g)</option></select>
					</div>
				</div></td>
		</tr>
		<%-- <%@ include file="search_piece/spread.jsp"%>  --%>

							<!-- ------------------------------------------  -->
										</tbody>
									</table>
<div id = "test"></div>
		</div>
	</section>
</section>
<script>
  
   $("table.Gram tr td div ").keyup(function(){ 	   
	   $(this).find('h4 b.view').empty(); 
	   $(this).find('h4 b.view').append($(this).find('input').val());
	   
	   var a =  parseInt($("b.view").text());
	   var gram = $("b.view2").text();
	 
	   if(gram == 'g'){
		   var gram = 1;
		   $('#test').empty(); 
		   $('#test').append(a*gram);
	   }else {
		   
		
	}
	  
	   
});
   
   $("table.Gram tr td div ").change(function() {
	   $(this).find('h4 b.view2').empty(); 
	   $(this).find('h4 b.view2').append($(this).find("option:selected").text()); 
	 
   });  
   
   
  
</script>		
