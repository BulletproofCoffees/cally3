package cally.business.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
public class Biz_Pj_Dao {
	@Inject
	private SqlSession sqlSession;
	
	//프로젝트 생성
	public void in_Project(Biz_pj bp){
		sqlSession.insert("mapper.business.BizPjMapper.p_biz_in_pj", bp);
	}
	
	//전체 프로젝트 리스트
	public List<Biz_pj> sel_all_pj_list(int mem_num){
		return sqlSession.selectList("mapper.business.BizPjMapper.biz_sel_pj_all", mem_num);	
	}
	
	//진행중인 프로젝트 리스트
	public List<Biz_pj> sel_pj_list(int mem_num){
		return sqlSession.selectList("mapper.business.BizPjMapper.biz_sel_pj", mem_num);	
	}
	
	//프로젝트 수정
	public void up_Pj(Biz_pj bp){
		sqlSession.update("mapper.business.BizPjMapper.biz_up_pj", bp);
	}
	
	//프로젝트 상세
	public Biz_pj sel_pj_detail(HashMap<String, Object> hmap){
		return sqlSession.selectOne("mapper.business.BizPjMapper.biz_sel_pj_detail", hmap);
	}
	
	public int sel_pj_attain(int pj_code){
		return sqlSession.selectOne("mapper.business.BizPjMapper.biz_sel_pj_attain", pj_code);
	}
	
	//프로젝트 리스트(타이틀)
	public List<Map<String, Object>> sel_pj_title(int mem_num){
		return sqlSession.selectList("mapper.business.BizPjMapper.biz_sel_pj_title", mem_num);
	}
	
	public void up_pj_complete(HashMap<String, Object> hmap){
		sqlSession.update("mapper.business.BizPjMapper.biz_up_complete", hmap);
	}
	
	//프로젝트 삭제
	public void del_Project(HashMap<String, Object> hmap){
		sqlSession.delete("mapper.business.BizPjMapper.biz_del_pj", hmap);
	}
	
	public int sel_pj_code(int share_code){
		return sqlSession.selectOne("mapper.business.BizPjMapper.biz_sel_pjcode", share_code);
	}
	
	//프로젝트 검색
	public List<Biz_pj> sel_pj_search(HashMap<String, Object> hmap){
		return sqlSession.selectList("mapper.business.BizPjMapper.biz_pj_search", hmap);
	}
	
} 
