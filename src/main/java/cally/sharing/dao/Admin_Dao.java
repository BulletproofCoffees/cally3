package cally.sharing.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import cally.sharing.beans.Cally_Admin;
import cally.sharing.beans.Cally_Member;

@Repository
public class Admin_Dao {

	@Inject
	private SqlSession sqlSession;
	
	public Cally_Admin selectAdmin(Cally_Admin adm) {
		return sqlSession.selectOne("mapper.cally.CallyMapper.select_admin", adm);
	}
	
	public List<Cally_Member> memberList(Cally_Member mem) {
		return sqlSession.selectList("mapper.cally.CallyMapper.list_member", mem);
	}
	
	public int subMember(String yorn) {
		return sqlSession.selectOne("mapper.cally.CallyMapper.sub_member", yorn);
	}
	
}
