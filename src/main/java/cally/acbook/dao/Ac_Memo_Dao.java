package cally.acbook.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import cally.acbook.beans.Ac_Memo;
import cally.sharing.beans.Cally_Member;

@Repository
public class Ac_Memo_Dao {
	@Inject
	private SqlSession sqlSession;
	
	public List<Map<String, Object>> calMemo(Map<String, Object> paraMap){		
		return sqlSession.selectList("mapper.acbook.MemoMapper.memo_cal", paraMap);	
	}
	
	public List<Ac_Memo> getMemobasic(int mem_num){		
		return sqlSession.selectList("mapper.acbook.MemoMapper.memo_basic", mem_num);	
	}
	
	public List<Ac_Memo> getMemolist(Map<String, Object> paraMap){
		
		return sqlSession.selectList("mapper.acbook.MemoMapper.memo_view", paraMap);
	}
	
	public String getMemo(Map<String, Object> paraMap) {
		return sqlSession.selectOne("mapper.acbook.MemoMapper.memo_daily", paraMap);
	}
	
	public void inMemo(Map<String, Object> paraMap) {
		sqlSession.selectList("mapper.acbook.MemoMapper.memo_in", paraMap);
	}
} 
