package cally.acbook.dao;

import java.util.List;
import java.util.Map;
import java.util.Objects;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class Ac_Annual_Dao {
	
	@Inject
	private SqlSession sqlSession;
	
	public List<Integer> getAnnualInEx(Map<String, Object> paraMap){
		return sqlSession.selectList("mapper.acbook.AnnualMapper.annual_inex",paraMap);
	}
	
	public int getYearInSum(Map<String, Object> paraMap) {
		if(Objects.isNull(sqlSession.selectOne("mapper.acbook.AnnualMapper.year_in_sum", paraMap))) {
			return 0;
		} else { return (Integer) sqlSession.selectOne("mapper.acbook.AnnualMapper.year_in_sum", paraMap);}
	}
	
	public int getYearExSum(Map<String, Object> paraMap) {
		if(Objects.isNull(sqlSession.selectOne("mapper.acbook.AnnualMapper.year_ex_sum", paraMap))) {
			return 0;
		} else { return (Integer) sqlSession.selectOne("mapper.acbook.AnnualMapper.year_ex_sum", paraMap);}
	}
	
}
