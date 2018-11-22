package cally.business.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import cally.business.beans.Biz_calendar;
import cally.business.beans.Biz_task;
import cally.sharing.beans.Cally_Member;

@Repository
public class Biz_Calendar_Dao {
	@Inject
	private SqlSession sqlSession;
	
	public int getMem_num(HttpServletRequest request) {
		// 로그인 유저의 mem_num 리턴
		Cally_Member loginUser = (Cally_Member)request.getSession().getAttribute("loginUser");
		return loginUser.getMem_num();
	}
	
	public List<Biz_calendar> sel_Calendar(int mem_num){
		return sqlSession.selectList("mapper.business.BizCalMapper.biz_sel_cal", mem_num);	
	}
	
	public List<Biz_calendar> sel_Calendar_im(int mem_num){
		return sqlSession.selectList("mapper.business.BizCalMapper.biz_sel_cal_im", mem_num);	
	}
	
	public Biz_calendar sel_cal_detail(HashMap<String, Object> hmap){
		return sqlSession.selectOne("mapper.business.BizCalMapper.biz_sel_cal_detail", hmap);
	}
	
	public void in_Calendar(Biz_calendar bc){
		sqlSession.insert("mapper.business.BizCalMapper.p_biz_in_cal", bc);
	}
	
	public void up_Cal_date(HashMap<String, Object> hmap){
		sqlSession.update("mapper.business.BizCalMapper.biz_up_cal_date", hmap);
	}
	
	public void up_Calendar(Biz_calendar bc){
		sqlSession.update("mapper.business.BizCalMapper.p_biz_up_cal", bc);
	}

	public void del_Calendar(HashMap<String, Object> hmap) {
		sqlSession.delete("mapper.business.BizCalMapper.biz_del_cal", hmap);
	}
} 
