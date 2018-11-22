package cally.acbook.service;

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

import cally.acbook.dao.Ac_Detail_Dao;
import cally.acbook.dao.Ac_Help_Dao;

@Service
public class Ac_Detail_Service {
	@Inject
	Ac_Help_Dao help_dao;
	
	@Inject
	Ac_Detail_Dao det_dao;
	
	public Map<String, Object> setSubmenu(HttpServletRequest request) {
		//가계부 서브메뉴의 정보를 가져오는 서비스
		Map<String, Object> paraMap = new HashMap<String, Object>();
		//프로시져에 필요한 IN 변수 : mem_num
		paraMap.put("mem_num", help_dao.getMem_num(request));
		//프로지셔 결과 나올 OUT 변수들 자리
		paraMap.put("s_sum_in", 0); // 수입 합
		paraMap.put("s_sum_ex", 0); // 지출 합
		
		/*paraMap.put("s_asset_1", 0); // 현금자산
		paraMap.put("s_asset_2", 0); // 투자자산
		paraMap.put("s_asset_3", 0); // 기타 자산
		
		paraMap.put("s_debt_1", 0); // 대출
		paraMap.put("s_debt_2", 0); // 기타 부채
		paraMap.put("s_debt_3", 0); // 카드값
*/		
		//프로지셔 콜
		return det_dao.getSubmenu(paraMap);

		
	}
	
	public void insertDetail(Model m, HttpServletRequest request) {
		Map<String, Object> paraMap = help_dao.getParaMap(request);
		//카테고리 코드(대분류)가 3미만이라면, 수입이므로 카드코드가 없다. 따라서 카드코드에 0을 넣어준다.
		if((int)paraMap.get("cate_code") < 3) {
			paraMap.put("card_code", 0);
		}
		
		//만일 수입,지출 입력에서 왔다면 det_date 형식이 MM-dd-yyyy이다
		//따라서 '-'가 포함되어있는지 확인하여 확인되었다면 YY/MM/dd 형식으로 바꾼다.
		String det_date = paraMap.get("det_date").toString();
		String[] wrongdate = det_date.split("-");
		
		if(wrongdate.length == 3) {
			//MM, dd, yyyy
			String month = wrongdate[0];
			String day = wrongdate[1];
			String year = wrongdate[2].substring(2);
			
			det_date = year + "/" + month + "/" + day;
			paraMap.put("det_date", det_date);
		}
		//insert Dao 한다
		det_dao.inDetail(paraMap);
	}
	
	
	public void deleteDetail(Model m, HttpServletRequest request) {
		//넘겨받은 det_code를 이용해 수입/지출내역을 딜리트한다.
		String[] codes = request.getParameterValues("det_code");
		System.out.println(codes.toString());
		for(int i=0; i < codes.length; i++) {
			int det_code = Integer.parseInt(codes[i]);
			det_dao.delDetail(det_code);
		}
	}
	
	public void getDetailList_in(Model m, Map<String, Object> paraMap) {
		//수입내역을 가져온다.
				paraMap.put("inorex", "i");
				List<Map<String, Object>> list1 = det_dao.getDetailList(paraMap);
				if(list1 != null) {
					int sum = 0; // 수입합계 구하기
					Iterator<Map<String, Object>> it = list1.iterator();
					while(it.hasNext()) {
						sum += Integer.parseInt(it.next().get("DET_MONEY").toString());
					}
					m.addAttribute("sum_in", sum);
					m.addAttribute("inlist", list1);
				} else {
					m.addAttribute("sum_in", 0);
				}
	}
	public void getDetailList_ea(Model m, Map<String, Object> paraMap) {
		//지출내역을 가져온다.(이체, 카드대금 포함)
				paraMap.put("inorex", "ea");
				List<Map<String, Object>> list2 = det_dao.getDetailList(paraMap);
				if(list2 != null) {
					int sum = 0; // 지출합계 구하기
					Iterator<Map<String, Object>> it = list2.iterator();
					while(it.hasNext()) {
						//지출합계는 inorex가 e인것만 더해준다. 계좌이체, 카드대금은 지출이 아니다
						Map<String, Object> itmap = it.next();
						if(itmap.get("INOREX").toString().equals("e ")) {
							sum += Integer.parseInt(itmap.get("DET_MONEY").toString());
						}
					}
					m.addAttribute("sum_ex", sum);
					m.addAttribute("exlist", list2);
				} else {
					m.addAttribute("sum_ex", 0);
				}
	}
	public void getDetailList(Model m, HttpServletRequest request, int how) {

		Map<String, Object> paraMap = help_dao.getParaMap(request);
		//리스트를 넣을 detList를 만든다
		List<Map<String, Object>> detList =
		new ArrayList<Map<String, Object>>();
		
		paraMap.put("detList", detList);
		
		if(!paraMap.containsKey("from")) {

			if(how == 3) {
				//from이 없는 경우 1. 데일리페이지이다.(how가 3이다)
				//하루 내역이므로, 날짜 from과 to를 같은 날로 맞춰준다.
				String date = request.getParameter("year").substring(2) + "/" 
				+ request.getParameter("month") + "/" 
						+ request.getParameter("day");
				
				paraMap.put("from", date);
				paraMap.put("to", date);
			} else {
				//from이 없는 경우 2. 수입/지출 페이지를 처음 클릭했다.(how가 1,2다)
				//처음엔 이번달 1일부터 말일까지 모두 보여준다.
				Calendar cal = Calendar.getInstance();
				
				int year = cal.get ( cal.YEAR );
				int month = cal.get ( cal.MONTH ) + 1;
				int day = cal.get ( cal.DATE ) ;
				int endDay = cal.getActualMaximum(cal.DAY_OF_MONTH);
			
				String from = year+"/"+month+"/"+"1";
				String to = year+"/"+month+"/"+endDay;
				
				paraMap.put("from", from);
				paraMap.put("to", to);
				
				m.addAttribute("from", from);
				m.addAttribute("to", to);
			}
			
		} else {
			m.addAttribute("from", paraMap.get("from"));
			m.addAttribute("to", paraMap.get("to"));
		}
		
		//how가 1이면, 수입페이지(수입만)
		//how가 2이면, 지출페이지(지출만)
		//how가 3이면, 데일리페이지(수입,지출 모두필요)
		if(how == 1) {
		getDetailList_in(m,paraMap);
		} else if (how == 2) {
		getDetailList_ea(m,paraMap);
		} else if (how == 3) {
			getDetailList_in(m,paraMap);
			getDetailList_ea(m,paraMap);
		}
	}
}
