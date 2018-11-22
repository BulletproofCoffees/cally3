package cally.sj.interceptors;

import java.util.Objects;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;

public class Sj_interceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object o) throws Exception {
	//pre핸들 시작
		System.out.println("interceptor");
		//로그인 확인
		if(Objects.isNull(req.getSession().getAttribute("sjlogin"))) {
			System.out.println("sj로그인됨.");
			req.setAttribute("idxmessage", "식단관리 서비스는 회원동의 후 이용할 수 있는 서비스입니다.");  
		
			   ModelAndView mav = new ModelAndView("/index");	        
	            throw new ModelAndViewDefiningException(mav);
	            
		
		} else {
		
			return true;
		}
	
	}

	@Override
	public void postHandle(HttpServletRequest req, HttpServletResponse res, Object o, ModelAndView modelAndView)
			throws Exception {
	}

	@Override
	public void afterCompletion(HttpServletRequest req, HttpServletResponse res, Object o, Exception e)
			throws Exception {
		System.out.println("afterCompletion!!!!");
	}
}
