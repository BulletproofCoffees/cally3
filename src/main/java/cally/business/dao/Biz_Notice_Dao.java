package cally.business.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import cally.business.beans.Biz_notice;
import cally.sharing.beans.Cally_Member;

@Repository
public class Biz_Notice_Dao {
	@Inject
	private SqlSession sqlSession;
	
	public List<Biz_notice> sel_Notice(int mem_num){
		return sqlSession.selectList("mapper.business.BizNoticeMapper.biz_sel_notice", mem_num);	
	}
	
	public List<Biz_notice> sel_Notice_all(int mem_num){
		return sqlSession.selectList("mapper.business.BizNoticeMapper.biz_sel_notice_all", mem_num);	
	}
	
	public int sel_Notice_new(int mem_num){
		return sqlSession.selectOne("mapper.business.BizNoticeMapper.biz_sel_notice_new", mem_num);	
	}
	
	public List<Biz_notice> sel_Notice_search(HashMap<String, Object> hmap){
		return sqlSession.selectList("mapper.business.BizNoticeMapper.biz_sel_notice_search", hmap);	
	}
	
	public void in_notice(HashMap<String, Object> hmap){
		sqlSession.insert("mapper.business.BizNoticeMapper.biz_in_notice_msg", hmap);
	}
	
	public void in_notice_invite(HashMap<String, Object> hmap){
		sqlSession.insert("mapper.business.BizNoticeMapper.biz_in_notice_invite", hmap);
	}
	
	public void up_n_state(int user_n_code){
		sqlSession.update("mapper.business.BizNoticeMapper.biz_up_notice_state", user_n_code);
	}
	
	public void up_notice_invite(HashMap<String, Object> hmap){
		sqlSession.update("mapper.business.BizNoticeMapper.biz_up_notice_invite", hmap);
	}
	
	public void del_notice(int user_n_code) {
		sqlSession.delete("mapper.business.BizNoticeMapper.biz_del_notice", user_n_code);
	}
} 
