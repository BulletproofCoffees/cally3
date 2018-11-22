package cally.acbook.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import cally.acbook.dao.Ac_Annual_Dao;
import cally.acbook.dao.Ac_Help_Dao;

@Service
public class Ac_Annual_Service {

	
	@Inject
	private Ac_Help_Dao help_dao;
	
	@Inject
	private Ac_Annual_Dao ann_dao;
	
	public void getAnnual(Model m, HttpServletRequest request) {
		Map<String, Object> paraMap = help_dao.getParaMap(request);
		if(!paraMap.containsKey("det_date")) {
			//날짜가 없으면 이번해로
			Calendar cal = Calendar.getInstance();
			SimpleDateFormat df = new SimpleDateFormat("YYYY");
			String today = df.format(cal.getTime());
			paraMap.put("det_date", today);
		}
		m.addAttribute("det_date", paraMap.get("det_date"));
		
		//한해 수입, 지출 합계
		int sum_in = ann_dao.getYearInSum(paraMap);
		int sum_ex = ann_dao.getYearExSum(paraMap);
		
		int per_in = 0; int per_ex = 0;
		if(sum_in + sum_ex != 0) {
		per_in = (sum_in)*100/(sum_in + sum_ex);
		per_ex = (sum_ex)*100/(sum_in + sum_ex);
		}
		m.addAttribute("sum_in", sum_in);
		m.addAttribute("sum_ex", sum_ex);
		m.addAttribute("per_in", per_in);
		m.addAttribute("per_ex", per_ex);
		
		
		//수입리스트 구하기
		List<Map<String, Object>> inlist = new ArrayList<Map<String, Object>>();
		for(int i=1; i<3; i++) {
			//주수입, 부수입 두가지
			Map<String, Object> inmap = new HashMap<String, Object>();
			String cate_name = "주수입";
			if(i == 2) { cate_name = "부수입"; }
			
			inmap.put("cate_code", i);
			inmap.put("cate_name", cate_name);
			
			paraMap.put("cate_code", i);
			inmap.put("result", ann_dao.getAnnualInEx(paraMap));
			inlist.add(inmap);
		}
		m.addAttribute("inlist",inlist);
		
		//지출리스트 구하기
				List<Map<String, Object>> exlist = new ArrayList<Map<String, Object>>();
				for(int i=3; i<13; i++) {
					//식비부터 
					Map<String, Object> inmap = new HashMap<String, Object>();
					String cate_name = "";
					switch(i) {
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
					}
					
					inmap.put("cate_code", i);
					inmap.put("cate_name", cate_name);
					
					paraMap.put("cate_code", i);
					inmap.put("result", ann_dao.getAnnualInEx(paraMap));
					exlist.add(inmap);
				}
		
				m.addAttribute("exlist",exlist);
	}
}
