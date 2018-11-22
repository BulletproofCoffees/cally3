<%@ include file="submenu.jspf" %>  
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
.callymenu{
	color: #666666 !important;
}
.c_health{
	color: #4ECDC4 !important;
}
.form-control{
width:300px;
}


</style>
    
    <!-- **********************************************************************************************************************************************************
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->
    <!--main content start-->
        <section id="main-content">
      

  <br><br>  
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">
      <div class="item active">
      <aside class="col-lg-12 mt">
        <img src="/cally/img/callyPlus/health_main.jpg" alt="main" width="100%" height="400">
        <div class="carousel-caption">
        <div class="form-group row">   
          <h3>궁금한것이 있으신가요?</h3>
          <h3>망설이지 말고 연락주세요!</h3>
          <center>
    <div class="form-group">
      <input type="text" class="form-control" id="name" name="name"  placeholder="이름">
    </div>
    <div class="form-group">
      <input type="text" class="form-control" id="tel" name="tel"  placeholder="연락처">
    </div>
    <div class="form-group">
      <textarea class="form-control" id="tel" name="tel"  placeholder="문의내용"></textarea>
    </div> 
          </center>
    <button class="btn btn-info">SEND</button>
      </div> 
        </div>      
        </aside>
      </div>
      <div class="item">
      <aside class="col-lg-12 mt">
        <img src="/cally/img/callyPlus/health_main2.png" alt="main2" width="100%" height="400">
        <div class="carousel-caption">
                <div class="form-group row">   
          <h3>궁금한것이 있으신가요?</h3>
          <h3>망설이지 말고 연락주세요!</h3>
          <center>
    <div class="form-group">
      <input type="text" class="form-control" id="name" name="name"  placeholder="이름">
    </div>
    <div class="form-group">
      <input type="text" class="form-control" id="tel" name="tel"  placeholder="연락처">
    </div>
    <div class="form-group">
      <textarea class="form-control" id="tel" name="tel"  placeholder="문의내용"></textarea>
    </div> 
          </center>
    <button class="btn btn-info">SEND</button>
      </div>
      </div>
        </aside>
      </div>   
      <div class="item">
      <aside class="col-lg-12 mt">
        <img src="/cally/img/callyPlus/health_main3.png" alt="main3" width="100%" height="400">
        <div class="carousel-caption">
                <div class="form-group row">   
          <h3>궁금한것이 있으신가요?</h3>
          <h3>망설이지 말고 연락주세요!</h3>
          <center>
    <div class="form-group">
      <input type="text" class="form-control" id="name" name="name"  placeholder="이름">
    </div>
    <div class="form-group">
      <input type="text" class="form-control" id="tel" name="tel"  placeholder="연락처">
    </div>
    <div class="form-group">
      <textarea class="form-control" id="tel" name="tel"  placeholder="문의내용"></textarea>
    </div> 
          </center>
    <button class="btn btn-info">SEND</button>
      </div>
      </div>
        </aside>
      </div>
    </div>
    

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
  <br>
  <center>
  <div>
  <a href="health/health_mypage">
<img src ="/cally/img/callyPlus/img_female.gif" height="120.99">
  </a>
  <a href="health/health_bmi">
<img src ="/cally/img/callyPlus/link_shortcut01.gif" ></a>
<a href="health/health_calorie">
<img src ="/cally/img/callyPlus/link_shortcut02.gif" ></a>
  </div>
  </center>

<br>
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content -->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">체질량지수(BMI)계산기</h4>
        </div>
        <div class="modal-body">
         <div class="container">
  <h2>기본정보</h2>
  <form action="/action_page.php">
    <div class="form-group">
      <label for="sex">성별</label>
      남<input type="radio" id="boy" name="boy">
     여 <input type="radio" id="girl" name="girl">
    </div>
    <div class="form-group">
      <label for="age">연령</label>
      <input type="text" class="form-control" id="age" placeholder="예)19970101" name="age">
    </div>
    <div class="form-group">
      <label for="height">키</label>
      <input type="text" class="form-control" id="height" name="height">
    </div>
    <div class="form-group">
      <label for="weight">몸무게</label>
      <input type="text" class="form-control" id="weight" name="weight">
    </div> 
    <button type="submit" class="btn btn-default">확인</button>
  </form>
</div> 
  </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>


      
   
              <!-- page end-->
      
      <!-- /wrapper -->
    </section>
    <!-- /MAIN CONTENT -->
    <!--main content end-->
    
<%@ include file="js.jspf" %>