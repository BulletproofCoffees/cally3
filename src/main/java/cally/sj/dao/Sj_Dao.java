package cally.sj.dao;

import java.util.Map;

import javax.inject.Inject;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import cally.sharing.beans.Cally_Member;
import cally.sj.beans.Sj_m_VO;

@Repository
public class Sj_Dao {
	@Inject
	private SqlSession session;
	

	// 회원건강정보로그인
	public void doP_in_t_enter(Cally_Member id, ServletRequest request) {
		request.setAttribute("id", session.selectList("mapper.sj.sjMapper.c_te_login", id));		
		request.setAttribute("re_list", session.selectList("mapper.sj.sjMapper.re_list", id));
		request.setAttribute("admin_food", session.selectList("mapper.sj.sjMapper.admin_food"));
	}
	// 회원 건강가입
	public void hm_join(Map<String, Object> param, ServletRequest request) {
		session.insert("mapper.sj.sjMapper.hm_join", param);
	}

	
	public void food_search(ServletRequest request, Map<String, Object> param, String desc_kor) {
		request.setAttribute("desc_kor", desc_kor);
		request.setAttribute("list", session.selectList("mapper.sj.sjMapper.Ingredient_search", param));
		
	}

	public void Ingredient_up_post(ServletRequest request, Map<String, Object> param, String desc_kor) {
		session.insert("mapper.sj.sjMapper.Ingredient_up", param);
		request.setAttribute("list", session.selectList("mapper.sj.sjMapper.Ingredient_search", desc_kor));

	}

	public void counter(HttpServletRequest request, Map<String, Object> param) {
		param.put("doy_code", session.selectOne("mapper.sj.sjMapper.today_search", param));// 데이트테이블 번호get
		request.setAttribute("day_list_1", session.selectList("mapper.sj.sjMapper.re_select_1", param));// 아침
		request.setAttribute("day_list_2", session.selectList("mapper.sj.sjMapper.re_select_2", param));// 점심
		request.setAttribute("day_list_3", session.selectList("mapper.sj.sjMapper.re_select_3", param));// 아침
		request.setAttribute("day_list_4", session.selectList("mapper.sj.sjMapper.re_select_4", param));// 점심
		request.setAttribute("tdy_cal", session.selectList("mapper.sj.sjMapper.today_plus", param));// 리턴값
		request.setAttribute("img", session.selectList("mapper.sj.sjMapper.img_select", param));// 이미지
		System.out.println(param);
	}

	public void counter_post(HttpServletRequest request, Map<String, Object> param) {
		session.selectList("mapper.sj.sjMapper.p_sj_today_search", param);// 프로시저
	}

	public void counter_post_up(HttpServletRequest request, Map<String, Object> param, Map<String, Object> map) {
		map.put("doy_code", session.selectOne("mapper.sj.sjMapper.today_search", param));// 데이트테이블 번호get
		System.out.println(map);
		session.insert("mapper.sj.sjMapper.re_insert", map); // 데이터 등록
		request.setAttribute("day_list_1", session.selectList("mapper.sj.sjMapper.re_select_1", map));// 아침
		request.setAttribute("day_list_2", session.selectList("mapper.sj.sjMapper.re_select_2", map));// 아침
		request.setAttribute("day_list_3", session.selectList("mapper.sj.sjMapper.re_select_3", map));// 아침
		request.setAttribute("day_list_4", session.selectList("mapper.sj.sjMapper.re_select_4", map));// 아침
		request.setAttribute("tdy_cal", session.selectList("mapper.sj.sjMapper.today_plus", map));// 리턴값
		request.setAttribute("img", session.selectList("mapper.sj.sjMapper.img_select", map));// 이미지
		
	}
	public void counter_list(HttpServletRequest request, Map<String, Object> map) {
		request.setAttribute("day_list_1", session.selectList("mapper.sj.sjMapper.re_select_1", map));// 아침
		request.setAttribute("day_list_2", session.selectList("mapper.sj.sjMapper.re_select_2", map));// 점심
		request.setAttribute("day_list_3", session.selectList("mapper.sj.sjMapper.re_select_3", map));// 아침
		request.setAttribute("day_list_4", session.selectList("mapper.sj.sjMapper.re_select_4", map));// 점심
		request.setAttribute("tdy_cal", session.selectList("mapper.sj.sjMapper.today_plus", map));// 리턴값
		request.setAttribute("img", session.selectList("mapper.sj.sjMapper.img_select", map));// 이미지
	}

	// 리스트 삭제
	public void Ingredient_ajax(ServletRequest request, Map<String, Object> map) {
		session.delete("mapper.sj.sjMapper.re_delete", map);//
	}

	// api데이터 db등록프로시저
	public Map<String, Object> counter_post_food_up(Map<String, Object> foodup, HttpServletRequest request,
			Map<String, Object> param) {
		foodup.put("doy_code", session.selectOne("mapper.sj.sjMapper.today_search", param));
		session.insert("mapper.sj.sjMapper.api_re_up", foodup);
		return foodup;
	}

	

	

	public void img( Map<String, Object> imgmap, HttpServletRequest request, Map<String, Object> param) {
		
		imgmap.put("doy_code", session.selectOne("mapper.sj.sjMapper.today_search", param));// 데이트테이블 번호get
		session.insert("mapper.sj.sjMapper.img_insert", imgmap);
		
		request.setAttribute("img", session.selectList("mapper.sj.sjMapper.img_select", imgmap));// 이미지
		
		
	}

	public void analysis(HttpServletRequest request, Map<String, Object> m) {
		request.setAttribute("average", session.selectList("mapper.sj.sjMapper.average", m));		
	}
	
	
	public void Changing_cal_poat(Map<String, Object> mymap, HttpServletRequest request) {
		System.out.println(mymap);
		session.update("mapper.sj.sjMapper.c_te_up", mymap);
		Changing_cal(mymap, request);		
	}
	public void Changing_cal(Map<String, Object> mymap, HttpServletRequest request) {
		request.setAttribute("c_te", session.selectList("mapper.sj.sjMapper.c_te", mymap));
		
	}









	public Sj_m_VO sjlogin(String id) {
		Sj_m_VO vo =   session.selectOne("mapper.sj.sjMapper.c_te_login2", id);
		return vo;
	}









	

}
