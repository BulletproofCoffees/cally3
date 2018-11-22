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
public class Biz_Task_Dao {
	@Inject
	private SqlSession sqlSession;
	
	public void in_Task(Biz_task bt){
		sqlSession.insert("mapper.business.BizTaskMapper.biz_in_task", bt);
	}
	
	public List<Biz_task> sel_task(HashMap<String, Object> hmap){
		return sqlSession.selectList("mapper.business.BizTaskMapper.biz_sel_task", hmap);	
	}
	
	public List<Biz_task> sel_task_im(int mem_num){
		return sqlSession.selectList("mapper.business.BizTaskMapper.biz_sel_task_im", mem_num);	
	}
	
	public List<Biz_task> sel_task_state(HashMap<String, Object> hmap){
		return sqlSession.selectList("mapper.business.BizTaskMapper.biz_sel_task_state", hmap);
	}
	
	public List<Biz_task> sel_pjtask_state(HashMap<String, Object> hmap){
		return sqlSession.selectList("mapper.business.BizTaskMapper.biz_sel_pjtask_state", hmap);
	}
	
	public Biz_task sel_task_detail(HashMap<String, Object> hmap){
		return sqlSession.selectOne("mapper.business.BizTaskMapper.biz_sel_task_detail", hmap);
	}
	
	public void up_task_date(HashMap<String, Object> hmap){
		sqlSession.update("mapper.business.BizTaskMapper.biz_up_task_date", hmap);
	}
	
	public void up_Task(Biz_task bt){
		sqlSession.update("mapper.business.BizTaskMapper.p_biz_up_task", bt);
	}
	
	public void del_Task(HashMap<String, Object> hmap) {
		sqlSession.delete("mapper.business.BizTaskMapper.biz_del_task", hmap);
	}
	
	public void up_Task_state(HashMap<String, Object> hmap){
		sqlSession.update("mapper.business.BizTaskMapper.biz_up_task_state", hmap);
	}
	
	//프로젝트별 업무 검색
	public List<Biz_task> sel_pjtask_search(HashMap<String, Object> hmap){
		return sqlSession.selectList("mapper.business.BizTaskMapper.biz_sel_pjtask_search", hmap);
	}
	
	//나의전체업무 검색
	public List<Biz_task> sel_mytask_search(HashMap<String, Object> hmap){
		return sqlSession.selectList("mapper.business.BizTaskMapper.biz_sel_mytask_search", hmap);
	}
	
} 
