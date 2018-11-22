package cally.health.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import cally.health.dao.Hel_Mypage_Dao;
import cally.sharing.beans.Cally_Member;

@Service
public class Hel_Mypage_Service {
	
	@Inject
	private Hel_Mypage_Dao mypage_dao;
	
	@Inject
	Hel_Mypage_Service my_service;
	
	
	public List<Map<String, Object>> myPage(HttpServletRequest r){
		Cally_Member cm = (Cally_Member) r.getSession().getAttribute("loginUser");
		 int num = cm.getMem_num();
		 
	    return mypage_dao.myPage(num);
		
	}
	
	public String Health_Mypage(Model m, HttpServletRequest r) {
		 

	    Cally_Member cm = (Cally_Member) r.getSession().getAttribute("loginUser");
	    int num = cm.getMem_num();
	    String sex = r.getParameter("MEM_SEX");
	    int age = Integer.parseInt(r.getParameter("AGE"));
	    int stature = Integer.parseInt(r.getParameter("STATURE"));
	    int kg = Integer.parseInt(r.getParameter("KG"));
   
	    
	    Map<String, Object> paraMap = new HashMap<String, Object>();
		
		paraMap.put("MEM_NUM", num);
		paraMap.put("MEM_SEX", sex);
		paraMap.put("AGE", age);
		paraMap.put("STATURE", stature);
		paraMap.put("KG", kg);

		
		//다넣고
		
		mypage_dao.Health_Mypage(paraMap);
	
	return "view/health/health_mypage_view";	
}
	
	public String Health_Calorie(Model m, HttpServletRequest r) {
		 

	    Cally_Member cm = (Cally_Member) r.getSession().getAttribute("loginUser");
	    int num = cm.getMem_num();
	    int weight = Integer.parseInt(r.getParameter("C_WEIGHT"));
	    int gweight = Integer.parseInt(r.getParameter("C_GOAL_WEIGHT"));
	    int period = Integer.parseInt(r.getParameter("C_PERIOD"));
	    Float code = Float.parseFloat(r.getParameter("A_CODE"));
	    
	    Map<String, Object> paraMap = new HashMap<String, Object>();
		
		paraMap.put("MEM_NUM", num);
		paraMap.put("C_WEIGHT", weight);
		paraMap.put("C_GOAL_WEIGHT", gweight);
		paraMap.put("C_PERIOD", period);
		paraMap.put("A_CODE", code);
		mypage_dao.Health_Calorie(paraMap);
		m.addAttribute("mypage", my_service.myPage(r));
		m.addAttribute("acode" , my_service.Hel_Active());
		m.addAttribute("calorie",my_service.Hel_Calorie(r));
	
	return "view/health/health_calorie_result";	
}
	
	public List<Map<String, Object>> Hel_Active (){
	return mypage_dao.Hel_Active();
		
	}
	
	public List<Map<String, Object>> Hel_Calorie (HttpServletRequest r){
		Cally_Member cm = (Cally_Member) r.getSession().getAttribute("loginUser");
		 int num = cm.getMem_num();
	     return mypage_dao.Hel_Calorie(num);
		
	}
	
	public List<Map<String, Object>> Calorie_past (HttpServletRequest r){
		Cally_Member cm = (Cally_Member) r.getSession().getAttribute("loginUser");
		 int num = cm.getMem_num();
	     return mypage_dao.Calorie_past(num);
		
	}

}
