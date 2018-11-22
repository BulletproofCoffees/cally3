package cally.sharing.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import cally.sharing.beans.Cally_Member;

@Repository
public class Cally_Dao {

	@Inject
	private SqlSession sqlSession;
	
	public Cally_Member selectMember(Cally_Member m) {
		Cally_Member member = sqlSession.selectOne("mapper.cally.CallyMapper.select_member", m);
		return member;
	}
	
	
	public boolean checkId(String id) {
		int count = sqlSession.selectOne("mapper.cally.CallyMapper.check_id",id);
		if(count > 0) {
			//아이디 중복
			return true;
		} else {
			//아이디 중복없음
			return false;
		}
	}
	
	public void joinMember(Cally_Member m) {
		sqlSession.insert("mapper.cally.CallyMapper.join_member", m);
	}
}
