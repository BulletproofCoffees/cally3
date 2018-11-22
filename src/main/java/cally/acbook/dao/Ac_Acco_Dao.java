package cally.acbook.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class Ac_Acco_Dao {

	@Inject
	private SqlSession sqlSession;
	
	public int countAccount(int mem_num) {
		//회원의 계좌 갯수
		return sqlSession.selectOne("mapper.acbook.AccoMapper.count_acco", mem_num);
	}
	
	public void firstAccount(int mem_num) {
		//처음 회원 세팅
		sqlSession.selectOne("mapper.acbook.AccoMapper.first_acco", mem_num);
	}
	
	public List<Map<String, Object>> accoAllList(int mem_num){
		return sqlSession.selectList("mapper.acbook.AccoMapper.all_acco", mem_num);
	}
	
	public List<Map<String, Object>> accoUseList(int mem_num){
		return sqlSession.selectList("mapper.acbook.AccoMapper.use_acco", mem_num);
	}
	
	public void newAccount(Map<String, Object> paraMap) {
		sqlSession.selectOne("mapper.acbook.AccoMapper.in_acco", paraMap);
	}
	
	public int countName(Map<String, Object> paraMap) {
		return sqlSession.selectOne("mapper.acbook.AccoMapper.name_acco", paraMap);
	}
	
	public void upAccount(Map<String, Object> paraMap){
		paraMap.put("message", "message");
		sqlSession.selectOne("mapper.acbook.AccoMapper.up_acco", paraMap);
	}
	public void delAccount(Map<String, Object> paraMap){
		paraMap.put("message", "message");
		sqlSession.selectOne("mapper.acbook.AccoMapper.del_acco", paraMap);
	}
}
