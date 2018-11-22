<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>


            <!-- 음식추가 -->
            <div class="col-md-6">

               <!-- 검색탭 -->
               
               <div class="input-group bootstrap-timepicker">
                  <input type="text" class="form-control timepicker-default" id="keyword4">
                  <span class="input-group-btn">
                     <button class="btn btn-theme04" onclick="search4()">검색</button>
                  </span>
               </div>
            
               <!--/검색탭  -->
 
               <div class="col-md-12" style="overflow-y: scroll;height: 350px;top: 15px;">
                  <div class="white-panel">
                     <div class="custom-check goleft mt">

                        <!--검색결과------------------------------------------------------------------- -->
                        <form name="myform">
                        <table id="todo " class="table table-hover custom-check Gram4" >
                              <tbody class="result4"> </tbody>
                           </table>
                        </form>
                        <!--/검색결과------------------------------------------------------------------- -->

                     </div>
                  </div>
               </div>
            </div>
<!-- 저장-------------------------------------------------------------------------------- -->
   <form action="${pageContext.request.contextPath}/sj/counter/" method="post" class="sjurl">
               <div class="col-md-6" style="overflow-y: scroll; height: 400px;">
                  <div class="col-md-12">
                     <div class="white-panel">
                        <div class="custom-check goleft mt">
                           <table id="todo" class="table table-hover custom-check">
                              <tbody id="div_List4">
                              </tbody>
                           </table>
                        </div>
                     </div>
                  </div>
               </div>
               <input type="hidden" name="dayurl"  class="dayurl" readonly><!-- 저장날짜  -->
               <input type="hidden" name="the_code" value="4"  readonly><!--아점저코드  -->
               <input type="hidden" name="id" value="${sessionScope.loginUser.mem_id}"  readonly><!-- 아이디 -->  
                    <ul class="nav pull-right top-menu">
         <li><button class="btn btn-theme" style="margin-top: 15px;">식단추가</button></li>
        </ul>
   </form>
 <!-- /저장-------------------------------------------------------------------------------- -->
               <!--/ 음식추가 -->            
   
<!-- 검색 -->
<script>
   function search4() {
      $(".result4").empty();
      var desc_kors = $('#keyword4').val();
    
$.get("${pageContext.request.contextPath}/sj/foodsdb", {
                     desc_kor : desc_kors,
                     }, function(data) {
                        var obj = data;
                        var jq_obj = $(obj);
                        console.log(obj);
                        
                         if( obj == '' ){
                        $(".result4").append("<p>db 검색 결과 없음</p>");
                        
/*--api---------------------------------------------------------------------------------------------  */                        
      $.get("${pageContext.request.contextPath}/sj/xml", {
         desc_kor : desc_kors,
      }, function(data) {
         var obj = data;

         var jq_obj = $(obj);
         var item = jq_obj.find("item");
         var DESC_KOR = item.find("DESC_KOR");

         console.log(obj);
         /* console.log("items의 개수 : " + items.length); */
         console.log("item의 개수 : " + item.length);
         console.log("DESC_KOR의 개수 : " + DESC_KOR.length);
         console.log("DESC_KOR [0] : " + $(DESC_KOR[0]).text());

         if (item.length == 0) {            
            
            $(".result4").append("<p>검색어가 없습니다!</p>");
            $(".result4").append('<a href="${pageContext.request.contextPath}/sj/Ingredient_up">새등록하기!</a>');
            /* alert('식품데이터 없음'); */
         
         } else {
            for (var i = 0; i < item.length; i++) {
               $(".result4").append(
                         '<tr><td><div class="col-md-6"><span class="check"><input type="checkbox" class="checked"></span> <a href="${Ingredient}?food=">'
                     +$(DESC_KOR[i]).text()+'('+$(item.find("ANIMAL_PLANT")[i]).text()+')'
                      +'</a></div><div class="col-md-6 "><b class = "gram">'
                      +$(item.find("SERVING_WT")[i]).text()
                      +'</b>당<b class = "cal">'
                      +$(item.find("NUTR_CONT1")[i]).text() 
                      +'</b><b>Cal</b></div><div class="col-md-12"><h4 ><div class="col-md-6"><input type="number" class="form-control content" value="1" id="content"></div>'
                     +'<b class="view3 col-md-offset-1">'
                     +$(item.find("NUTR_CONT1")[i]).text()
                     +'</b><b>Cal</b></h4>'
                     +'</div></td><td>'
                     +'<input type="hidden" value="0" id="F_NO" readonly>'
                     +'<input type="hidden" value="'+$(DESC_KOR[i]).text()+'" id="DESC_KOR" readonly>'
                     +'<input type="hidden" value="'+$(item.find("SERVING_WT")[i]).text()+'" id="SERVING_WT" readonly>'
                     +'<input type="hidden" value="'+$(item.find("NUTR_CONT1")[i]).text()+'" id="NUTR_CONT1" readonly>'
                     +'<input type="hidden" value="'+$(item.find("NUTR_CONT2")[i]).text()+'" id="NUTR_CONT2" readonly>'
                     +'<input type="hidden" value="'+$(item.find("NUTR_CONT3")[i]).text()+'" id="NUTR_CONT3" readonly>'
                     +'<input type="hidden" value="'+$(item.find("NUTR_CONT4")[i]).text()+'" id="NUTR_CONT4" readonly>'
                     +'<input type="hidden" value="'+$(item.find("NUTR_CONT5")[i]).text()+'" id="NUTR_CONT5" readonly>'
                     +'<input type="hidden" value="'+$(item.find("NUTR_CONT6")[i]).text()+'" id="NUTR_CONT6" readonly>'
                     +'<input type="hidden" value="'+$(item.find("NUTR_CONT7")[i]).text()+'" id="NUTR_CONT7" readonly>'
                     +'<input type="hidden" value="'+$(item.find("NUTR_CONT8")[i]).text()+'" id="NUTR_CONT8" readonly>'
                     +'<input type="hidden" value="'+$(item.find("NUTR_CONT9")[i]).text()+'" id="NUTR_CONT9" readonly>'
                     +'<input type="hidden" value="'+$(item.find("ANIMAL_PLANT")[i]).text()+'" id="ANIMAL_PLANT" readonly>'
                     +'</td></tr>'
                     
                     );
                                          }
                                       }
                                    });
/*--api---------------------------------------------------------------------------------------------  */
                     } else {
                        $(".result4").append("<p>db 검색 결과 있음</p>");
                        $(".result4").append('<a href="${pageContext.request.contextPath}/sj/Ingredient_up">새등록하기!</a>');
                        $(".result4").append(obj);
                     }
                  });
   }
</script>

<!-- 그램계산 -->
<script>
/* 동적생성 이벤트 */
$(document).on("keyup","table.Gram4 tr",function(){  
    var cal = $(this).find('b.cal').html();
   
   $(" td div").keyup(function(){    
         $(this).find("h4 b.view3").empty(); 
         $(this).find("h4 b.view3").append(Number(cal)*Number($(this).find('input').val()));         
   });
    
});    
    $(document).on("change","table.Gram4 tr",function(){
    	 var thiss = $(this); 
         var name =  $(this).find('a').html();   
         var cal =  $(this).find(".view3").text();
         
         var AMOUNT =  $(this).find('input#content').val(); //수량
         var F_NO =  $(this).find("td input#F_NO").val(); //식품넘버
         var DESC_KOR =  $(this).find("td input#DESC_KOR").val(); //식품이름
         var SERVING_WT =  $(this).find("td input#SERVING_WT").val(); //일회제공량
         var NUTR_CONT1 =  $(this).find("td input#NUTR_CONT1").val(); //칼로리
         var NUTR_CONT2 =  $(this).find("td input#NUTR_CONT2").val(); //
         var NUTR_CONT3 =  $(this).find("td input#NUTR_CONT3").val(); //
         var NUTR_CONT4 =  $(this).find("td input#NUTR_CONT4").val(); //
         var NUTR_CONT5 =  $(this).find("td input#NUTR_CONT5").val(); //
         var NUTR_CONT6 =  $(this).find("td input#NUTR_CONT6").val(); //
         var NUTR_CONT7 =  $(this).find("td input#NUTR_CONT7").val(); //
         var NUTR_CONT8 =  $(this).find("td input#NUTR_CONT8").val(); //
         var NUTR_CONT9 =  $(this).find("td input#NUTR_CONT9").val(); //
         var ANIMAL_PLANT =  $(this).find("td input#ANIMAL_PLANT").val(); //
        
         
         
           if ($(".checked").is(':checked')) {
              $("#div_List4").prepend(
                    '<tr><td><div class="col-lg-8">'
                    +name
                    +'</div><div class="col-lg-4" style="padding-left: 0px; padding-right: 0px;"><a>'
                    +cal
                    +'</a>Cal<button class="close" aria-text="true" data-dismiss="alert" type="button">×</button></div></td>'
                    +'<td>'
                    +'<input class ="AMOUNT " type="hidden" value="'+ AMOUNT +'" name="AMOUNT" readonly>'
                    +'<input class ="F_NO " type="hidden" value="'+ F_NO +'" name="F_NO" readonly>'                   
                    +'<input class ="DESC_KOR " type="hidden" value="'+ DESC_KOR +'" name="DESC_KOR" readonly>'
                    +'<input class ="SERVING_WT " type="hidden" value="'+ SERVING_WT +'" name="SERVING_WT" readonly>'
                    +'<input class ="NUTR_CONT1 " type="hidden" value="'+ NUTR_CONT1 +'" name="NUTR_CONT1" readonly>'
                    +'<input class ="NUTR_CONT2 " type="hidden" value="'+ NUTR_CONT2 +'" name="NUTR_CONT2" readonly>'
                    +'<input class ="NUTR_CONT3 " type="hidden" value="'+ NUTR_CONT3 +'" name="NUTR_CONT3" readonly>'
                    +'<input class ="NUTR_CONT4 " type="hidden" value="'+ NUTR_CONT4 +'" name="NUTR_CONT4" readonly>'
                    +'<input class ="NUTR_CONT5 " type="hidden" value="'+ NUTR_CONT5 +'" name="NUTR_CONT5" readonly>'
                    +'<input class ="NUTR_CONT6 " type="hidden" value="'+ NUTR_CONT6 +'" name="NUTR_CONT6" readonly>'
                    +'<input class ="NUTR_CONT7 " type="hidden" value="'+ NUTR_CONT7 +'" name="NUTR_CONT7" readonly>'
                    +'<input class ="NUTR_CONT8" type="hidden" value="'+ NUTR_CONT8 +'" name="NUTR_CONT8" readonly>'
                    +'<input class ="NUTR_CONT9 " type="hidden" value="'+ NUTR_CONT9 +'" name="NUTR_CONT9" readonly>'
                    +'<input class ="ANIMAL_PLANT " type="hidden" value="'+ ANIMAL_PLANT +'" name="ANIMAL_PLANT" readonly>'
                    +'</td></tr>'                 
                    ); 
              
              if($("#div_List4  input.NUTR_CONT1").val() == 'N/A' ){$("#div_List4  input.NUTR_CONT1").val("0");
              }if($("#div_List4  input.NUTR_CONT2").val() == 'N/A' ){$("#div_List4  input.NUTR_CONT2").val("0");
              }if($("#div_List4  input.NUTR_CONT3").val() == 'N/A' ){$("#div_List4  input.NUTR_CONT3").val("0");
              }if($("#div_List4  input.NUTR_CONT4").val() == 'N/A' ){$("#div_List4  input.NUTR_CONT4").val("0");
              }if($("#div_List4  input.NUTR_CONT5").val() == 'N/A' ){$("#div_List4  input.NUTR_CONT5").val("0");
              }if($("#div_List4  input.NUTR_CONT6").val() == 'N/A' ){$("#div_List4  input.NUTR_CONT6").val("0");
              }if($("#div_List4  input.NUTR_CONT7").val() == 'N/A' ){$("#div_List4  input.NUTR_CONT7").val("0");
              }if($("#div_List4  input.NUTR_CONT8").val() == 'N/A' ){$("#div_List4  input.NUTR_CONT8").val("0");
              }if($("#div_List4  input.NUTR_CONT9").val() == 'N/A' ){$("#div_List4  input.NUTR_CONT9").val("0");}        
              $(".checked").prop('checked', false);
           } else{
             
           }  
          
   });
    
    
    
    
    
    
    
    $(document).on("click","tbody#div_List4 tr",function(){
    	var click = $(this);	
    	$(this).find(' button').click(function(){    	
    		click.empty(); 
    		});
 });        
</script>	

<script>


</script>



