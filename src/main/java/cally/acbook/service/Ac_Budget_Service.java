package cally.acbook.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import cally.acbook.beans.Ac_Budget;
import cally.acbook.dao.Ac_Budget_Dao;
import cally.acbook.dao.Ac_Detail_Dao;
import cally.acbook.dao.Ac_Help_Dao;

@Service
public class Ac_Budget_Service {

	@Inject
	private Ac_Budget_Dao budget_dao;
	
	@Inject
	private Ac_Help_Dao help_dao;
	
	@Inject
	private Ac_Detail_Dao det_dao;
	
	
	public String getBudget(HttpServletRequest request, Model m) {
		//paraMap 구하기
		Map<String, Object> paraMap = help_dao.getParaMap(request);
		String today = "";
		String last = "";
		if(paraMap.containsKey("today") && paraMap.containsKey("last")) {
			today = (String) paraMap.get("today");
			last = (String) paraMap.get("last");
		} else {
		//만약 today, last 값이 없으면 이번달, 저번달 구하기
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat df = new SimpleDateFormat("YYYY/MM");
		today = df.format(cal.getTime());
		cal.add(Calendar.MONTH, -1);
		last = df.format(cal.getTime());
		}
		
		m.addAttribute("today", today);
		m.addAttribute("last", last);

		
		//오른쪽 종합리스트
		List<Map<String,Object>> right_list = new ArrayList<Map<String,Object>>();
				
		//왼쪽 종합리스트
		List<Map<String,Object>> left_list = new ArrayList<Map<String,Object>>();
		
		
		right_list = getBudgetTable(paraMap, right_list, today);
		paraMap.remove("budget_date");
		left_list = getBudgetTable(paraMap, left_list, last);
		
		
		//모델에 두 리스트 추가
		m.addAttribute("right_list",right_list);
		m.addAttribute("left_list",left_list);

		return "view/acbook/acbook_budget";
	}
	
	public List<Map<String, Object>> getBudgetTable
	(Map<String, Object> paraMap, List<Map<String,Object>> left_list, String last){

		List<Ac_Budget> left_b = new ArrayList<Ac_Budget>();
		List<Map<String,Object>> left_e = new ArrayList<Map<String,Object>>();
				
		paraMap.put("budget_date", last);
		
		//예산이 비어있을 때를 위한 리스트
		List<Ac_Budget> emptytable = new ArrayList<Ac_Budget>();
		emptytable.add(new Ac_Budget("식비", 3, 0));
		emptytable.add(new Ac_Budget("주거/통신", 4, 0));
		emptytable.add(new Ac_Budget("생활용품", 5, 0));
		emptytable.add(new Ac_Budget("의복/미용", 6, 0));
		emptytable.add(new Ac_Budget("건강/문화", 7, 0));
		emptytable.add(new Ac_Budget("교육/문화", 8, 0));
		emptytable.add(new Ac_Budget("교통/차량", 9, 0));
		emptytable.add(new Ac_Budget("경조사/회비", 10, 0));
		emptytable.add(new Ac_Budget("세금/이자", 11, 0));
		emptytable.add(new Ac_Budget("용돈/기타", 12, 0));
		
		if(budget_dao.checkBudget(paraMap)) {
			// 등록된 예산이 있을 때 
			left_b =  budget_dao.listBudget(paraMap);
		} else {
			// 등록된 예산이 없을 때 
			left_b = emptytable;
		}
		
		//지출리스트 구하기
		paraMap.put("det_date", last);
		left_e = det_dao.getMonthlyExByCate(paraMap);
		
		//예산,지출 리스트 합치기
		left_list = setBudgetTable(left_b, left_e, left_list);
		return left_list;
	}
	
	public List<Map<String,Object>> setBudgetTable(List<Ac_Budget> right_b, List<Map<String,Object>> right_e, List<Map<String,Object>> right_list) {
		for(int i=3; i<13; i++) {
			Map<String, Object> newmap = new HashMap<String, Object>();
			newmap.put("CATE_CODE", i);
			newmap.put("CATE_NAME",right_b.get(i-3).getCate_name());
			newmap.put("BUDGET_VALUE", right_b.get(i-3).getBudget_value());
			Iterator<Map<String, Object>> it = right_e.iterator();
			
			int count = 0;
			while(it.hasNext()) {
				Map<String, Object> map = it.next();
				if(Integer.parseInt(map.get("CATE_CODE").toString()) == i) {
					count++;
					newmap.put("DET_MONEY", map.get("DET_MONEY"));
					break;
				}
			}
			if(count == 0) {
				//해당 대분류는 한번도 쓰이지 않았음.
				newmap.put("DET_MONEY", 0);
			}
			
			right_list.add(newmap);
		}
		return right_list;
	}
	
	
	public void inBudget(HttpServletRequest request, Model m) {
		// 예산을 인서트, 수정한다.
		int mem_num = help_dao.getMem_num(request);
		String budget_date = request.getParameter("today");
		String[] value = request.getParameterValues("budget_value");
		
		Map<String, Object> paraMap = new HashMap<String, Object>();
		paraMap.put("mem_num", mem_num);
		paraMap.put("budget_date", budget_date);
		
		//카테고리 3번부터 끝까지 인서트.
		for(int i=0; i < value.length ;i++) {
			paraMap.put("cate_code", i+3);
			paraMap.put("budget_value", value[i]);
			budget_dao.inBudget(paraMap);
		}
		
	}
}
