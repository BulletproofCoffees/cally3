package cally.sharing.interceptors;

import java.util.Objects;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;

public class Login_interceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object o) throws Exception {
	//pre핸들 시작
		System.out.println("preHandle!!!!");
		//로그인 확인
		if(Objects.isNull(req.getSession().getAttribute("loginUser"))) {
			System.out.println("회원로그인 안되어있음.");
			req.setAttribute("idxmessage", "로그인 후 이용할 수 있는 서비스입니다.");  
			/*req.getRequestDispatcher("/cally/").forward(req, res);*/
			/*res.sendRedirect("/cally/");*/
		
			//메세지를 띄워주기 위해 redirect가 아닌 Exception 이용..
			   ModelAndView mav = new ModelAndView("/index");	        
	            throw new ModelAndViewDefiningException(mav);
	            
			/*return false;*/
		} else {
			//로그인 되어있음
			return true;
		}
		/*if (req.getMethod().equals("GET")) {
			System.out.println("true!!!!");
			return true;
		} else {
			System.out.println("false!!!!");
			return false;
		}*/
	}

	@Override
	public void postHandle(HttpServletRequest req, HttpServletResponse res, Object o, ModelAndView modelAndView)
			throws Exception {
		System.out.println("postHandle!!!!");
		/*if (modelAndView.getModelMap().containsKey("status")) {
			String status = (String) modelAndView.getModelMap().get("status");
			if (status.equals("SUCCESS!")) {
				status = "Authentication " + status;
				modelAndView.addObject("status", status);
			}
		}*/
	}

	@Override
	public void afterCompletion(HttpServletRequest req, HttpServletResponse res, Object o, Exception e)
			throws Exception {
		System.out.println("afterCompletion!!!!");
	}
}
