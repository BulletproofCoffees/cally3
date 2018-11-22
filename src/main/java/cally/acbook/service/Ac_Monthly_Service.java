package cally.acbook.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import cally.acbook.beans.MapComparator;
import cally.acbook.dao.Ac_Detail_Dao;
import cally.acbook.dao.Ac_Help_Dao;

@Service
public class Ac_Monthly_Service {
	
	@Inject
	private Ac_Help_Dao help_dao;
	@Inject
	private Ac_Detail_Dao det_dao;
	@Inject
	private Ac_Budget_Service bud_service;
	
	public void getMonthly(Model m,HttpServletRequest request) {
		Map<String, Object> paraMap = help_dao.getParaMap(request);
		if(!paraMap.containsKey("det_date")){
		//만약 det_date 값이 없으면 이번달 구하기
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat df = new SimpleDateFormat("YYYY/MM");
		String det_date = df.format(cal.getTime());
		paraMap.put("det_date", det_date);
		}
		
		if(!paraMap.containsKey("cate_code")) {
			//cate_code가 없다면 0 넣음(전체보기)
			paraMap.put("cate_code", 0);
		}

		//한달동안의 수입,지출 합계 구하기
		int sum_in = det_dao.getMonthlyInSum(paraMap);
		int sum_ex = det_dao.getMonthlyExSum(paraMap);
		
		int per_in = 0; int per_ex = 0;
		if(sum_in + sum_ex != 0) { // 바에 보일 수입,지출 비율
		per_in = (sum_in)*100/(sum_in + sum_ex);
		per_ex = (sum_ex)*100/(sum_in + sum_ex);
		}
		
		m.addAttribute("sum_in", sum_in);
		m.addAttribute("sum_ex", sum_ex);
		m.addAttribute("per_in", per_in);
		m.addAttribute("per_ex", per_ex);
		m.addAttribute("det_date", (String) paraMap.get("det_date"));
		
	}
	
	public List<Map<String,Object>> postMonthly(Model m, HttpServletRequest request) {
		Map<String, Object> paraMap = help_dao.getParaMap(request);
		int cate_code = (Integer) paraMap.get("cate_code");
		int type = (Integer)paraMap.get("type"); // type=1 :바, 2: 도넛그래프
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		if(cate_code == 0) {
			if(type == 1) {
				//월보고서 - 지출 전체보기(대분류별) : 바 차트는 예산도 필요하다!
				//[{CATE_NAME: dd, BUDGET_VALUE: dd, DET_VALUE: 11}, {...}]
				paraMap.put("budget_date", (String) paraMap.get("det_date"));
				list = bud_service.getBudgetTable(paraMap, list, (String) paraMap.get("det_date"));
				return list;
			} else {
				// 도넛차트는 예산은 필요없다. 다만 label, value로 맞춰줘야 한다
				//한달간의 대분류별 지출 가져오기.
				list = det_dao.getMonthlyExByCate2(paraMap);
				//CATE_NAME 은 label로, DET_MONEY는 value로 바꾼다.
				for (Iterator iterator = list.iterator(); iterator.hasNext();) {
					Map<String, Object> map = (Map<String, Object>) iterator.next();
					map.put("label", map.get("CATE_NAME"));
					map.remove("CATE_NAME");
					map.put("value", map.get("DET_MONEY"));
					map.remove("DET_MONEY");
				}
				return list;
			}
		} else if (cate_code == -1) {
			//월보고서 - 수입 전체보기(대분류별)
			list = det_dao.getMonthlyInByCate(paraMap);
			if(type == 1) {
				//CATE_NAME을 SUB_NAME으로 바꾼다.
				for (Iterator iterator = list.iterator(); iterator.hasNext();) {
					Map<String, Object> map = (Map<String, Object>) iterator.next();
					Object temp = map.get("CATE_NAME");
					map.put("SUB_NAME", temp);
					map.remove("CATE_NAME");
					map.remove("CATE_CODE");
				}
				return list;
			} else {
				//도넛 label, value처리, CATE_CODE 삭제
				for (Iterator iterator = list.iterator(); iterator.hasNext();) {
					Map<String, Object> map = (Map<String, Object>) iterator.next();
					map.remove("CATE_CODE");
					map.put("label", map.get("CATE_NAME"));
					map.remove("CATE_NAME");
					map.put("value", map.get("DET_MONEY"));
					map.remove("DET_MONEY");
				}
				return list;
			}

		} else {
			list = det_dao.getMonthlySubSum(paraMap);
			//월보고서 - 수입 혹은 지출 소분류별 보기
			if(type == 2 ) {
				//도넛은 SUB_NAME을 label로, DET_MONEY를 value로 바꿔준다.
				for (Iterator iterator = list.iterator(); iterator.hasNext();) {
					Map<String, Object> imap = (Map<String, Object>) iterator.next();
					imap.put("label", imap.get("SUB_NAME"));
					imap.remove("SUB_NAME");
					imap.put("value", imap.get("DET_MONEY"));
					imap.remove("DET_MONEY");
				}
			}
			return list;
		}
	}
}
