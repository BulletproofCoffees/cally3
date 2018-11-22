<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<aside>
      <div id="sidebar" class="nav-collapse ">
        <ul class="sidebar-menu" id="nav-accordion">
          <li class="sub-menu">
            <a href="javascript:;">
              <span>상영관리</span>
              </a>
            <ul class="sub">
              <li><c:url value="/movie/movieAlist" var="m_Alist"/>
              <a href="${m_Alist }">상영중인 영화목록</a></li>
              <li><c:url value="/movie/theaterAdd" var="m_Tadd"/>
              <a href="${m_Tadd }">극장등록</a></li>
              <li><c:url value="/movie/movieAdd" var="m_Add"/>
              <a href="${m_Add }">영화등록</a></li>
              <li><c:url value="/movie/scheduleAdd" var="m_sche"/>
              <a href="${m_sche }">극장스케쥴 등록</a></li>
            </ul>
          </li>
          <li class="sub-menu">
            <a href="javascript:;">
              <span>예매관리</span>
              </a>
            <ul class="sub">
             <li><c:url value="/movie/Reservation" var="reserv"/>
              <a href="${reserv }">예매관리</a></li>
            </ul>
          </li>
        </ul>
      </div>
    </aside>