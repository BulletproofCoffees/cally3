package cally.acbook.interceptors;

import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import cally.acbook.dao.Ac_Acco_Dao;
import cally.acbook.dao.Ac_Help_Dao;
import cally.acbook.service.Ac_Detail_Service;

public class Acbook_interceptor implements HandlerInterceptor{
	
	@Inject
	Ac_Acco_Dao acc_dao;
	@Inject
	Ac_Detail_Service det_service;
	@Inject
	Ac_Help_Dao help_dao;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// 이용자의 통장 목록을 확인해서 아무것도 없을 경우
		if(acc_dao.countAccount(help_dao.getMem_num(request)) == 0) {
		//가계부 첫 사용자 화면으로 리다이렉트 
		response.sendRedirect("/cally/acbook/newform");
		return false;
		} else {
		// 통장이 하나 이상 있을 경우
		//서브메뉴에 필요한 통계정보들을 불러온다.
		Map<String, Object> infoMap = det_service.setSubmenu(request);
		//리퀘스트에 acSub 이름으로 추가한다.
		request.setAttribute("acSub", infoMap);
		return true;
		}}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("가계부 포스트!");
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		System.out.println("가계부 애프터!");
		
	}

}
