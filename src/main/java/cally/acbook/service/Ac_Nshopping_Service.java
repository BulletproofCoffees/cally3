package cally.acbook.service;

import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import cally.acbook.dao.Ac_Help_Dao;
import cally.acbook.dao.Ac_Naver_Api;

@Service
public class Ac_Nshopping_Service {
	@Inject
	Ac_Help_Dao help_dao;
	@Inject
	Ac_Naver_Api napi;

	public String nShopping(Model m, HttpServletRequest request) {
		Map<String, Object> paraMap = help_dao.getParaMap(request);
		if(!paraMap.containsKey("query")) { paraMap.put("query", "안경"); }
		if(!paraMap.containsKey("sort")) { paraMap.put("sort", "sims"); } 
		if(!paraMap.containsKey("start")) { paraMap.put("start", 1); }
		System.out.println("service 끝");
		return napi.getJson(paraMap);
	}
}
