package cally.acbook.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import cally.acbook.dao.Ac_Card_Dao;
import cally.acbook.dao.Ac_Help_Dao;

@Service
public class Ac_Card_Service {

	@Inject
	private Ac_Help_Dao help_dao;
	
	@Inject
	private Ac_Card_Dao card_dao;
	
	public void cardAllList(Model m, HttpServletRequest request) {
		//모든 카드리스트를 model에 추가
		int mem_num = help_dao.getMem_num(request);
		List<Map<String, Object>> cardlist = card_dao.cardAllList(mem_num);
		m.addAttribute("cardlist", cardlist);
	}
	
	public void cardcomList(Model m) {
		//모든 카드회사 리스트를 model에 추가
		List<Map<String, Object>> cardcomlist = card_dao.cardcomList();
		m.addAttribute("cardcomlist", cardcomlist);
	}
	
	public void cardUseList(Model m,  HttpServletRequest request) {
		//사용중인 카드리스트를 model에 추가하는 서비스
		int mem_num = help_dao.getMem_num(request);
		List<Map<String, Object>> cardlist = card_dao.cardUseList(mem_num);
		m.addAttribute("cardlist", cardlist);
	}

	public String newCard(Model m, HttpServletRequest request) {
		Map<String, Object> paraMap = help_dao.getParaMap(request);
		if(!paraMap.containsKey("card_useyn")) {
			//체크박스가 체크되어 있지 않아서 값이없음. 즉 n
			paraMap.put("card_useyn", "n");
		}
		if(!paraMap.containsKey("check_yn")) {
			//체크박스가 체크되어 있지 않아서 값이없음. 즉 n
			paraMap.put("check_yn", "n");
			paraMap.put("acc_code", null);
		}
		paraMap.put("message", "메세지");
		card_dao.newCard(paraMap);
		return (String)paraMap.get("message");
	}
	
	public String upCard(Model m, HttpServletRequest request) {
		Map<String, Object> paraMap = help_dao.getParaMap(request);
		if(!paraMap.containsKey("card_useyn")) {
			//체크박스가 체크되어 있지 않아서 값이없음. 즉 n
			paraMap.put("card_useyn", "n");
		}
		if(!paraMap.containsKey("acc_code")) {
			paraMap.put("acc_code", null);
		}
		paraMap.put("message", "메세지");
		card_dao.upCard(paraMap);
		return (String)paraMap.get("message");
	}
	
	public String delCard(Model m, HttpServletRequest request) {
		Map<String, Object> paraMap = help_dao.getParaMap(request);
		paraMap.put("message", "메세지");
		System.out.println("paraMap:" + paraMap.toString());
		card_dao.delCard(paraMap);
		return (String)paraMap.get("message");
	}
	
	
	public String getCardFee(Model m, HttpServletRequest request) {
		Map<String, Object> paraMap = help_dao.getParaMap(request);
		paraMap.put("result", 0);
		card_dao.getCardFee(paraMap);
		int result = (Integer) paraMap.get("result");
		if(result > 0) {
			return "0";
		} else {
			int result2 = (-1) * result;
			return String.valueOf(result2);
		}
		
	}
}
