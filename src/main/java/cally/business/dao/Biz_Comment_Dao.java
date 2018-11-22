package cally.business.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import cally.business.beans.Biz_calendar;
import cally.business.beans.Biz_comment;
import cally.business.beans.Biz_pj;
import cally.business.beans.Biz_share;
import cally.business.beans.Biz_task;
import cally.sharing.beans.Cally_Member;

@Repository
public class Biz_Comment_Dao {
	@Inject
	private SqlSession sqlSession;
	
	public List<Biz_comment> sel_pj_cmt(int pj_code){
		return sqlSession.selectList("mapper.business.BizShareMapper.biz_sel_cmt", pj_code);
	}
	
	public void del_cmt(HashMap<String, Object> hmap){
		sqlSession.delete("mapper.business.BizShareMapper.biz_del_cmt", hmap);
	}
	
	public void in_cmt(HashMap<String, Object> hmap){
		sqlSession.delete("mapper.business.BizShareMapper.biz_in_cmt", hmap);
	}
	
} 
