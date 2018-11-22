package cally.acbook.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import cally.acbook.beans.Ac_Sub;
import cally.acbook.dao.Ac_Detail_Dao;
import cally.acbook.dao.Ac_Help_Dao;
import cally.acbook.dao.Ac_Memo_Dao;
import cally.acbook.service.Ac_Acco_Service;
import cally.acbook.service.Ac_Annual_Service;
import cally.acbook.service.Ac_Budget_Service;
import cally.acbook.service.Ac_Card_Service;
import cally.acbook.service.Ac_Cate_Service;
import cally.acbook.service.Ac_Detail_Service;
import cally.acbook.service.Ac_Memo_Service;
import cally.acbook.service.Ac_Monthly_Service;
import cally.acbook.service.Ac_Nshopping_Service;

@Controller
@RequestMapping(value="/acbook")
public class AcbookController {
	
	@Inject
	private Ac_Acco_Service acc_service;
	@Inject
	private Ac_Card_Service card_service;
	@Inject
	private Ac_Memo_Service memo_service;
	@Inject
	private Ac_Memo_Dao memo_dao;
	@Inject
	private Ac_Detail_Service det_service;
	@Inject
	private Ac_Detail_Dao det_dao;
	@Inject
	private Ac_Help_Dao help_dao;
	@Inject
	private Ac_Monthly_Service mon_service;
	@Inject
	private Ac_Annual_Service ann_service;
	@Inject
	private Ac_Nshopping_Service n_service;
	
	
	@ResponseBody
	@RequestMapping(value="/ac_cal", method=RequestMethod.POST)
	public String acCalendar(HttpServletRequest request, Model m, HttpServletResponse response) {
		response.setContentType("text/html;charset=UTF-8"); 
		List<List<Map<String, Object>>> list = new ArrayList<List<Map<String, Object>>>();
		Map<String, Object> paraMap = help_dao.getParaMap(request);
		if(!paraMap.containsKey("year")) {
			//넘어온 날짜가 없다면 오늘 날짜로 맞춤.
			Calendar cal = Calendar.getInstance();
			SimpleDateFormat df = new SimpleDateFormat("YYYY/MM");
			String todaytemp = df.format(cal.getTime());
			String[] today = todaytemp.split("/");
			paraMap.put("year", today[0]);
			paraMap.put("month", today[1]);
		}	
		List<Map<String, Object>> memolist = memo_service.calMemo(paraMap);
		list.add(memolist);
		List<Map<String, Object>> inlist = det_dao.calIn(paraMap);
		list.add(inlist);
		List<Map<String, Object>> exlist = det_dao.calEx(paraMap);
		list.add(exlist);
		Gson gson = new Gson();
		return gson.toJson(list);
	}
	
	@RequestMapping(value="/dailypage", method=RequestMethod.GET)
	public String getDailypage(HttpServletRequest request, HttpServletResponse response, Model m) {
		String year = request.getParameter("year");
		m.addAttribute("year",year);
		String month = request.getParameter("month");
		m.addAttribute("month",month);
		String day = request.getParameter("day");
		m.addAttribute("day",day);
		String date = year.substring(2) + "/" + month + "/" + day;
		m.addAttribute("memo_date",date);
		
		
		// 그날의 메모 불러오기
		memo_service.getMemo(request, m, date);
		
		// 그날의 수입, 지출내역 및 수입합계, 지출합계 불러오기
		det_service.getDetailList(m, request, 3);
		
		// 사용중인 통장리스트 가져오기
		acc_service.accoUseList(m, request);
		// 사용중인 카드리스트 가져오기
		card_service.cardUseList(m, request);
		
		
		return "view/acbook/acbook_dailypage";
	}
	

	@RequestMapping(value="/memo_in", method=RequestMethod.GET)
	public void inMemo(HttpServletRequest request, Model m, HttpServletResponse response) {
		memo_service.inMemo(request, m);
		}
	
	
	@RequestMapping(value="/memolist", method=RequestMethod.GET)
	public String getMemolist(HttpServletRequest request, Model m) {
		return memo_service.getMemolist(request, m);
	}
	
	@RequestMapping(value="/nshopping", method=RequestMethod.GET, produces="text/plain; charset=UTF-8")
	public String getNshopping(HttpServletRequest request, Model m) {
		m.addAttribute("query",request.getParameter("query"));
		return "view/acbook/acbook_nshopping";
	}
	
	@ResponseBody
	@RequestMapping(value="/nshopping", method=RequestMethod.POST, produces="application/json")
	public String postNshopping(HttpServletRequest request, Model m) {
		System.out.println("nshop post");
		String list = n_service.nShopping(m, request);
		Gson gson = new Gson();
		return gson.toJson(list);
	}
	
	@ResponseBody
	@RequestMapping(value="/nshop", method=RequestMethod.GET, produces="application/json")
	public String postNshop(HttpServletRequest request, Model m) {
		System.out.println("nshop get");
		String list = n_service.nShopping(m, request);
		Gson gson = new Gson();
		return gson.toJson(list);
	}
	@RequestMapping(value="/expense", method=RequestMethod.GET)
	public String getExpense(Model m, HttpServletRequest request) {
		System.out.println("expense 콘트롤러");
		// 사용중인 통장리스트 가져오기
				acc_service.accoUseList(m, request);
		// 사용중인 카드리스트 가져오기
		card_service.cardUseList(m, request);
		// 해당기간의 지출내역 및 지출합계 불러오기
		det_service.getDetailList(m, request, 2);
		return "view/acbook/acbook_expense";
	}
	
	@RequestMapping(value="/income", method=RequestMethod.GET)
	public String getIncome(Model m, HttpServletRequest request) {
		// 사용중인 통장리스트 가져오기
		acc_service.accoUseList(m, request);

		// 해당기간의 수입 및 수입합계 불러오기
		det_service.getDetailList(m, request, 1);
		return "view/acbook/acbook_income";
	}
	
	@RequestMapping(value="/detail_in", method=RequestMethod.POST)
	public void inDetail(Model m, HttpServletRequest request) {
		// 지출/수입 인서트하기
		det_service.insertDetail(m, request);
	}
	@RequestMapping(value="/detail_del", method=RequestMethod.POST)
	public void delDetail(Model m, HttpServletRequest request) {
		// 지출/수입 삭제하기
		det_service.deleteDetail(m, request);
	}
	@Inject
	private Ac_Budget_Service budget_service;
	
	@RequestMapping(value="/budget", method=RequestMethod.GET)
	public String getBudget(Model m, HttpServletRequest request) {
		return budget_service.getBudget(request, m);
	}
	
	@RequestMapping(value="/budget_in", method=RequestMethod.POST)
	public void inBudget(Model m, HttpServletRequest request) {
		// ajax로 예산 추가, 수정. 
		budget_service.inBudget(request, m);
		
	}
	
	@Inject
	Ac_Cate_Service cate_service;
	
	@RequestMapping(value="/category", method=RequestMethod.GET)
	public String getCategory(Model m, HttpServletRequest request) {
		return cate_service.getSubList(m, request);
	}
	@ResponseBody
	@RequestMapping(value="/category", method=RequestMethod.POST)
	public String postCategory(Model m, HttpServletRequest request) {	
		List<Ac_Sub> list = cate_service.postSubList(m, request);
		Gson gson = new Gson();
		return gson.toJson(list);
	}
	
	@ResponseBody
	@RequestMapping(value="/subclass_in", method=RequestMethod.POST)
	public void inSubclass(Model m, HttpServletRequest request, HttpServletResponse response) {
		String message =  cate_service.inSubclass(m, request);
		help_dao.writeMessage(response, message);
	}
	
	@RequestMapping(value="/subclass_up", method=RequestMethod.POST)
	public void upSubclass(Model m, HttpServletRequest request,  HttpServletResponse response) {
		String message = cate_service.upSubclass(m, request);
		help_dao.writeMessage(response, message);
	}
	
	
	@RequestMapping(value="/subclass_del", method=RequestMethod.POST)
	public void delSubclass(Model m, HttpServletRequest request) {
		cate_service.delSubclass(m, request);
	}
	
	@RequestMapping(value="/cardset", method=RequestMethod.GET)
	public String getCardset(Model m, HttpServletRequest request) {
		//카드사 목록가져오기
		card_service.cardcomList(m);
		//사용중인 통장목록 가져오기
		acc_service.accoUseList(m, request);
		//모든 카드목록 가져오기
		card_service.cardAllList(m, request);
		return "view/acbook/acbook_cardset";
	}
	
	@RequestMapping(value="/card_in", method=RequestMethod.POST)
	public void newCard(Model m, HttpServletRequest request,
			HttpServletResponse response) {
		String message = card_service.newCard(m, request);
		help_dao.writeMessage(response, message);
	}
	
	@RequestMapping(value="/card_up", method=RequestMethod.POST)
	public void upCard(Model m, HttpServletRequest request,  HttpServletResponse response) {
		String message = card_service.upCard(m, request);
		help_dao.writeMessage(response, message);
	}
	
	@RequestMapping(value="/card_del", method=RequestMethod.POST)
	public void delCard(Model m, HttpServletRequest request,  HttpServletResponse response) {
		String message = card_service.delCard(m, request);
		help_dao.writeMessage(response, message);
	}
	
	@RequestMapping(value="/cardfee", method=RequestMethod.POST)
	public void getCardFee(Model m, HttpServletRequest request,
			HttpServletResponse response) {
		String message = card_service.getCardFee(m, request);
		help_dao.writeMessage(response, message);
	}
	
	
	@RequestMapping(value="/accountset", method=RequestMethod.GET)
	public String getAccountset(Model m, HttpServletRequest request) {
		return acc_service.accoAllList(m, request);
	}
	
	@ResponseBody
	@RequestMapping(value="/account_in", method=RequestMethod.POST)
	public void inAccount(HttpServletRequest request, HttpServletResponse response) {
		String message =  acc_service.newAccount(request);
		help_dao.writeMessage(response, message);
	}
	
	@RequestMapping(value="/account_up", method=RequestMethod.POST)
	public void upAccount(HttpServletRequest request,  HttpServletResponse response) {
		String message = acc_service.upAccount(request);
		help_dao.writeMessage(response, message);
	}
	
	@RequestMapping(value="/account_del", method=RequestMethod.POST)
	public void delAccount(HttpServletRequest request,  HttpServletResponse response) {
		String message = acc_service.delAccount(request);
		help_dao.writeMessage(response, message);
	}
	
	
	@RequestMapping(value="/monthly", method=RequestMethod.GET)
	public String getMonthly(Model m, HttpServletRequest request) {
		mon_service.getMonthly(m, request);
		return "view/acbook/acbook_monthly";
	}
	
	@ResponseBody
	@RequestMapping(value="/monthly", method=RequestMethod.POST)
	public String postMonthly(Model m, HttpServletRequest request) {
		
		List<Map<String,Object>> list = mon_service.postMonthly(m, request);
		Gson gson = new Gson();
		System.out.println(gson.toJson(list));
		return gson.toJson(list);
	}
	
	@ResponseBody
	@RequestMapping(value="/tostring", method=RequestMethod.POST)
	public String jsonToString(Model m, HttpServletRequest request) {
		Map<String, Object> paraMap = help_dao.getParaMap(request);
		List<Map<String,Object>> list= new ArrayList<Map<String, Object>>();
		paraMap.remove("mem_num");
		for (int i=1; i<13; i++) {
			String key = i + "월";
			Map<String, Object> newmap = new HashMap<String, Object>();
			newmap.put("month", key);
			newmap.put("value", paraMap.get(key));
			list.add(newmap);
		}
		System.out.println("list : " + list.toString());
		Gson gson = new Gson();
		System.out.println(gson.toJson(list));
		return gson.toJson(list);
	}
	
	@RequestMapping(value="/annual", method=RequestMethod.GET)
	public String getAnnual(Model m, HttpServletRequest request) {
		ann_service.getAnnual(m, request);
		return "view/acbook/acbook_annual";
	}
	
	@RequestMapping(value="/breakdown", method=RequestMethod.GET)
	public String getBreakdown() {
		return "view/acbook/acbook_breakdown";
	}
	
	//처음 이용하는 회원 뷰 리턴
	@RequestMapping(value="/newform", method=RequestMethod.GET)
	public String getNewform() {
		return "view/acbook/acbook_new";
	}
	
	//처음 회원 세팅
	@RequestMapping(value="/newform", method=RequestMethod.POST)
	public String getNewAcbook(Model m, HttpServletRequest request) {
		return acc_service.firstAccount(m, request);
	}

}
