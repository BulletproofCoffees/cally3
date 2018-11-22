package cally.sharing.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cally.acbook.service.Ac_Memo_Service;
import cally.lecture.service.Lec_Service;
import cally.sharing.beans.Cally_Member;
import cally.sharing.service.Cally_Service;

@Controller
public class CallyController {
	
	@RequestMapping(value="/business", method=RequestMethod.GET)
	public String businessMain() {
		return "view/business/business_main";
	}
	
	@Inject
	Ac_Memo_Service memo_service;
	@RequestMapping(value="/acbook", method=RequestMethod.GET)
	public String acbookMain(HttpServletRequest request, Model m) {
		return "view/acbook/acbook_main";
		
	}
	
    @Inject
    private Lec_Service lec_service;    
    @RequestMapping(value="/lecture", method=RequestMethod.GET)
    public String lectureMain(HttpServletRequest req, Model m) {       
       return lec_service.lectureMain(req, m);
    }
    	
	@RequestMapping(value="/health", method=RequestMethod.GET)
	public String healthMain() {
		return "view/health/health_main";
	}
		
	@RequestMapping(value="/movie", method=RequestMethod.GET)
	public String movieMain() {
		return "view/movie/m_main";
	}
	
	@RequestMapping(value="/tbooking", method=RequestMethod.GET)
	public String tbookingMain() {
		return "view/tbooking/tbooking_main";
	}
	
	@RequestMapping(value="/admin", method=RequestMethod.GET)
	public String admin(){		
		return "admin/admin";
	} 
		
	@Inject
	private Cally_Service cally_service;
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(HttpServletRequest request, Model m, Cally_Member member){
		return cally_service.login(member, m, request);
	} 
	
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpServletRequest request){		
		HttpSession session = request.getSession();
		session.invalidate();
		return "index";
	} 
	
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String join(Cally_Member member, HttpServletRequest request, Model m){		
		return cally_service.join(member, m, request);
	} 
	
	
}
