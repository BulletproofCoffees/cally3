package cally.lecture.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import cally.lecture.beans.Lec_Eval;
import cally.lecture.beans.Lec_Lecsearch;
import cally.lecture.beans.Lec_StInfo;
import cally.lecture.dao.Lec_Dao;
import cally.sharing.beans.Cally_Member;

@Repository
public class Lec_Service {
	@Inject
	private Lec_Dao lec_dao;
	public String lectureMain(HttpServletRequest req, Model m) {
		Cally_Member loginUser = (Cally_Member) req.getSession().getAttribute("loginUser");
		int mem_num = loginUser.getMem_num();
		
		String result = lec_dao.lectureMain(mem_num);
		m.addAttribute("stinfo", result);
		
		return "view/lecture/lecture_main";
		
	}
	
	public String lectureStinfo(HttpServletRequest req, Model m) {
		Cally_Member loginUser = (Cally_Member) req.getSession().getAttribute("loginUser");
		int mem_num = loginUser.getMem_num();
		
		String result = lec_dao.lectureMain(mem_num);
		m.addAttribute("stinfo", result);
		
		return "view/lecture/register/leave";
		
	}
	
	public void doService(Lec_StInfo e) {

	}
	
	//강의리스트	
	public List<Lec_Lecsearch> lec_list() {
		return lec_dao.lec_list();
	}
	
	//강의검색
	public List<Lec_Lecsearch> searchLecList(Lec_Lecsearch e) {
		return lec_dao.lec_s_list(e);
	}

	//개인강의검색 - apply.jsp
	public List<Lec_Lecsearch> searchIndiLec(Lec_Lecsearch e) {
		return lec_dao.lec_indi_list(e);
	}
	
	//개인강의삭제 -apply.jsp
	public void lecDel(Lec_Lecsearch e) {
		lec_dao.lec_del(e);
	}
	
	//개인강의시간표검색 - indi_time.jsp
	public List<Lec_Lecsearch> searchTimeLec(Lec_Lecsearch e) {
		return lec_dao.lec_time_list(e);
	}
	
	public void lecApp(Lec_Lecsearch e) {
		lec_dao.lec_app_pro(e);
	}
	
	//강의평가 - 강의목록 - eval.jsp
	public List<Lec_Lecsearch> sel_eval(int mem_num) {
		return lec_dao.sel_eval(mem_num);
	}
	
	//강의평가 - 평가목록 - eval.jsp
	public Map<String,Object> list_eval(int lec_app_code) {
		return lec_dao.list_eval(lec_app_code);
	}
	
	//강의평가 - 입력
	public void evalApp(Lec_Eval e) {
		lec_dao.eval_app(e);
	}
	
	/*          휴학신청                        */
	//휴학신청
	public void leaveApp(Lec_Eval e) {
		lec_dao.leave_app(e);
	}
	
	//휴학정보불러오기
	public Map<String,Object> leaveInfo(int mem_num, int lec_leav_code) {
		Map<String, Object> param = new HashMap<>();
		param.put("mem_num", mem_num);
		param.put("lec_leav_code", lec_leav_code);
		return lec_dao.leave_info(param);
	}
	
	
	
}
