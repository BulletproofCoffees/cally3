package cally.sharing.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cally.sharing.beans.Cally_Admin;
import cally.sharing.beans.Cally_Member;
import cally.sharing.service.Admin_Service;

@Controller
@RequestMapping(value="/admin")
public class AdminController {
	@Inject
	Admin_Service admin_service;
	
	@RequestMapping(value="/loginform", method=RequestMethod.GET)
	public String adminLoginform() {
		return "admin/admin_login";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String adminLogin(HttpServletRequest request, Model m, Cally_Admin adm, Cally_Member mem) {
		admin_service.subMember(m);
		return admin_service.login(adm, m, request,mem);
	}
	
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String adminLogout(HttpServletRequest request) {
		request.getSession().invalidate();
		return "admin/admin_login";
	}
	
	@RequestMapping(value="/member", method=RequestMethod.GET)
	public String memberList(Model m, HttpServletRequest request, Cally_Member mem) {
		admin_service.subMember(m);
		return admin_service.memberList(mem, m);
	}
	
	
	@RequestMapping(value="/business", method=RequestMethod.GET)
	public String businessMain() {
		return "admin/business/a_business_main";
	}
	
	@RequestMapping(value="/acbook", method=RequestMethod.GET)
	public String acbookMain() {
		return "admin/acbook/a_acbook_main";
	}
	
	@RequestMapping(value="/lecture", method=RequestMethod.GET)
	public String lectureMain() {
		return "admin/lecture/a_lecture_main";
	}
	
	@RequestMapping(value="/health", method=RequestMethod.GET)
	public String healthMain() {
		return "admin/health/a_health_main";
	}
		
	@RequestMapping(value="/movie", method=RequestMethod.GET)
	public String movieMain() {
		return "admin/movie/a_m_main";
	}
	
	@RequestMapping(value="/tbooking", method=RequestMethod.GET)
	public String tbookingMain() {
		return "admin/tbooking/a_tbooking_main";
	}
	
}


