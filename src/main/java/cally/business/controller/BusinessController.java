package cally.business.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import cally.business.beans.Biz_calendar;
import cally.business.beans.Biz_comment;
import cally.business.beans.Biz_notice;
import cally.business.beans.Biz_pj;
import cally.business.beans.Biz_share;
import cally.business.beans.Biz_task;
import cally.business.service.Biz_calendar_Service;
import cally.business.service.Biz_comment_Service;
import cally.business.service.Biz_notice_Service;
import cally.business.service.Biz_pj_Service;
import cally.business.service.Biz_share_Service;
import cally.business.service.Biz_task_Service;
import cally.sharing.dao.Cally_Dao;

@Controller
@RequestMapping(value="/business")
public class BusinessController {
	
	@Inject private Biz_calendar_Service c_service;
	@Inject private Biz_pj_Service p_service;
	@Inject private Biz_comment_Service cmt_service;
	@Inject private Biz_task_Service t_service;
	@Inject private Biz_share_Service s_service;
	@Inject private Biz_notice_Service n_service;
	@Inject private Cally_Dao cally_dao;
	
	@Resource(name="uploadPath")
	private String upath;
	
	//메인 - 전체일정
	@RequestMapping(value="/business_main", method=RequestMethod.GET)
	public String businessMain_g(HttpServletRequest request) {
		return "view/business/business_main";
	}
	
	//회원아이디 검색
	@ResponseBody
	@RequestMapping(value="/mem_search", method=RequestMethod.GET, produces = "application/text; charset=utf8")
	public String bizMemSearch(HttpServletRequest request) {
		if(cally_dao.checkId(request.getParameter("mem_id"))) {
			return "y";
		}else {
			return "n";
		}
	}
	
	//메인 - 전체일정 json
	@ResponseBody
	@RequestMapping(value="/business_main", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	public String businessMain_p(HttpServletRequest request) {
		int mem_num = c_service.getMem_num(request);
		List<Biz_calendar> c_list = c_service.selCalendar(mem_num);
		HashMap<String, Object> hmap = new HashMap<>();		
		hmap.put("mem_num", mem_num);
		hmap.put("task_state", 'y');
		List<Biz_task> t_list = t_service.selTask(hmap);
		ArrayList<Object> list = new ArrayList<>();
		list.add(c_list);
		list.add(t_list);
		Gson gson = new Gson();
		return gson.toJson(list);
	}

	//중요일정
	@RequestMapping(value="/important", method=RequestMethod.GET)
	public String bizCalImportant_g(HttpServletRequest request, Model m) {
		m.addAttribute("im_type", "all");
		return "view/business/biz_important";
	}
	
	//중요일정 - 전체
	@ResponseBody
	@RequestMapping(value="/important_all", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	public String bizAllImportant_p(HttpServletRequest request, Model m) {
		int mem_num = c_service.getMem_num(request);
		List<Biz_calendar> c_list_im = c_service.selCalendar_im(mem_num);
		List<Biz_task> t_list_im = t_service.selTask_im(mem_num);
		ArrayList<Object> list = new ArrayList<>();
		list.add(c_list_im);
		list.add(t_list_im);
		Gson gson = new Gson();
		String im_type = request.getParameter("im_type");
		m.addAttribute("im_type", im_type);
		return gson.toJson(list);
	}
	
	//중요일정 - 캘린더
	@ResponseBody
	@RequestMapping(value="/important_cal", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	public String bizCalImportant_p(HttpServletRequest request, Model m) {
		int mem_num = c_service.getMem_num(request);
		List<Biz_calendar> c_list_im = c_service.selCalendar_im(mem_num);
		Gson gson = new Gson();
		String im_type = request.getParameter("im_type");
		m.addAttribute("im_type", im_type);
		return gson.toJson(c_list_im);
	}
	
	//중요일정 - 프로젝트
	@ResponseBody
	@RequestMapping(value="/important_task", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	public String bizTaskImportant_p(HttpServletRequest request, Model m) {
		int mem_num = c_service.getMem_num(request);
		List<Biz_task> t_list_im = t_service.selTask_im(mem_num);
		Gson gson = new Gson();
		String im_type = request.getParameter("im_type");
		m.addAttribute("im_type", im_type);
		return gson.toJson(t_list_im);
	}
	
	//내 캘린더
	@RequestMapping(value="/mycalendar", method=RequestMethod.GET)
	public String bizMyCal_g() {
		return "view/business/biz_cal";
	}
	
	//캘린더 json
	@ResponseBody
	@RequestMapping(value="/mycalendar", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	public String bizMyCal_p(HttpServletRequest request) {
		int mem_num = c_service.getMem_num(request);
		List<Biz_calendar> c_list = c_service.selCalendar(mem_num);
		Gson gson = new Gson();
		return gson.toJson(c_list);
	}
	
	//캘린더 상세
	@ResponseBody
	@RequestMapping(value="/cal_detail", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	public String bizCal_datail(HttpServletRequest request) {
		HashMap<String, Object> hmap = new HashMap<>();
		hmap.put("cal_code", Integer.parseInt(request.getParameter("code")));
		hmap.put("mem_num", c_service.getMem_num(request));
		Gson gson = new Gson();
		return gson.toJson(c_service.selCal_detail(hmap));
	}
	
	//캘린더 작성
	@RequestMapping(value="/mycal_add", method=RequestMethod.POST)
	public String bizMyCal_add(@ModelAttribute("Biz_calendar") Biz_calendar bc, MultipartFile file_cal, HttpServletRequest request) {
		//이름랜덤생성		
		UUID uid = UUID.randomUUID();
		String oname = file_cal.getOriginalFilename();
		String fname = uid.toString() + "_" + oname;
		File cal_file = new File(upath, fname);
		if(oname == "") {
			bc.setCal_file("");
		}else {
			bc.setCal_file(fname);
		}
		try {
			FileCopyUtils.copy(file_cal.getBytes(), cal_file);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		if(request.getParameter("cal_important") == null) bc.setCal_important('n');
		c_service.inCalendar(bc);
		return "view/business/biz_cal";
	}
	
	//캘린더 날짜 수정
	@ResponseBody
	@RequestMapping(value="/cal_date_up", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public String bizMyCal_dateUp(HttpServletRequest request) {
		HashMap<String, Object> hmap = new HashMap<>();		
		hmap.put("mem_num", Integer.parseInt(request.getParameter("mem_num")));
		hmap.put("cal_code", Integer.parseInt(request.getParameter("code")));
		hmap.put("cal_start", request.getParameter("start"));
		hmap.put("cal_end", request.getParameter("end"));
		c_service.upCal_date(hmap);
		int mem_num = c_service.getMem_num(request);
		List<Biz_calendar> c_list = c_service.selCalendar(mem_num);
		Gson gson = new Gson();
		return gson.toJson(c_list);
	}
	
	//캘린더 수정
	@ResponseBody
	@RequestMapping(value="/cal_up", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public String bizMyCal_Up(@ModelAttribute("Biz_calendar") Biz_calendar bc, MultipartFile file_cal, HttpServletRequest request) {
		//이름랜덤생성		
		UUID uid = UUID.randomUUID();
		String oname = file_cal.getOriginalFilename();
		String fname = uid.toString() + "_" + oname;
		File cal_file = new File(upath, fname);
		if(oname == "") {
			bc.setCal_file("");
		}else {
			bc.setCal_file(fname);
		}
		try {
			FileCopyUtils.copy(file_cal.getBytes(), cal_file);
		} catch (IOException e) {
			e.printStackTrace();
		}
		if(request.getParameter("cal_important") == null) bc.setCal_important('n');
		c_service.upCalendar(bc);
		return "y";
	}
	
	//캘린더 삭제
	@ResponseBody
	@RequestMapping(value="/cal_del", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public String bizMyCal_Del(HttpServletRequest request) {
		HashMap<String, Object> hmap = new HashMap<>();
		hmap.put("mem_num", c_service.getMem_num(request));
		hmap.put("cal_code", Integer.parseInt(request.getParameter("cal_code")));
		c_service.delCalendar(hmap);
		return "y";
	}
	
	
	//전체 프로젝트
	@RequestMapping(value="/myallproject", method=RequestMethod.GET, produces = "application/text; charset=utf8")
	public String bizMyAllPJ(HttpServletRequest request, Model m) {
		m.addAttribute("title", "전체 프로젝트");
		m.addAttribute("pj_list", p_service.selAll_Pj_list(c_service.getMem_num(request)));
		return "view/business/biz_pj";
	}
	
	//진행중인 프로젝트
	@RequestMapping(value="/myproject", method=RequestMethod.GET, produces = "application/text; charset=utf8")
	public String bizMyPJ(HttpServletRequest request, Model m) {
		m.addAttribute("title", "진행중인 프로젝트");
		m.addAttribute("pj_list", p_service.selPj_list(c_service.getMem_num(request)));
		return "view/business/biz_pj";
	}
	
	//프로젝트 작성
	@RequestMapping(value="/mypj_add", method=RequestMethod.POST)
	public String bizMyPj_add(@ModelAttribute("Biz_pj") Biz_pj bp, MultipartFile file_pj, HttpServletRequest request, Model m) {
		//이름랜덤생성		
		UUID uid = UUID.randomUUID();
		String oname = file_pj.getOriginalFilename();
		String fname = uid.toString() + "_" + oname;
		File pj_file = new File(upath, fname);
		if(oname == "") {
			bp.setPj_file("");
		}else {
			bp.setPj_file(fname);
		}
		try {
			FileCopyUtils.copy(file_pj.getBytes(), pj_file);
		} catch (IOException e) {
			e.printStackTrace();
		}
		if(request.getParameter("pj_important") == null) bp.setPj_important('n');
		p_service.inProject(bp);
		m.addAttribute("title", "진행중인 프로젝트");
		m.addAttribute("pj_list", p_service.selPj_list(c_service.getMem_num(request)));
		return "view/business/biz_pj";
	}
	
	//프로젝트 상세
	@RequestMapping(value="/pj_detail", method=RequestMethod.GET, produces = "application/text; charset=utf8")
	public String bizPj_detail(HttpServletRequest request, Model m) {
		HashMap<String, Object> hmap = new HashMap<>();		
		int pj_code = Integer.parseInt(request.getParameter("pj_code"));
		hmap.put("pj_code", pj_code);
		hmap.put("mem_num", c_service.getMem_num(request));
		m.addAttribute("pj_code", pj_code);
		m.addAttribute("pj_detail", p_service.selPj_detail(hmap));
		m.addAttribute("my_auth_code", s_service.selAuth_code(hmap));
		m.addAttribute("share_list", s_service.selShare_list(pj_code));
		m.addAttribute("pj_attain", p_service.selPj_attain(pj_code));
		return "view/business/biz_pj_detail";
	}
	
	//프로젝트 삭제
	@ResponseBody
	@RequestMapping(value="/mypj_delete", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	public String bizMyPj_del(HttpServletRequest request) {
		HashMap<String, Object> hmap = new HashMap<>();	
		hmap.put("pj_code", Integer.parseInt(request.getParameter("pj_code")));
		hmap.put("mem_num", c_service.getMem_num(request));
		p_service.delProject(hmap);
		return "y";
	}
	
	//프로젝트 완료일자 업데이트(삭제 및 sysdate)
	@ResponseBody
	@RequestMapping(value="/mypj_complete", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	public String bizPj_complete_up(HttpServletRequest request) {
		HashMap<String, Object> hmap = new HashMap<>();	
		hmap.put("pj_code", Integer.parseInt(request.getParameter("pj_code")));
		hmap.put("mem_num", c_service.getMem_num(request));
		hmap.put("state", request.getParameter("state").charAt(0));
		p_service.upPj_complete(hmap);
		return "y";
	}
	
	//프로젝트 수정
	@ResponseBody
	@RequestMapping(value="/pj_up", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public String bizPj_up(@ModelAttribute("Biz_pj") Biz_pj bp, MultipartFile file_pj, HttpServletRequest request) {
		//이름랜덤생성		
		UUID uid = UUID.randomUUID();
		String oname = file_pj.getOriginalFilename();
		String fname = uid.toString() + "_" + oname;
		File pj_file = new File(upath, fname);
		if(oname == "") {
			bp.setPj_file("");
		}else {
			bp.setPj_file(fname);
		}
		try {
			FileCopyUtils.copy(file_pj.getBytes(), pj_file);
		} catch (IOException e) {
			e.printStackTrace();
		}
		if(request.getParameter("pj_important") == null) bp.setPj_important('n');
		bp.setMem_num(c_service.getMem_num(request));
		p_service.upPj(bp);
		return "y";
	}
	
	
	//나의 프로젝트 검색
	@RequestMapping(value="/pj_search", method=RequestMethod.GET, produces = "application/text; charset=utf8")
	public String bizPj_search(HttpServletRequest request, Model m) {
		HashMap<String, Object> hmap = new HashMap<>();
		hmap.put("search", request.getParameter("search"));
		hmap.put("mem_num", c_service.getMem_num(request));
		m.addAttribute("title", "검색 결과");
		m.addAttribute("pj_list", p_service.selPj_search(hmap));
		return "view/business/biz_pj";
	}
	
	
	//캘린더 날짜 수정
	@ResponseBody
	@RequestMapping(value="/pj_title", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public String bizPj_title(HttpServletRequest request) {
		List<Map<String, Object>> p_list = p_service.selPj_title(c_service.getMem_num(request));
		Gson gson = new Gson();
		return gson.toJson(p_list);
	}
	
	//전체 업무내역
	@RequestMapping(value="/task", method=RequestMethod.GET, produces = "application/text; charset=utf8")
	public String bizTask_state(HttpServletRequest request, Model m) {
		HashMap<String, Object> hmap = new HashMap<>();		
		int pj_code = Integer.parseInt(request.getParameter("pj_code"));
		String title = "";
		hmap.put("pj_code", pj_code);
		if(request.getParameter("state") == null) {
			hmap.put("task_state", 'y');
		}else {
			if(request.getParameter("state").charAt(0) == 'n') { title = "수락대기"; }
			hmap.put("task_state", request.getParameter("state").charAt(0));
		}
		m.addAttribute("task_list", t_service.selTask_state(hmap));
		m.addAttribute("share_list", s_service.selShare_list(pj_code));
		hmap.put("mem_num", c_service.getMem_num(request));
		m.addAttribute("my_auth_code", s_service.selAuth_code(hmap));
		m.addAttribute("pj_code", request.getParameter("pj_code"));
		m.addAttribute("title", title);
		return "view/business/biz_task";
	}
	
	//나의 업무내역
	@RequestMapping(value="/mytask", method=RequestMethod.GET)
	public String bizMyTask(HttpServletRequest request, Model m) {
		HashMap<String, Object> hmap = new HashMap<>();
		hmap.put("mem_num", c_service.getMem_num(request));
		String title = "진행중인 업무내역";
		if(request.getParameter("state") == null) {
			hmap.put("task_state", 'y');
		}else {
			hmap.put("task_state", request.getParameter("state").charAt(0));
			if(request.getParameter("state").charAt(0) == 'n') {
				title = "대기중인 업무내역";
			}else if(request.getParameter("state").charAt(0) == 'y'){
				title = "진행중인 업무내역";
			}
		}
		m.addAttribute("task_list", t_service.selTask(hmap));
		m.addAttribute("title", title);
		return "view/business/biz_task_my";
	}
	
	//프로젝트별 나의 업무내역
	@RequestMapping(value="/pj_mytask", method=RequestMethod.GET)
	public String biz_pj_MyTask(HttpServletRequest request, Model m) {
		HashMap<String, Object> hmap = new HashMap<>();
		int pj_code = Integer.parseInt(request.getParameter("pj_code"));
		hmap.put("mem_num", c_service.getMem_num(request));
		hmap.put("pj_code", pj_code);
		m.addAttribute("my_auth_code", s_service.selAuth_code(hmap));
		if(request.getParameter("state") == null) {
			hmap.put("task_state", 'y');
		}else {
			hmap.put("task_state", request.getParameter("state").charAt(0));
		}
		m.addAttribute("pj_code", pj_code);
		m.addAttribute("task_list", t_service.sel_pjTask(hmap));
		m.addAttribute("share_list", s_service.selShare_list(pj_code));
		return "view/business/biz_task";
	}
	
	
	//업무 상세 - 메인
	@ResponseBody
	@RequestMapping(value="/task_detail", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	public String bizTask_detail(HttpServletRequest request) {
		HashMap<String, Object> hmap = new HashMap<>();
		hmap.put("pj_t_code", Integer.parseInt(request.getParameter("code")));
		if(request.getParameter("mem_num") == null) {
			hmap.put("mem_num", c_service.getMem_num(request));
		}else {
			hmap.put("mem_num", Integer.parseInt(request.getParameter("mem_num")));
		}
		Gson gson = new Gson();
		System.out.println(gson.toJson(t_service.selTask_detail(hmap)));
		return gson.toJson(t_service.selTask_detail(hmap));
	}
	
	//업무 작성
	@ResponseBody
	@RequestMapping(value="/task_add", method=RequestMethod.POST)
	public String bizTask_add(@ModelAttribute("Biz_task") Biz_task bt, MultipartFile file_task, HttpServletRequest request, Model m) {
		//이름랜덤생성		
		UUID uid = UUID.randomUUID();
		String oname = file_task.getOriginalFilename();
		String fname = uid.toString() + "_" + oname;
		File task_file = new File(upath, fname);
		if(oname == "") {
			bt.setTask_file("");
		}else {
			bt.setTask_file(fname);
		}
		try {
			FileCopyUtils.copy(file_task.getBytes(), task_file);
		} catch (IOException e) {
			e.printStackTrace();
		}
		if(request.getParameter("task_important") == null) bt.setTask_important('n');
		HashMap<String, Object> hmap = new HashMap<>();
		hmap.put("pj_code", Integer.parseInt(request.getParameter("pj_code")));
		hmap.put("mem_num", c_service.getMem_num(request));
		int share_code = s_service.selSharecode(hmap);
		bt.setShare_code(share_code);
		t_service.inTask(bt);
		return "y";
	}
	
	//업무 수정
	@ResponseBody
	@RequestMapping(value="/task_up", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public String bizTask_up(@ModelAttribute("Biz_task") Biz_task bt, MultipartFile file_task, HttpServletRequest request) {
		//이름랜덤생성		
		UUID uid = UUID.randomUUID();
		String oname = file_task.getOriginalFilename();
		String fname = uid.toString() + "_" + oname;
		File task_file = new File(upath, fname);
		if(oname == "") {
			bt.setTask_file("");
		}else {
			bt.setTask_file(fname);
		}
		try {
			FileCopyUtils.copy(file_task.getBytes(), task_file);
		} catch (IOException e) {
			e.printStackTrace();
		}
		if(request.getParameter("task_important") == null) bt.setTask_important('n');
		t_service.upTask(bt);
		return "y";
	}
	
	//업무 삭제
	@ResponseBody
	@RequestMapping(value="/task_del", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public String bizTask_del(HttpServletRequest request) {
		HashMap<String, Object> hmap = new HashMap<>();
		hmap.put("pj_t_code", request.getParameter("pj_t_code"));
		hmap.put("mem_num", c_service.getMem_num(request));
		t_service.delTask(hmap);
		return "y";
	}
	
	
	//업무 승인
	@ResponseBody
	@RequestMapping(value="/task_state_up", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public String bizTask_state_up(HttpServletRequest request) {
		HashMap<String, Object> hmap = new HashMap<>();
		hmap.put("pj_t_code", request.getParameter("pj_t_code"));
		hmap.put("pj_code", request.getParameter("pj_code"));
		hmap.put("mem_num", c_service.getMem_num(request));
		t_service.upTask_state(hmap);
		return "y";
	}
	
	//프로젝트 작성폼
	@RequestMapping(value="/biz_pj_addForm", method=RequestMethod.GET, produces = "application/text; charset=utf8")
	public String bizMyPJ_add(HttpServletRequest request, Model m) {
		return "view/business/biz_pj_addForm";
	}
	
	//나의 전체 업무 검색
	@RequestMapping(value="/mytask_search", method=RequestMethod.GET, produces = "application/text; charset=utf8")
	public String bizTask_search(HttpServletRequest request, Model m) {
		HashMap<String, Object> hmap = new HashMap<>();
		hmap.put("search", request.getParameter("search"));
		hmap.put("mem_num", c_service.getMem_num(request));
		m.addAttribute("title", "검색 결과");
		m.addAttribute("task_list", t_service.selMytask_search(hmap));
		String title = "진행중인 업무내역";
		if(request.getParameter("state") == null) {
			hmap.put("task_state", 'y');
		}else {
			hmap.put("task_state", request.getParameter("state").charAt(0));
			if(request.getParameter("state").charAt(0) == 'n') {
				title = "대기중인 업무내역";
			}else if(request.getParameter("state").charAt(0) == 'y'){
				title = "진행중인 업무내역";
			}
		}
		m.addAttribute("title", title);
		return "view/business/biz_task_my";
	}
	
	//프로젝트 내 업무 검색
	@RequestMapping(value="/pjtask_search", method=RequestMethod.GET, produces = "application/text; charset=utf8")
	public String bizMytask_search(HttpServletRequest request, Model m) {
		HashMap<String, Object> hmap = new HashMap<>();
		int pj_code = Integer.parseInt(request.getParameter("pj_code"));
		hmap.put("search", request.getParameter("search"));
		hmap.put("pj_code", pj_code);
		m.addAttribute("task_list", t_service.selPjtask_search(hmap));
		m.addAttribute("share_list", s_service.selShare_list(pj_code));
		hmap.put("mem_num", c_service.getMem_num(request));
		m.addAttribute("my_auth_code", s_service.selAuth_code(hmap));
		m.addAttribute("pj_code", pj_code);
		return "view/business/biz_task";
	}
	
	//프로젝트 날짜 수정
	@ResponseBody
	@RequestMapping(value="/task_date_up", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	public String bizMyTask_dateUp(HttpServletRequest request) {
		HashMap<String, Object> hmap = new HashMap<>();		
		hmap.put("pj_t_code", Integer.parseInt(request.getParameter("code")));
		hmap.put("task_start", request.getParameter("start"));
		hmap.put("task_end", request.getParameter("end"));
		t_service.upTask_date(hmap);
		hmap = new HashMap<>();		
		hmap.put("mem_num", c_service.getMem_num(request));
		hmap.put("task_state", 'y');
		List<Biz_task> t_list = t_service.selTask(hmap);
		Gson gson = new Gson();
		return gson.toJson(t_list);
	}
	
	//초대 혹은 수락대기중인 회원리스트
	@ResponseBody
	@RequestMapping(value="/share_invite", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	public String bizShare_invite(HttpServletRequest request) {
		Gson gson = new Gson();
		int pj_code = Integer.parseInt(request.getParameter("pj_code"));
		List<Biz_share> s_i_list = s_service.selShare_invite(pj_code);
		return gson.toJson(s_i_list);
	}
	
	// 내 프로젝트 - 코멘트
	@RequestMapping(value="/comment", method=RequestMethod.GET, produces = "application/text; charset=utf8")
	public String bizCmt(HttpServletRequest request, Model m) {
		int pj_code = Integer.parseInt(request.getParameter("pj_code"));
		m.addAttribute("cmt_list", cmt_service.selPj_cmt(pj_code));
		m.addAttribute("share_list", s_service.selShare_list(pj_code));
		HashMap<String, Object> hmap = new HashMap<>();
		hmap.put("pj_code", pj_code);
		hmap.put("mem_num", c_service.getMem_num(request));
		m.addAttribute("my_auth_code", s_service.selAuth_code(hmap));
		m.addAttribute("pj_code", pj_code);
		return "view/business/biz_comment";
	}
	
	// 내 프로젝트의 코멘트 삭제
	@ResponseBody
	@RequestMapping(value="/comment_del", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	public String bizCmt_del(HttpServletRequest request, Model m) {
		HashMap<String, Object> hmap = new HashMap<>();
		int pj_code = Integer.parseInt(request.getParameter("pj_code"));
		hmap.put("cmt_code", Integer.parseInt(request.getParameter("cmt_code")));
		hmap.put("pj_code", pj_code);
		hmap.put("mem_num", c_service.getMem_num(request));
		cmt_service.delCmt(hmap);
		Gson gson = new Gson();
		List<Biz_comment> c_list = cmt_service.selPj_cmt(pj_code);
		m.addAttribute("share_list", s_service.selShare_list(pj_code));
		m.addAttribute("my_auth_code", s_service.selAuth_code(hmap));
		return gson.toJson(c_list);
	}
	
	//코멘트 작성
	@ResponseBody
	@RequestMapping(value="/comment_in", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	public String bizCmt_in(HttpServletRequest request, Model m) {
		HashMap<String, Object> hmap = new HashMap<>();
		int pj_code = Integer.parseInt(request.getParameter("pj_code"));
		hmap.put("pj_code", pj_code);
		hmap.put("cmt_content", request.getParameter("cmt_content"));
		hmap.put("mem_num", c_service.getMem_num(request));
		cmt_service.inCmt(hmap);
		Gson gson = new Gson();
		List<Biz_comment> c_list = cmt_service.selPj_cmt(pj_code);
		m.addAttribute("share_list", s_service.selShare_list(pj_code));
		m.addAttribute("my_auth_code", s_service.selAuth_code(hmap));
		return gson.toJson(c_list);
	}
	
	
	//회원권한 업데이트 및 삭제
	@ResponseBody
	@RequestMapping(value="/auth_update", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	public String bizAuth_codeUp(HttpServletRequest request, Model m) {
		HashMap<String, Object> hmap = new HashMap<>();	
		int pj_code = Integer.parseInt(request.getParameter("pj_code"));
		int auth_code = Integer.parseInt(request.getParameter("auth_code"));
		hmap.put("pj_code", pj_code);
		hmap.put("mem_num", c_service.getMem_num(request));
		hmap.put("share_code", Integer.parseInt(request.getParameter("share_code")));
		hmap.put("auth_code", auth_code);
		if(auth_code == 999) {
			s_service.delShare(hmap);
		}else {
			s_service.upAuth_code(hmap);
		}
		List<Biz_share> s_list = s_service.selShare_list(pj_code);
		Gson gson = new Gson();
		return gson.toJson(s_list);
	}
	
	// 내 프로젝트 - 타임라인
	@RequestMapping(value = "/timeline", method = RequestMethod.GET)
	public String bizTimeline(HttpServletRequest request, Model m) {
		int mem_num = c_service.getMem_num(request);
		Gson gson = new Gson();
		m.addAttribute("pj_list", gson.toJson(p_service.selAll_Pj_list(mem_num)));
		HashMap<String, Object> hmap = new HashMap<>();
		hmap.put("mem_num", mem_num); hmap.put("task_state", 'y');
		m.addAttribute("task_list", gson.toJson(t_service.selTask(hmap)));
		return "view/business/biz_timeline";
	}
/*
	// 내 프로젝트 - 분석
	@RequestMapping(value = "/analysis", method = RequestMethod.GET)
	public String bizAnalysis() {
		return "view/business/biz_analysis";
	}
	*/
	// 지난 사용자 알림
	@RequestMapping(value="/notice_all", method=RequestMethod.GET, produces = "application/text; charset=utf8")
	public String bizNotice_get(HttpServletRequest request, Model m) {
		m.addAttribute("notice_list", n_service.selNotice_all(c_service.getMem_num(request)));
		m.addAttribute("title", "전체 알림 내역");
		System.out.println(n_service.selNotice_all(c_service.getMem_num(request)));
		return "view/business/biz_notice";
	}
	
	// 사용자 알림
	@ResponseBody
	@RequestMapping(value="/notice", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	public String bizNotice(HttpServletRequest request, Model m) {
		int mem_num = c_service.getMem_num(request);
		List<Biz_notice> n_list = n_service.selNotice(mem_num);
		Gson gson = new Gson();
		return gson.toJson(n_list);
	}
	
	
	// 사용자 알림 검색
	@RequestMapping(value="/notice_search", method=RequestMethod.GET, produces = "application/text; charset=utf8")
	public String bizNotice_search(HttpServletRequest request, Model m) {
		HashMap<String, Object> hmap = new HashMap<>();
		hmap.put("search", request.getParameter("search"));
		hmap.put("mem_num", c_service.getMem_num(request));
		m.addAttribute("title", "검색 결과");
		m.addAttribute("notice_list", n_service.selNotice_search(hmap));
		return "view/business/biz_notice";
	}
	
	//새로운 알림 갯수
	@ResponseBody
	@RequestMapping(value="/notice_new", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	public String bizNotice_new(HttpServletRequest request, Model m) {
		return ""+n_service.selNotice_new(c_service.getMem_num(request));
	}
	
	
	//사용자 알림 삭제
	@ResponseBody
	@RequestMapping(value="/notice_del", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	public String bizNotice_del(HttpServletRequest request, Model m) {
		System.out.println(request.getParameter("user_n_code"));
		n_service.delNotice(Integer.parseInt(request.getParameter("user_n_code")));
		return "y";
	}
	
	
	//사용자 알림 작성 - msg
	@ResponseBody
	@RequestMapping(value="/notice_msg", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	public String bizNotice_msg(HttpServletRequest request, Model m) {
		HashMap<String, Object> hmap = new HashMap<>();
		System.out.println(request.getParameter("pj_code"));
		if(request.getParameter("pj_code") != "") {
			int mem_num = c_service.getMem_num(request);
			hmap.put("pj_code", Integer.parseInt(request.getParameter("pj_code")));
			hmap.put("mem_num", mem_num);
			int share_code = s_service.selSharecode(hmap);
			hmap.put("sender_code", share_code);
		}else {
			hmap.put("sender_code", Integer.parseInt(request.getParameter("sender_code")));
		}
		hmap.put("addressee_code", Integer.parseInt(request.getParameter("addressee_code")));
		hmap.put("notice_content", request.getParameter("notice_content"));
		hmap.put("state_code", Integer.parseInt(request.getParameter("state_code")));
		n_service.inNotice_msg(hmap);
		return "y";
	}
	
	//사용자 알림 작성 - msg 답장
	@ResponseBody
	@RequestMapping(value="/notice_msg_re", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	public String bizNotice_msg_re(HttpServletRequest request, Model m) {
		HashMap<String, Object> hmap = new HashMap<>();
		hmap.put("addressee_code", Integer.parseInt(request.getParameter("addressee_code")));
		hmap.put("sender_code", Integer.parseInt(request.getParameter("sender_code")));
		hmap.put("notice_content", request.getParameter("notice_content"));
		hmap.put("state_code", Integer.parseInt(request.getParameter("state_code")));
		n_service.inNotice_msg(hmap);
		return "y";
	}
	
	//멤버 초대
	@ResponseBody
	@RequestMapping(value="/notice_invite", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	public String bizNotice_invite(HttpServletRequest request, Model m) {
		HashMap<String, Object> hmap = new HashMap<>();
		hmap.put("mem_id", request.getParameter("mem_id")); //초대회원의 아이디
		hmap.put("sender_code", request.getParameter("sender_code")); //초대자의 공유번호
		hmap.put("notice_content", request.getParameter("notice_content"));
		hmap.put("pj_code", Integer.parseInt(request.getParameter("pj_code")));
		n_service.inNotice_invite(hmap);
		return "y";
	}
	
	
	//사용자 알림 상태 업데이트
	@ResponseBody
	@RequestMapping(value="/notice_state", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	public String bizNotice_state(HttpServletRequest request, Model m) {
		HashMap<String, Object> hmap = new HashMap<>();
		int user_n_code = Integer.parseInt(request.getParameter("user_n_code"));
		if(Integer.parseInt(request.getParameter("state_code")) == 3) {
			hmap.put("user_n_code", user_n_code);
			hmap.put("state_code", Integer.parseInt(request.getParameter("up_state_code")));
			hmap.put("addressee_code", Integer.parseInt(request.getParameter("addressee_code")));
			hmap.put("sender_code", Integer.parseInt(request.getParameter("sender_code")));					
			n_service.upNotice_invite(hmap);
		}else {
			n_service.upNotice_state(user_n_code);
		}
		return "y";
	}
}