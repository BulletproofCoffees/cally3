package cally.acbook.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import cally.acbook.dao.Ac_Acco_Dao;
import cally.acbook.dao.Ac_Help_Dao;

@Service
public class Ac_Acco_Service {
	
	@Inject
	private Ac_Help_Dao help_dao;
	
	@Inject
	private Ac_Acco_Dao acc_dao;
	
	public String firstAccount(Model m, HttpServletRequest request) {
		int mem_num = help_dao.getMem_num(request);
		acc_dao.firstAccount(mem_num);
		return "view/acbook/acbook_main";
	}
	
	public String accoAllList(Model m,  HttpServletRequest request) {
		int mem_num = help_dao.getMem_num(request);
		List<Map<String, Object>> accolist = acc_dao.accoAllList(mem_num);
		m.addAttribute("accolist", accolist);
		return "view/acbook/acbook_accountset";
	}
	
	public void accoUseList(Model m,  HttpServletRequest request) {
		//사용중인 통장리스트를 model에 추가하는 서비스
		int mem_num = help_dao.getMem_num(request);
		List<Map<String, Object>> accolist = acc_dao.accoUseList(mem_num);
		m.addAttribute("accolist", accolist);
	}
	
	public String newAccount(HttpServletRequest request) {
		Map<String, Object> paraMap = help_dao.getParaMap(request);
		if(!paraMap.containsKey("acc_useyn")) {
			//사용함에 체크하지 않음
			paraMap.put("acc_useyn", "n");
		}
		System.out.println("통장 para:" + paraMap.toString());
		//통장 이름이 겹치는지 확인
		if(acc_dao.countName(paraMap) > 0) {
			//이름 겹침
			return "같은 이름의 통장이 있습니다.";
		} else {
		acc_dao.newAccount(paraMap);
		return "새 통장이 추가되었습니다.";
		}
	}
	public String upAccount(HttpServletRequest request) {
		Map<String, Object> paraMap = help_dao.getParaMap(request);
		if(!paraMap.containsKey("acc_useyn")) {
			paraMap.put("acc_useyn", "n");
		}
		acc_dao.upAccount(paraMap);
		return (String) paraMap.get("message");
	}
	
	public String delAccount(HttpServletRequest request) {
		Map<String, Object> paraMap = new HashMap<String, Object>();
		paraMap.put("mem_num", help_dao.getMem_num(request));
		paraMap.put("acc_code", Integer.parseInt(request.getParameter("acc_code")));
		acc_dao.delAccount(paraMap);
		return (String) paraMap.get("message");
	}
}
