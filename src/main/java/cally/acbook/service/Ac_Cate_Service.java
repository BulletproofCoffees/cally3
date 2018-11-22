package cally.acbook.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import cally.acbook.beans.Ac_Sub;
import cally.acbook.dao.Ac_Cate_Dao;
import cally.acbook.dao.Ac_Help_Dao;

@Service
public class Ac_Cate_Service {

	@Inject
	Ac_Cate_Dao cate_dao;
	
	@Inject
	Ac_Help_Dao help_dao;
	
	public String inSubclass(Model m, HttpServletRequest request) {
		if(request.getParameter("sub_name")=="") {
			return "소분류 이름을 입력하십시오.";
		}
		Map<String, Object> paraMap = help_dao.getParaMap(request);
		//같은 대분류 속에 소분류가 15개 미만인지 확인
		if(cate_dao.checkSubCount(paraMap)) {
			//15개 미만임. 추가가능
		} else {
			//15개임. 추가불가능
			return "해당 대분류의 소분류는 최대 15개까지만 추가할 수 있습니다.";
		}
		//같은 대분류 속에 같은 이름의 소분류가 없는지 확인
		if(cate_dao.checkSubName(paraMap)) {
			//없음. 추가 가능!!
			cate_dao.newSubclass(paraMap);
			return "소분류가 추가되었습니다.";
			
		} else {
			//이미 있음. 추가안함
			return "같은 대분류에 이미 같은 이름의 소분류가 있습니다.";
			
		}
	}
	
	public String upSubclass(Model m, HttpServletRequest request) {
		//소분류 수정
		Map<String, Object> paraMap = help_dao.getParaMap(request);

		if(cate_dao.checkSubName(paraMap)) {
			//같은 이름 없음. 수정 가능!!
			cate_dao.upSubclass(paraMap);
			return "소분류가 수정되었습니다.";
		} else {
			//이미 있음. 수정안함
			return "같은 대분류에 이미 같은 이름의 소분류가 있습니다.";
		}
	}
	
	
	public void delSubclass(Model m, HttpServletRequest request) {
		//소분류 삭제
		Map<String, Object> paraMap = help_dao.getParaMap(request);
		cate_dao.delSubclass(paraMap);
	}
	
	public String getSubList(Model m, HttpServletRequest request) {
		
		int cate_code = 1;
		if(Objects.nonNull(request.getParameter("cate_code"))) { cate_code = Integer.parseInt(request.getParameter("cate_code")); }
		m.addAttribute("cate_code", cate_code);
		
		String cate_name = "주수입";
		
		switch(cate_code) {
		case 2: cate_name="부수입"; break;
		case 3: cate_name="식비"; break;
		case 4: cate_name="주거/통신"; break;
		case 5: cate_name="생활용품"; break;
		case 6: cate_name="의복/미용"; break;
		case 7: cate_name="건강/문화"; break;
		case 8: cate_name="교육/육아"; break;
		case 9: cate_name="교통/차량"; break;
		case 10: cate_name="경조사/회비"; break;
		case 11: cate_name="세금/이자"; break;
		case 12: cate_name="용돈/기타"; break;
		case 13: cate_name="이체/대체"; break;
		case 14: cate_name="카드대금"; break;
		}
		
		m.addAttribute("cate_name", cate_name);
		//기본 소분류
		m.addAttribute("basiclist", cate_dao.getBasicList(cate_code));
		
		//사용자추가 소분류
		Map<String, Object> paraMap = new HashMap<String, Object>();
		paraMap.put("cate_code", cate_code);
		paraMap.put("mem_num", help_dao.getMem_num(request));
		if(cate_code == 13) {
			m.addAttribute("userlist", cate_dao.getUser13(paraMap));
		} else if(cate_code == 14){
			m.addAttribute("userlist", cate_dao.getUser14(paraMap));
		} else {
		m.addAttribute("userlist", cate_dao.getUserList(paraMap));
		}
		return "view/acbook/acbook_category";
	}
	
	public List<Ac_Sub> postSubList(Model m, HttpServletRequest request){
		Map<String, Object> paraMap = help_dao.getParaMap(request);
		int cate_code = (int) paraMap.get("cate_code");
		
		List<Ac_Sub> basic = cate_dao.getBasicList(cate_code);
		List<Ac_Sub> user = null;
		if(cate_code == 13) {
			user = cate_dao.getUser13(paraMap);
		} else {
			user = cate_dao.getUserList(paraMap);
			}
		List<Ac_Sub> list = new ArrayList<Ac_Sub>();
		list.addAll(basic);
		list.addAll(user);
		
		return list;
		
	}
}
