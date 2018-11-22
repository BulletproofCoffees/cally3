package cally.acbook.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import cally.acbook.beans.Ac_Budget;
import cally.sharing.beans.Cally_Member;

@Repository
public class Ac_Budget_Dao {

	@Inject
	private SqlSession sqlSession;
	
	public boolean checkBudget(Map<String, Object> paraMap) {
		int count = sqlSession.selectOne("mapper.acbook.BudgetMapper.check_budget", paraMap);
		if(count == 0) {
			return false;
		} else {
			return true;
		}
	}
	
	public List<Ac_Budget> listBudget(Map<String, Object> paraMap){
		List<Ac_Budget> list = sqlSession.selectList("mapper.acbook.BudgetMapper.list_budget", paraMap);
		return list;
	}
	
	public void inBudget(Map<String, Object> paraMap) {
		sqlSession.selectOne("mapper.acbook.BudgetMapper.in_budget",paraMap);
	}
}
