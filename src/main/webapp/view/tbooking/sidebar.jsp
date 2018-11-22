<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!--header end-->
    <!-- **********************************************************************************************************************************************************
        MAIN SIDEBAR MENU
        *********************************************************************************************************************************************************** -->
    <!--sidebar start-->
    <aside>
      <div id="sidebar" class="nav-collapse ">
        <!-- sidebar menu start 사이드바 메뉴 시작-->
        <ul class="sidebar-menu" id="nav-accordion">
          <br><li><h5 class="centered">T-Booking</h5></li><br>
          <li class="sub-menu">
            <a href="javascript:;" class="active">
              <i class="fa fa-heart"></i>
              <span>승차권</span>
              </a>
            <ul class="sub">
              <li><c:url value="/b_form" var="b_form"/><a class="callymenu c_tbooking" href="${b_form}">열차예매</a></li>
              <li><c:url value="/b_form_mod" var="b_form_mod"/><a class="callymenu c_tbooking" href="${b_form_mod}">변경/취소</a></li>
              <li><c:url value="/b_form_ch" var="b_form_ch"/><a class="callymenu c_tbooking" href="${b_form_ch}">이용내역</a></li>
            </ul>
          </li>
          
          <li class="sub-menu">
            <a href="javascript:;" class="active">
              <i class="fa fa-desktop"></i>
              <span>기차역/노선도</span>
              </a>
           <ul class="sub">
              <li><c:url value="/t_station" var="t_station"/><a class="callymenu c_tbooking" href="${t_station}">기차역</a></li>
              <li><c:url value="/t_roots" var="t_roots"/><a class="callymenu c_tbooking" href="${t_roots}">노선도</a></li>
           </ul>
         </li>
       	          <li class="sub-menu">
            <a href="javascript:;" class="active">
              <i class="fa fa-heart"></i>
              <span>관리자</span>
              </a>
            <ul class="sub">
              <li><c:url value="/b_form" var="b_form"/><a class="callymenu c_tbooking" href="${b_form}">열차현황</a></li>
              <li><c:url value="/b_form_mod" var="b_form_mod"/><a class="callymenu c_tbooking" href="${b_form_mod}">예매현황</a></li>
              <li><c:url value="/b_form_ch" var="b_form_ch"/><a class="callymenu c_tbooking" href="${b_form_ch}">열차추가변경</a></li>
            </ul>
          </li>   
        </ul>
        <!-- sidebar menu end  사이드바 메뉴 끝-->
      </div>
    </aside>
    <!--sidebar end-->
