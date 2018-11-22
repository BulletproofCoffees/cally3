package cally.sj.controller;


import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.ServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;




@Controller
@RequestMapping(value="/admin/sj")
public class SJ_Admin_Controller {
	@Inject
	private SqlSession session;
	
	
	@RequestMapping(value="", method=RequestMethod.GET)
	public String sjMaina(ServletRequest request) {
		request.setAttribute("w", session.selectList("mapper.sj.sjadminMapper.admin_w"));
		request.setAttribute("m", session.selectList("mapper.sj.sjadminMapper.admin_m"));	
		
		request.setAttribute("foodlist", session.selectList("mapper.sj.sjadminMapper.admin_foodlist"));
		
		 return "admin/sj/a_sj_main";
	}
	
	@RequestMapping(value="", method=RequestMethod.POST, produces = "text/plain; charset=UTF-8")
	public String sjMaina_opst(ServletRequest request,int f_no) {
		Map<String, Object> param = new HashMap<>();
		param.put("f_no", f_no);
		session.delete("mapper.sj.sjadminMapper.food_delete",f_no);
		System.out.println(f_no);
		 return "admin/sj/a_sj_main";
	}
	
}
