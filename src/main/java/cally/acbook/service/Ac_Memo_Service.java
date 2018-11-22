package cally.acbook.service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import cally.acbook.dao.Ac_Help_Dao;
import cally.acbook.dao.Ac_Memo_Dao;

@Service
public class Ac_Memo_Service {

	@Inject
	private Ac_Memo_Dao memo_dao;
	
	@Inject
	private Ac_Help_Dao help_dao;
	
	public List<Map<String, Object>> calMemo(Map<String, Object> paraMap) {
		// 달력에서 한달간 메모 전부 가져오는 서비스
		
		List<Map<String, Object>> memolist = memo_dao.calMemo(paraMap);
		return memolist;
	}

	public void getMemo(HttpServletRequest request, Model m, String date) {
		// 데일리페이지에서 메모 출력하는 서비스
		Map<String, Object> paraMap = help_dao.getParaMap(request);
		paraMap.put("memo_date", date);
		m.addAttribute("memo_value", memo_dao.getMemo(paraMap));
		
	}
	
	public void inMemo(HttpServletRequest request, Model m) {
		//해당 날짜의 메모가 없으면 insert, 메모가 있고 memo_value가 빈칸이 아니면 update, 빈칸이면 delete한다.
		Map<String, Object> paraMap = help_dao.getParaMap(request);
		//프로시져 p_ac_memo(mem_num, memo_date, memo_value)
		memo_dao.inMemo(paraMap);
		
	}
	
	public String getMemolist(HttpServletRequest request, Model m) {
		//메모 리스트에서 메모목록 출력하는 서비스
		int mem_num = help_dao.getMem_num(request);
		
		DateFormat df = new SimpleDateFormat("yyyy/MM/dd");

		if (request.getParameter("from") == null || request.getParameter("to") == null) {
			// 기본 메모뷰(한달전~ 한달 후까지 모두 출력)
			Date today = new Date();
			long t = 30;
			Date from = new Date(today.getTime() - t*60L*60L*24L*1000L);
			Date to = new Date(today.getTime() + t*60L*60L*24L*1000L);
			m.addAttribute("from", df.format(from));
			m.addAttribute("to", df.format(to));
			m.addAttribute("memolist", memo_dao.getMemobasic(mem_num));
		} else {
			// 지정된 기간 내의 키워드 검색
			String memo_value = "%";
			if (request.getParameter("memo_value") != null) {
				memo_value = request.getParameter("memo_value");
			}
			
			String from = request.getParameter("from").substring(2);
			String to = request.getParameter("to").substring(2);

			Map<String, Object> paraMap = new HashMap<String, Object>();
			
			paraMap.put("mem_num", mem_num);
			paraMap.put("memo_value", memo_value);
			paraMap.put("from", from);
			paraMap.put("to", to);

			m.addAttribute("memolist", memo_dao.getMemolist(paraMap));
			
			m.addAttribute("from", request.getParameter("from"));
			m.addAttribute("to", request.getParameter("to"));
		}
		
		return  "view/acbook/acbook_memo";

	}
}
