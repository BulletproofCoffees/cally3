package cally.business.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import cally.business.beans.Biz_share;

@Repository
public class Biz_Share_Dao {
	@Inject
	private SqlSession sqlSession;
	
	public int sel_sharecode(HashMap<String, Object> hmap){
		return sqlSession.selectOne("mapper.business.BizShareMapper.biz_sel_sharecode", hmap);
	}
	
	public List<Biz_share> sel_share_list(int pj_code){
		return sqlSession.selectList("mapper.business.BizShareMapper.biz_sel_share_list", pj_code);
	}
	
	public List<Biz_share> sel_share_invite(int pj_code){
		return sqlSession.selectList("mapper.business.BizShareMapper.biz_sel_share_invite", pj_code);
	}
	
	public int sel_auth_code(HashMap<String, Object> hmap){
		return sqlSession.selectOne("mapper.business.BizShareMapper.biz_sel_auth_code", hmap);
	}
	
	public void up_auth_code(HashMap<String, Object> hmap){
		sqlSession.update("mapper.business.BizShareMapper.biz_up_auth", hmap);
	}
	
	public void del_share(HashMap<String, Object> hmap){
		sqlSession.delete("mapper.business.BizShareMapper.biz_del_share", hmap);
	}
	
	
} 
