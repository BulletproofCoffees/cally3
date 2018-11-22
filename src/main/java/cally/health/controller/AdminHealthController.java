package cally.health.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cally.health.service.Hel_Exercise_Service;

@Controller
@RequestMapping(value="/admin/health")
public class AdminHealthController {

	@Inject
	Hel_Exercise_Service ex_service;
	
	@RequestMapping(value="/a_health_calculator",method=RequestMethod.GET)
	public String Cal(Model m, HttpServletRequest r) {
		String em = r.getParameter("Exercise_met");
		String ex = r.getParameter("Exercise");	
		m.addAttribute("exercise_met", ex_service.Exercise_met(em));
		m.addAttribute("exercise", ex_service.Exercise(ex));
		System.out.println(ex_service.Exercise(ex));
		System.out.println(ex_service.Exercise_met(em));	
		return "admin/health/a_health_calculator";
	}
	
	@RequestMapping(value="/a_calculator_write",method=RequestMethod.GET)
	public String CalWrite (Model m, HttpServletRequest r) {
		String emc = r.getParameter("Exercise_met_code");
		String em = r.getParameter("Exercise_met");
		String ex = r.getParameter("Exercise");
		m.addAttribute("exercise_met_code", ex_service.Exercise_met_code(emc));
		m.addAttribute("exercise_met", ex_service.Exercise_met(em));
		m.addAttribute("exercise", ex_service.Exercise(ex));
		System.out.println(ex_service.Exercise(ex));
		System.out.println(ex_service.Exercise_met(em));	
		System.out.println(ex_service.Exercise_met_code(emc));	
		return "admin/health/a_calculator_write";
	}
	
	@RequestMapping(value="/a_calculator_write",method=RequestMethod.POST)
	public String CalWrite2(Model m, HttpServletRequest r) {
		//값을 받아오기 r.getParameter.. 
		//여러 값이 있으면 Map에 넣어주기
		//mapper에 sql에 Map넘겨주기
		//결과값이 있으면 Model m에 addAttribute 해주기
		//마지막으로 이동할 주소값 return 하기
		return ex_service.CalWrite2(m, r);
	}
	
	

	@RequestMapping(value="/a_health_exercise", method=RequestMethod.GET)
	public String Exercise(Model m, HttpServletRequest r) {
		String ex = r.getParameter("Exercise");
		m.addAttribute("exercise", ex_service.Exercise(ex));
		System.out.println(ex_service.Exercise(ex));
		return "admin/health/a_health_exercise";
	}
	
	@RequestMapping(value="/a_health_write",method=RequestMethod.GET)
	public String Exercise_Write(Model m, HttpServletRequest r) {
		String ec = r.getParameter("Exercise_code");
		m.addAttribute("exercise_code", ex_service.Exercise_code(ec));
		System.out.println(ex_service.Exercise_code(ec));
		return "admin/health/a_health_write";	
	}

	@RequestMapping(value="/a_health_write",method=RequestMethod.POST)
	public String Exercise_Write2(Model m, HttpServletRequest r) {
		//값을 받아오기 r.getParameter.. 
		//여러 값이 있으면 Map에 넣어주기
		//mapper에 sql에 Map넘겨주기
		//결과값이 있으면 Model m에 addAttribute 해주기
		//마지막으로 이동할 주소값 return 하기
		return ex_service.a_Health_Write(m, r);	
	}
}
