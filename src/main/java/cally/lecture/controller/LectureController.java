package cally.lecture.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cally.lecture.beans.Lec_Eval;
import cally.lecture.beans.Lec_Lecsearch;
import cally.lecture.service.Lec_Service;
import cally.sharing.beans.Cally_Member;

@Controller
@RequestMapping(value="/lecture")
public class LectureController {
	
	@Inject
	private SqlSession session;
	@RequestMapping(value="/enroll", method=RequestMethod.GET)
	public String test(HttpServletRequest req) {
		Cally_Member loginUser = (Cally_Member) req.getSession().getAttribute("loginUser");
		int mem_num = loginUser.getMem_num();
		Map<String, Object> param = new HashMap<>();
		param.put("mem_num", mem_num);
		session.insert("mapper.lec.lectureMapper.lec_st_insert",param);
		
		return "view/lecture/lecture_main";
	}
	
	/* 수강신청 페이지 */
	@Inject
	private Lec_Service service;
	
	//수강신청-강의 리스트 보여주기
	@RequestMapping(value="/lec_list")
	public String lectureList(Model m) {
		m.addAttribute("list", service.lec_list());
		return "view/lecture/class/enroll";
	}
	
	//수강신청-강의 검색
	@RequestMapping(value="/lec_search")
	public String selListSear(HttpServletRequest req, Model m) {
		String lec_dan = req.getParameter("lec_dan");
		String lec_name = req.getParameter("lec_name");
		
		System.out.println(lec_dan);
		System.out.println(lec_name);
				
		m.addAttribute("lec_dan",lec_dan);
		m.addAttribute("lec_name",lec_name);
		m.addAttribute("list", service.searchLecList(new Lec_Lecsearch(lec_dan, lec_name)));
		return "view/lecture/class/enroll";
	}
	
	
	//수강신청-프로시저
	@RequestMapping(value="/lec_app")
	public String getTest(HttpServletRequest req, Model m) {
		Cally_Member loginUser = (Cally_Member) req.getSession().getAttribute("loginUser");
		int mem_num = loginUser.getMem_num();		
		String lec_day = req.getParameter("lec_day");
		String lec_hour_no = req.getParameter("lec_hour");
		String lec_sche_no = req.getParameter("lec_sche_code");
		String lec_point_no = req.getParameter("lec_point");
		
		int lec_hour= Integer.parseInt(lec_hour_no);
		int lec_sche_code= Integer.parseInt(lec_sche_no);
		int lec_point= Integer.parseInt(lec_point_no);
		
		Map<String, Object> param = new HashMap<>();
		param.put("mem_num", mem_num);
		param.put("lec_day", lec_day);
		param.put("lec_hour", lec_hour);
		param.put("lec_sche_code", lec_sche_code);
		param.put("lec_point", lec_point);
		param.put("lec_msg", "a");
		System.out.println(param);
		
		session.selectOne("mapper.lec.lectureMapper.p_lec_app",param);
		
		String getmsg = (String)param.get("lec_msg");
		
		System.out.println(getmsg);
		
		m.addAttribute("getmsg",getmsg);

		m.addAttribute("list", service.lec_list());
		return "view/lecture/class/enroll";
	} 
	
	/*class*/
	
	//개인강의목록 검색-apply
	@RequestMapping(value="/lec_indi_search")
	public String lecIndiSear(HttpServletRequest req, Model m) {
		Cally_Member loginUser = (Cally_Member) req.getSession().getAttribute("loginUser");
		int mem_num = loginUser.getMem_num();
		String lec_year = req.getParameter("lec_year");
		String lec_sem = req.getParameter("lec_sem");
		
		String lec_sem_no = lec_year+lec_sem;

		int lec_sem_code = Integer.parseInt(lec_sem_no);
		
		System.out.println(lec_sem_code);
		System.out.println(mem_num);
				
		m.addAttribute("mem_num",mem_num);
		m.addAttribute("lec_sem_code",lec_sem_code);
		
		m.addAttribute("list", service.searchIndiLec(new Lec_Lecsearch(mem_num, lec_sem_code)));
		return "view/lecture/class/apply";
	}
	
	//개인강의목록 삭제 프로시저-apply-del
	@RequestMapping(value="/lec_del")
	public String lecDel(HttpServletRequest req, Model m) {
		String lec_app_code = req.getParameter("lec_app_code");
		
		int lec_app_code_no= Integer.parseInt(lec_app_code);

		service.lecDel(new Lec_Lecsearch(lec_app_code_no));
		
		String mem_no = req.getParameter("mem_num");
		String lec_sem_no = req.getParameter("lec_sem_code");
		int mem_num = Integer.parseInt(mem_no);
		int lec_sem_code = Integer.parseInt(lec_sem_no);
				
		m.addAttribute("mem_num",mem_num);
		m.addAttribute("lec_sem_code",lec_sem_code);
		
		m.addAttribute("list", service.searchIndiLec(new Lec_Lecsearch(mem_num, lec_sem_code)));
		return "view/lecture/class/apply";		
	} 
	
	//개인강의시간표검색-lec_indi_time
	@RequestMapping(value="/lec_time_search")
	public String lecTimeSear(HttpServletRequest req, Model m) {
		Cally_Member loginUser = (Cally_Member) req.getSession().getAttribute("loginUser");
		int mem_num = loginUser.getMem_num();
		String lec_year = req.getParameter("lec_year");
		String lec_sem = req.getParameter("lec_sem");
		
		String lec_sem_no = lec_year+lec_sem;

		int lec_sem_code = Integer.parseInt(lec_sem_no);
		
		System.out.println(lec_sem_code);
		System.out.println(mem_num);
				
		m.addAttribute("mem_num",mem_num);
		m.addAttribute("lec_sem_code",lec_sem_code);
		
		m.addAttribute("list", service.searchTimeLec(new Lec_Lecsearch(mem_num, lec_sem_code)));
		return "view/lecture/class/indi_time";
	}
	
	//강의평가 강의목록 -eval
	@RequestMapping(value="/eval")
	public String evalSelSear(Model m, HttpServletRequest req) {
		Cally_Member loginUser = (Cally_Member) req.getSession().getAttribute("loginUser");
		int mem_num = loginUser.getMem_num();
		m.addAttribute("list", service.sel_eval(mem_num));
		return "view/lecture/class/eval";
	}
	
	//강의평가 평가-eval
	@RequestMapping(value="/eval_selected")
	public String evalSelected(Model m, HttpServletRequest req) {
		String lec_app_no = req.getParameter("lec_app_code");
		int lec_app_code= Integer.parseInt(lec_app_no);
		
		m.addAttribute("t_list", service.list_eval(lec_app_code));
		
		Cally_Member loginUser = (Cally_Member) req.getSession().getAttribute("loginUser");
		int mem_num = loginUser.getMem_num();
		m.addAttribute("list", service.sel_eval(mem_num));
		return "view/lecture/class/eval";
	}
	
	
	//강의평가항목 보내기-eval
	@RequestMapping(value="/eval_app")
	public String evalApp(HttpServletRequest req, Model m) {
		String lec_app_code = req.getParameter("lec_app_code");
		String lec_qone = req.getParameter("lec_qone");
		String lec_qtwo = req.getParameter("lec_qtwo");
		String lec_qthr = req.getParameter("lec_qthr");
		String lec_qfou = req.getParameter("lec_qfou");
		String lec_qfiv = req.getParameter("lec_qfiv");
		String lec_qsix = req.getParameter("lec_qsix");
		String lec_qsev = req.getParameter("lec_qsev");
		String lec_qeig = req.getParameter("lec_qeig");
		
		int lec_app_code_no= Integer.parseInt(lec_app_code);
		
		int lec_qone_no= Integer.parseInt(lec_qone);
		int lec_qtwo_no= Integer.parseInt(lec_qtwo);
		int lec_qthr_no= Integer.parseInt(lec_qthr);
		int lec_qfou_no= Integer.parseInt(lec_qfou);
		int lec_qfiv_no= Integer.parseInt(lec_qfiv);
		int lec_qsix_no= Integer.parseInt(lec_qsix);

		service.evalApp(new Lec_Eval(lec_app_code_no,lec_qone_no,lec_qtwo_no,lec_qthr_no,lec_qfou_no,lec_qfiv_no,lec_qsix_no,lec_qsev,lec_qeig));
		
		Cally_Member loginUser = (Cally_Member) req.getSession().getAttribute("loginUser");
		int mem_num = loginUser.getMem_num();
		
		m.addAttribute("list", service.sel_eval(mem_num));
		return "view/lecture/class/eval";		
	} 
	
	/*휴학*/
	//휴학신청
	@RequestMapping(value="/leave_app")
	public String leaveApp(HttpServletRequest req, Model m) {
		Cally_Member loginUser = (Cally_Member) req.getSession().getAttribute("loginUser");
		int mem_num = loginUser.getMem_num();
		
		String lec_res_code = req.getParameter("lec_res_code");
		String year = req.getParameter("year");
		String sem =  req.getParameter("sem");
		
		int lec_res_code_no= Integer.parseInt(lec_res_code);
		
		String lec_sem_code = year+sem;
		
		int lec_sem_code_no= Integer.parseInt(lec_sem_code);


		System.out.println("코드:"+lec_res_code_no);
		
		System.out.println("셈코드:"+lec_sem_code_no);
		
		System.out.println("dd:"+mem_num);

		service.leaveApp(new Lec_Eval(mem_num, lec_res_code_no, lec_sem_code_no));
		
		return "view/lecture/register/leaved";		
	} 
	
	//휴학정보불러오기
	@RequestMapping(value="/leave")
	public String leavInfo(Model m, HttpServletRequest req) {
		Cally_Member loginUser = (Cally_Member) req.getSession().getAttribute("loginUser");
		int mem_num = loginUser.getMem_num();
		
		 Date today = new Date();
		 System.out.println(today);
		 SimpleDateFormat year = new SimpleDateFormat("yy");
		 SimpleDateFormat month = new SimpleDateFormat("MM");
		 String yeard = year.format(today);
		 String montht = month.format(today);
		 int monthtt = Integer.parseInt(montht);
		 String sem;
		 if(monthtt > 6) {sem = "2";}
		 else {sem = "1";}
		 String lec_leav_codes = yeard+sem+"000"; 
		 int lec_leav_code_no= Integer.parseInt(lec_leav_codes);
		 int lec_leav_code=lec_leav_code_no+mem_num;
		 
		m.addAttribute("a", service.leaveInfo(mem_num,lec_leav_code));
		
		return lec_service.lectureStinfo(req, m);
	}
	
	//복학	
	@RequestMapping(value="/back", method=RequestMethod.POST)
	public String lecBack(Model m, HttpServletRequest req) {
		Cally_Member loginUser = (Cally_Member) req.getSession().getAttribute("loginUser");
		int mem_num = loginUser.getMem_num();
		String leav_code = req.getParameter("leav_code");
		int lec_leav_code= Integer.parseInt(leav_code);
		
		Map<String, Object> param = new HashMap<>();
		param.put("mem_num", mem_num);
		param.put("lec_leav_code", lec_leav_code);
		
		session.selectOne("mapper.lec.lectureMapper.p_lec_back_app",param);
		
		return lec_service.lectureStinfo(req, m);
	}
	
	/*주소들*/
	@RequestMapping(value="/lec_enroll", method=RequestMethod.GET)
	public String lectureSearch() {
		return "view/lecture/class/enroll";
	}
	
	//class
	@RequestMapping(value="/plan", method=RequestMethod.GET)
	public String lecturePlan() {
		return "view/lecture/class/plan";
	}
	
	@RequestMapping(value="/all_time", method=RequestMethod.GET)
	public String lectureAllTime() {
		return "view/lecture/class/all_time";
	}
	
	@RequestMapping(value="/apply", method=RequestMethod.GET)
	public String lectureApply() {
		return "view/lecture/class/apply";
	}
	
	@RequestMapping(value="/indi_time", method=RequestMethod.GET)
	public String lectureIndiTime() {
		return "view/lecture/class/indi_time";
	}
	
	@RequestMapping(value="/_eval", method=RequestMethod.GET)
	public String lectureEval() {
		return "view/lecture/class/eval";
	}
	
	
	//record
	@RequestMapping(value="/all", method=RequestMethod.GET)
	public String lectureAll() {
		return "view/lecture/record/all";
	}
	
	@RequestMapping(value="/this", method=RequestMethod.GET)
	public String lectureThis() {
		
		return "view/lecture/record/this";
	}
	
	@RequestMapping(value="/giveup", method=RequestMethod.GET)
	public String lectureGiveup() {
		return "view/lecture/record/giveup";
	}
	
	//register
	
	  @Inject
	  private Lec_Service lec_service;
	   
	  @RequestMapping(value="/leave_", method=RequestMethod.GET)
	  public String lectureMain(HttpServletRequest req, Model m) {
	      
	     return lec_service.lectureStinfo(req, m);
	   }
	
	@RequestMapping(value="/back_", method=RequestMethod.GET)
	public String lectureBack() {
		return "view/lecture/register/back";
	}

	
}
