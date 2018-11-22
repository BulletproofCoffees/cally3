package cally.sj.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Objects;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import cally.sharing.beans.Cally_Member;
import cally.sj.dao.Sj_apiDao;
import cally.sj.service.Sj_Service;


@Controller
@RequestMapping(value="/sj")
public class SjController {
	@Inject
	private SqlSession session;
	@Inject
	private Sj_Service sj_service;
	/*sj---------------------------------------------------------------------------------*/
	
	@RequestMapping(value="", method=RequestMethod.GET)
	public String sjMain(ServletRequest request, HttpServletRequest req) throws IOException {
			
		sj_service.callyM_Service(request,req);
				
		return "view/sj/sj_main";
	}	
	//회원건강정보 가입
	@RequestMapping(value="", method=RequestMethod.POST)
	public String sjMain_join(ServletRequest request, HttpServletRequest req,Model m) throws IOException {	
		
		sj_service.hm_join(request);				
		m.addAttribute("ok", "동의 완료");		
		sj_service.callyM_Service(request,req);
		
		return "view/sj/sj_main";
	}
/*sj/---------------------------------------------------------------------------------*/
	
	
	
	
	/*api*/
	  @RequestMapping(value= "/xml", method=RequestMethod.GET)
	   public String xml( ServletRequest request, ServletResponse response) throws ServletException, IOException{
		   Sj_apiDao.getapi(request,response);		
	      return "resources/sj/xml";
	   } 	  
		
	@RequestMapping(value= "/test", method=RequestMethod.GET)
	public String test(){		
		return "view/sj/test";		
	} 
		
	/*일일 식단작성---------------------------------------------------------------------------*/
	@RequestMapping(value= "/counter/{bno}", method=RequestMethod.GET)
	public String counter(@PathVariable String bno,HttpServletRequest request){	

		if (Objects.isNull(bno)) {
		bno ="=2018-11-7";
		}		
		sj_service.counter(request,bno);
		
		return "view/sj/counter";
	} 
	
	@RequestMapping(value= "/counter/{bno}", method=RequestMethod.POST)
	public String counter_post(
			@PathVariable String bno,HttpServletRequest request,MultipartFile img,String text)
			throws ParseException, UnsupportedEncodingException{	
		if (Objects.isNull(img) || Objects.isNull(text)) {			
			sj_service.counter_post(request);		
		} else {
			//이미지 업로드			
			sj_service.counter_post_img(request,img,text);			
		}	
		return "view/sj/counter";
	} 
	


	//리스트삭제 에이작스
	
	@RequestMapping(value = "/counter_ajax", method = RequestMethod.POST
			, produces = "text/plain; charset=UTF-8")
	public String Ingredient_ajax(ServletRequest request) {			
		sj_service.Ingredient_ajax(request);		
		return "view/sj/Ingredient";
	}

		
	/*일일 식단작성/---------------------------------------------------------------------------*/
	
	
	
	/*달별 식단 보기*/
	@RequestMapping(value= "/days", method=RequestMethod.GET)
	public String days(ServletRequest request, HttpServletRequest req){			
		return "view/sj/days";
	}
	
	@ResponseBody
	@RequestMapping(value= "/days", method=RequestMethod.POST
	, produces = "text/plain; charset=UTF-8")
	public String days_post(ServletRequest request, HttpServletRequest req){	
		Cally_Member loginUser = (Cally_Member) req.getSession().getAttribute("loginUser");		
		String id  = loginUser.getMem_id();	
		ArrayList<Object> list = new ArrayList<>();
		list.add(session.selectList("mapper.sj.sjMapper.days", new Cally_Member(id)));		
		Gson gson = new Gson();
		return gson.toJson(list);
	}
	
	/*음식상세보기----------------------------------------------------------------------------------*/
	@RequestMapping(value= "/foodsdb", method=RequestMethod.GET)
	public String foodsdb(ServletRequest request){	
		
		sj_service.food_search(request);
           
		return "resources/sj/foodsdb";
	}
	@RequestMapping(value = "/Ingredient/{desc_kor}", method = RequestMethod.GET)
	public String Ingredient(@PathVariable String desc_kor,ServletRequest request) {		
		sj_service.food_search(request,desc_kor);		
		return "view/sj/Ingredient";
	}
	
	@RequestMapping(value = "/Ingredient", method = RequestMethod.POST)
	public String Ingredient_post(ServletRequest request) {		
		sj_service.food_search(request);		
		return "view/sj/Ingredient";
	}
	/*/음식상세보기----------------------------------------------------------------------------------*/ 
	
	
	 
	/*새음식db등록------------------------------------------------------------------------------------*/
	@RequestMapping(value= "/Ingredient_up", method=RequestMethod.GET)
	public String Ingredient_up(){		
		return "view/sj/Ingredient_up";
	} 
	@RequestMapping(value= "/Ingredient_up", method=RequestMethod.POST)
	public String Ingredient_up_post(ServletRequest request){			
		sj_service.Ingredient_up_post(request);			        
		return "view/sj/Ingredient";		
	} 
	/*/새음식db등록------------------------------------------------------------------------------------*/
	
	/*내식단분석*/
	@RequestMapping(value= "/analysis", method=RequestMethod.GET)
	public String analysis(HttpServletRequest request){			
		sj_service.analysis(request);
		return "view/sj/analysis";
	}

	
	/*내 권장 칼로리 변경*/
	@RequestMapping(value= "/changingcal", method=RequestMethod.GET)
	public String Changing_cal( HttpServletRequest req, ServletRequest request){		
		sj_service.Changing_cal(null,null,null,req,request);
		return "view/sj/Changing_cal";
	} 
	
	@RequestMapping(value= "/changingcal", method=RequestMethod.POST)
	public String Changing_cal_poat(String sex, String blankRadio, String mygoal,String age, String kg, ServletRequest request, HttpServletRequest req){	
		
		sj_service.Changing_cal(sex,blankRadio,mygoal,req,request);
		
		return "view/sj/Changing_cal";
	} 
	
	
	
	


	
	
	   
	  

	  	
}
