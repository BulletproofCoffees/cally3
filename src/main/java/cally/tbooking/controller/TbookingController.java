package cally.tbooking.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cally.tbooking.service.TbookingService;

@Controller
public class TbookingController {

	@Inject
	TbookingService service;

	@RequestMapping(value = "/b_form", method = RequestMethod.GET)
	// -------------사용자페이지에서 b_form 출발역 도착역 조회시
	public String tBform(Model m, HttpServletRequest r, HttpServletResponse response) {
		m.addAttribute("stInfoMain", service.stInfoBform(""));
		
		return "view/tbooking/b_form";
	}
	@RequestMapping(value = "/b_form_b", method = RequestMethod.POST)
	public String tBform_b(Model m, HttpServletRequest r) {
		String checkT = r.getParameter("searchForm");
		System.out.println(checkT);
		m.addAttribute("checkTrain", service.checkedTrain(checkT));
		return "view/tbooking/b_form";
	}
	@RequestMapping(value = "/t_station", method = RequestMethod.GET)
	// -------------사용자페이지에서 t_station 역정보
	public String tStation(Model m, HttpServletRequest r, HttpServletResponse response, String stInfoList) {
		if (stInfoList != null) {
			m.addAttribute("stInfoStation", service.stInfoStation(stInfoList));
		}
		return "view/tbooking/t_station";
	}

//----------------------------------------------------------------------페이지 넘어가는 컨트롤러
	@RequestMapping(value = "/b_form_ch", method = RequestMethod.GET)
	public String tBFormCh() {
		return "view/tbooking/b_form_ch";
	}

	@RequestMapping(value = "/b_form_mod", method = RequestMethod.GET)
	public String tBFormMod() {
		return "view/tbooking/b_form_mod";
	}

	@RequestMapping(value = "/b_t_form", method = RequestMethod.GET)
	public String tBform() {
		return "view/tbooking/b_t_form";
	}

	@RequestMapping(value = "/t_roots", method = RequestMethod.GET)
	public String tRoots() {
		return "view/tbooking/t_roots";
	}

	@RequestMapping(value = "/t_st", method = RequestMethod.GET)
	public String tSt() {
		return "view/tbooking/t_st";
	}

	@RequestMapping(value = "/t_sta", method = RequestMethod.GET)
	public String tSta() {
		return "view/tbooking/t_sta";
	}

	@RequestMapping(value = "/testcar/{no}", method = RequestMethod.GET)
	public String testcar(@PathVariable String no, HttpServletRequest r) {
		System.out.println("no>>>" + no);
		return "b_t_form";
	}
}
