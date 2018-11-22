package cally.acbook.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class Ac_Card_Dao {

	@Inject
	private SqlSession sqlSession;
	
	public List<Map<String, Object>> cardAllList(int mem_num){
		return sqlSession.selectList("mapper.acbook.CardMapper.all_card", mem_num);
	}
	
	public List<Map<String, Object>> cardUseList(int mem_num){
		return sqlSession.selectList("mapper.acbook.CardMapper.use_card", mem_num);
	}

	public List<Map<String, Object>> cardcomList(){
		return sqlSession.selectList("mapper.acbook.CardMapper.all_cardcom");
	}
	
	public void getCardFee(Map<String, Object> paraMap) {
		sqlSession.selectOne("mapper.acbook.CardMapper.card_fee", paraMap);
	}
	
	public void newCard(Map<String, Object> paraMap) {
		sqlSession.selectOne("mapper.acbook.CardMapper.new_card", paraMap);
	}
	
	public void upCard(Map<String, Object> paraMap) {
		sqlSession.selectOne("mapper.acbook.CardMapper.up_card", paraMap);
	}
	
	public void delCard(Map<String, Object> paraMap) {
		sqlSession.selectOne("mapper.acbook.CardMapper.del_card", paraMap);
	}
}
