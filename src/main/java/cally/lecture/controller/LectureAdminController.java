package cally.lecture.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cally.lecture.beans.Lec_Lecsearch;
import cally.lecture.service.Lec_Ad_Service;
import cally.lecture.service.Lec_Service;

@Controller
@RequestMapping(value="/admin/lecture")
public class LectureAdminController {
	
	@Inject
	private SqlSession session;
	
	@Inject
	private Lec_Service service;
	@Inject
	private Lec_Ad_Service ad_service;
	
	//강의 리스트 보여주기
	@RequestMapping(value="/lec_list")
	public String lectureList(Model m) {
		m.addAttribute("list", service.lec_list());
		return "admin/lecture/class/lec_list";
	}
	
	@RequestMapping(value="/lec_search")
	public String selListSear(HttpServletRequest req, Model m) {
		String lec_dan = req.getParameter("lec_dan");
		String lec_name = req.getParameter("lec_name");
		
		System.out.println(lec_dan);
		System.out.println(lec_name);
				
		m.addAttribute("lec_dan",lec_dan);
		m.addAttribute("lec_name",lec_name);
		m.addAttribute("list", service.searchLecList(new Lec_Lecsearch(lec_dan, lec_name)));
		return "admin/lecture/class/lec_list";
	}
	
	//강의등록-강의리스트
	@RequestMapping(value="/lec_regi", method=RequestMethod.GET)
	public String lecRegi(Model m) {
		m.addAttribute("list", ad_service.sel_Lkind());
		return "admin/lecture/class/lec_regi";
	}
	@RequestMapping(value="/lec_re_info")
	public String lecReInfo(Model m, HttpServletRequest req) {
		String lec_code_no = req.getParameter("lec_code");
		int lec_code= Integer.parseInt(lec_code_no);
		System.out.println(lec_code);
		m.addAttribute("i", ad_service.lecInfo(lec_code));
		m.addAttribute("list", ad_service.sel_Lkind());
		
		m.addAttribute("r", ad_service.sel_Rkind());
		m.addAttribute("d", ad_service.sel_Dkind());
		m.addAttribute("h", ad_service.sel_Hkind());
		
		return "admin/lecture/class/lec_regi";
	}
	
	@RequestMapping(value="/lec_repro_info")
	public String lecReProInfo(Model m, HttpServletRequest req) {
		String lec_code_no = req.getParameter("lec_code");
		String lec_dan_code_no = req.getParameter("lec_dan_code");
		int lec_code= Integer.parseInt(lec_code_no);
		int lec_dan_code= Integer.parseInt(lec_dan_code_no);
		System.out.println(lec_code);
		System.out.println(lec_dan_code);		
		
		m.addAttribute("i", ad_service.lecInfo(lec_code));
		m.addAttribute("list", ad_service.sel_Lkind());
		
		m.addAttribute("r", ad_service.sel_Rkind());
		m.addAttribute("p", ad_service.sel_Pkind(lec_dan_code));
		m.addAttribute("d", ad_service.sel_Dkind());
		m.addAttribute("h", ad_service.sel_Hkind());
		
		return "admin/lecture/class/lec_regi";
	}
	
	@RequestMapping(value="/lec_re_app")
	public String lecReApp(Model m, HttpServletRequest req) {
		String lec_year = req.getParameter("lec_year");
		String lec_sem = req.getParameter("lec_sem");
		
		//1
		String lec_point_no = req.getParameter("lec_point");
		int lec_point= Integer.parseInt(lec_point_no);
		//2
		String lec_code_no = req.getParameter("lec_code");
		int lec_code= Integer.parseInt(lec_code_no);
		//3
		String lec_pro = req.getParameter("lec_pro");
		int lec_pro_code= Integer.parseInt(lec_pro);
		//4
		String lec_dan_code = req.getParameter("lec_dan");
		int lec_dan= Integer.parseInt(lec_dan_code);
		//5
		String lec_room = req.getParameter("lec_room");
		int lec_room_num= Integer.parseInt(lec_room);
		//6
		String lec_day_no = req.getParameter("lec_day");
		int lec_day= Integer.parseInt(lec_day_no);
		//7
		String lec_hour_no = req.getParameter("lec_hour");
		int lec_hour= Integer.parseInt(lec_hour_no);
		//8
		String lec_perso_no = req.getParameter("lec_perso");
		int lec_perso= Integer.parseInt(lec_perso_no);
		//9
		String lec_sum = req.getParameter("lec_sum");
		//10
		String lec_goal = req.getParameter("lec_goal");
		
		//11 semcode 만들기
		String sem_code = lec_year+lec_sem;
		int lec_sem_code= Integer.parseInt(sem_code);
		
		//12,13,14,15
		String lec_book_name = req.getParameter("lec_book_name");
		String lec_publ_year_no = req.getParameter("lec_publ_year");
		int lec_publ_year= Integer.parseInt(lec_publ_year_no);
		String lec_publisher = req.getParameter("lec_publisher");
		String lec_athor = req.getParameter("lec_athor");
		
		Map<String, Object> param = new HashMap<>();
		param.put("lec_day", lec_day);
		param.put("lec_hour", lec_hour);
		param.put("lec_point", lec_point);
		param.put("lec_dan", lec_dan);
		param.put("lec_room_num", lec_room_num);
		param.put("lec_code", lec_code);
		param.put("lec_pro_code", lec_pro_code);
		param.put("lec_sem_code", lec_sem_code);
		param.put("lec_sum", lec_sum);
		param.put("lec_goal", lec_goal);
		param.put("lec_perso", lec_perso);
		param.put("lec_book_name", lec_book_name);
		param.put("lec_publ_year", lec_publ_year);
		param.put("lec_publisher", lec_publisher);
		param.put("lec_athor", lec_athor);
		param.put("lec_msg", "a");
		
		session.selectOne("mapper.lec.AdminMapper.p_lec_sche_insert",param);
		
		String getmsg = (String)param.get("lec_msg");
		
		m.addAttribute("getmsg",getmsg);
		m.addAttribute("list", service.lec_list());
		
		return "admin/lecture/class/lec_list";
	}
	
	//강의클릭시-강의디테일
	@RequestMapping(value="/lec_detail/{code}")
	public String LecDetail(@PathVariable int code, Model m) {
		System.out.println(code);
		
		m.addAttribute("detail", ad_service.lecDetail(code));
		
		m.addAttribute("r", ad_service.sel_Rkind());
		m.addAttribute("d", ad_service.sel_Dkind());
		m.addAttribute("h", ad_service.sel_Hkind());
		
		return "admin/lecture/class/lec_detail";
	}
	
	//강의업데이트
	@RequestMapping(value="/lec_modify")
	public String LecModify(Model m, HttpServletRequest req) {
		
		
		String lec_year = req.getParameter("lec_year");
		String lec_sem = req.getParameter("lec_sem");

		
		//1

		//2
		String lec_sche_no = req.getParameter("lec_sche_code");
		int lec_sche_code= Integer.parseInt(lec_sche_no);

		//4
		String lec_dan_code = req.getParameter("lec_dan");
		int lec_dan= Integer.parseInt(lec_dan_code);
		//5
		String lec_room = req.getParameter("lec_room");
		int lec_room_num= Integer.parseInt(lec_room);
		//6
		String lec_day_no = req.getParameter("lec_day");
		int lec_day= Integer.parseInt(lec_day_no);
		//7
		String lec_hour_no = req.getParameter("lec_hour");
		int lec_hour= Integer.parseInt(lec_hour_no);
		//8
		String lec_perso_no = req.getParameter("lec_perso");
		int lec_perso= Integer.parseInt(lec_perso_no);
		//9
		String lec_sum = req.getParameter("lec_sum");
		//10
		String lec_goal = req.getParameter("lec_goal");
		
		//11 semcode 만들기
		String sem_code = lec_year+lec_sem;
		int lec_sem_code= Integer.parseInt(sem_code);
		
		//12,13,14,15
		String lec_book_name = req.getParameter("lec_book_name");
		String lec_publ_year_no = req.getParameter("lec_publ_year");
		int lec_publ_year= Integer.parseInt(lec_publ_year_no);
		String lec_publisher = req.getParameter("lec_publisher");
		String lec_athor = req.getParameter("lec_athor");
		
		
		Map<String, Object> param = new HashMap<>();
		param.put("lec_day", lec_day);
		param.put("lec_hour", lec_hour);
		param.put("lec_dan", lec_dan);
		param.put("lec_room_num", lec_room_num);
		param.put("lec_sche_code", lec_sche_code);
		param.put("lec_sem_code", lec_sem_code);
		param.put("lec_sum", lec_sum);
		param.put("lec_goal", lec_goal);
		param.put("lec_perso", lec_perso);
		param.put("lec_book_name", lec_book_name);
		param.put("lec_publ_year", lec_publ_year);
		param.put("lec_publisher", lec_publisher);
		param.put("lec_athor", lec_athor);
		param.put("lec_msg", "a");
		
		System.out.println(param);
		
		session.selectOne("mapper.lec.AdminMapper.p_lec_sche_modify",param);
		
		String getmsg = (String)param.get("lec_msg");
		
		m.addAttribute("getmsg",getmsg);
		
		m.addAttribute("detail", ad_service.lecDetail(lec_sche_code));
		
		m.addAttribute("r", ad_service.sel_Rkind());
		m.addAttribute("d", ad_service.sel_Dkind());
		m.addAttribute("h", ad_service.sel_Hkind());
				
		return "admin/lecture/class/lec_detail";
	}
	
	//강의스케쥴삭제
	@RequestMapping(value="/lec_sche_del/{code}")
	public String lecScheDel(@PathVariable int code, Model m) {
		
		ad_service.lecScheDel(code);
		m.addAttribute("list", service.lec_list());
		return "admin/lecture/class/lec_list";	
	} 
	
	
	//강의평가리스트
	@RequestMapping(value="/eval_list")
	public String evalList(Model m) {
		m.addAttribute("list", ad_service.eval_list());
		return "admin/lecture/class/eval_list";
	}
	
	//학생리스트
	@RequestMapping(value="/st_list")
	public String stList(Model m) {
		m.addAttribute("list", ad_service.st_list());
		System.out.println(m);
		return "admin/lecture/student/st_list";
	}
	
	//휴학or재학
	@RequestMapping(value="/lec_st_search/{info}")
	public String stSear(@PathVariable String info, Model m) {
		m.addAttribute("list", ad_service.st_sear(info));
		return "admin/lecture/student/st_list";
	}
	
	//이름검색
	@RequestMapping(value="/lec_st_name_sear")
	public String stNameSear(HttpServletRequest req, Model m) {
		String name = req.getParameter("name");
		m.addAttribute("list", ad_service.st_Nsear(name));
		
		return "admin/lecture/student/st_list";
	}
	
	//성적-강의 리스트 보여주기
	@RequestMapping(value="/rec_list")
	public String recList(Model m) {
		m.addAttribute("list", service.lec_list());
		return "admin/lecture/record/rec_list";
	}
	
	@RequestMapping(value="/rec_search")
	public String lecSear(HttpServletRequest req, Model m) {
		String lec_dan = req.getParameter("lec_dan");
		String lec_name = req.getParameter("lec_name");
		
		System.out.println(lec_dan);
		System.out.println(lec_name);
				
		m.addAttribute("lec_dan",lec_dan);
		m.addAttribute("lec_name",lec_name);
		m.addAttribute("list", service.searchLecList(new Lec_Lecsearch(lec_dan, lec_name)));
		return "admin/lecture/record/rec_list";
	}
	
	//성적클릭시-성적디테일
	@RequestMapping(value="/rec_detail/{code}")
	public String recDetail(@PathVariable int code, Model m) {
		System.out.println(code);
		
		m.addAttribute("detail", ad_service.recDetail(code));
		
		return "admin/lecture/record/rec_detail";
	}
	
	//성적업데이트
	@RequestMapping(value="/rec_modify")
	public String RecModify(Model m, HttpServletRequest req) {
		
		String lec_mid_po = req.getParameter("lec_mid_po");
		String lec_fin_po = req.getParameter("lec_fin_po");
		String lec_assi_po = req.getParameter("lec_assi_po");
		String lec_grade = req.getParameter("lec_grade");
		int lec_mid= Integer.parseInt(lec_mid_po);
		
		
		/*Map<String, Object> param = new HashMap<>();
		param.put("lec_day", lec_day);
		param.put("lec_hour", lec_hour);
		param.put("lec_dan", lec_dan);
		param.put("lec_room_num", lec_room_num);
		param.put("lec_sche_code", lec_sche_code);
		param.put("lec_sem_code", lec_sem_code);
		param.put("lec_sum", lec_sum);
		param.put("lec_goal", lec_goal);
		param.put("lec_perso", lec_perso);
		param.put("lec_book_name", lec_book_name);
		param.put("lec_publ_year", lec_publ_year);
		param.put("lec_publisher", lec_publisher);
		param.put("lec_athor", lec_athor);
		param.put("lec_msg", "a");
		
		System.out.println(param);
		
		session.selectOne("mapper.lec.AdminMapper.p_lec_sche_modify",param);
		
		String getmsg = (String)param.get("lec_msg");
		
		m.addAttribute("getmsg",getmsg);
		
		m.addAttribute("detail", ad_service.lecDetail(lec_sche_code));
		
		m.addAttribute("r", ad_service.sel_Rkind());
		m.addAttribute("d", ad_service.sel_Dkind());
		m.addAttribute("h", ad_service.sel_Hkind());*/
				
		return "admin/lecture/record/rec_detail";
	}
}
