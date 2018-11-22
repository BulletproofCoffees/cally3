package cally.acbook.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import cally.acbook.beans.Ac_Sub;
import cally.sharing.beans.Cally_Member;

@Repository
public class Ac_Cate_Dao {

	@Inject
	SqlSession sqlSession;
	
	public List<Ac_Sub> getBasicList(int cate_code) {
		return sqlSession.selectList("mapper.acbook.CateMappr.list_basic", cate_code);
	}
	public List<Ac_Sub> getUserList(Map<String, Object> paraMap) {
		return sqlSession.selectList("mapper.acbook.CateMappr.list_user", paraMap);
	}
	public List<Ac_Sub> getUser13(Map<String, Object> paraMap) {
		return sqlSession.selectList("mapper.acbook.CateMappr.list_13y", paraMap);
	}
	public List<Ac_Sub> getUser14(Map<String, Object> paraMap) {
		return sqlSession.selectList("mapper.acbook.CateMappr.list_14y", paraMap);
	}
	
	public boolean checkSubName(Map<String, Object> paraMap) {
		int count = sqlSession.selectOne("mapper.acbook.CateMappr.check_subname", paraMap);
		System.out.println("이름중복수:" + count);
		if(count == 0) {
			return true;
		} else { return false;
		}
	}
	
	public boolean checkSubCount(Map<String, Object> paraMap) {
		int count = sqlSession.selectOne("mapper.acbook.CateMappr.check_subcount", paraMap);
		System.out.println("소분류수:" + count);
		if(count < 15) { return true;} else {return false;}
	}
	
	public void newSubclass(Map<String, Object> paraMap) {
		sqlSession.insert("mapper.acbook.CateMappr.new_sub", paraMap);
	}
	
	public void delSubclass(Map<String, Object> paraMap) {
		sqlSession.delete("mapper.acbook.CateMappr.del_sub",paraMap);
	}
	
	public void upSubclass(Map<String, Object> paraMap) {
		sqlSession.update("mapper.acbook.CateMappr.up_sub",paraMap);
	}
	
}
