<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<aside>
      <div id="sidebar" class="nav-collapse ">
        <ul class="sidebar-menu" id="nav-accordion">
          <li class="sub-menu">
            <a href="javascript:;">
              <span>영화예매</span>
              </a>
            <ul class="sub">
              <li><c:url value="/movie" var="m_main"/>
              <a href="${m_main }">극장선택</a></li>
              <li><c:url value="/movie/movieNowList" var="now"/>
              <a href="${now }">상영중인 영화</a></li>
              <li><c:url value="/movie/movieAllList" var="movieAllList"/>
              <a href="${movieAllList }">영화 전체목록 </a></li>
            </ul>
          </li>
          <li class="sub-menu">
            <a href="javascript:;">
              <span>My page</span>
              </a>
            <ul class="sub">
              <li><c:url value="/movie/movieTcheck" var="check"/>
              <a href="${check }">예매확인</a></li>
            </ul>
          </li>
          <li class="sub-menu">
            <a href="javascript:;">
              <span>관리자페이지</span>
              </a>
            <ul class="sub">
              <li><c:url value="/movie/movieAlist" var="admin"/>
              <a href="${admin }">관리자 페이지로</a></li>
            </ul>
          </li>
        </ul>
      </div>
    </aside>