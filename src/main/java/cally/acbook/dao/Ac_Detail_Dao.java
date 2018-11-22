package cally.acbook.dao;

import java.util.List;
import java.util.Map;
import java.util.Objects;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class Ac_Detail_Dao {

	@Inject
	SqlSession sqlSession;
	
	public void inDetail(Map<String, Object> paraMap) {
		sqlSession.selectOne("mapper.acbook.DetailMapper.in_detail",paraMap);
	}
	public void delDetail(int det_code) {
		System.out.println("det_code : " + det_code);
		sqlSession.delete("mapper.acbook.DetailMapper.del_detail",det_code);
	}
	
	public List<Map<String, Object>> calIn(Map<String, Object> paraMap) {
		return sqlSession.selectList("mapper.acbook.DetailMapper.cal_inlist", paraMap);
	}
	public List<Map<String, Object>> calEx(Map<String, Object> paraMap) {
		return sqlSession.selectList("mapper.acbook.DetailMapper.cal_exlist", paraMap);
	}
	
	public List<Map<String, Object>> getDetailList(Map<String, Object> paraMap) {
		//out 변수가 다시 paraMap에 담긴다. 여기서 detList만 가져와서 리턴한다.
		sqlSession.selectOne("mapper.acbook.DetailMapper.det_list", paraMap);
		return (List<Map<String, Object>>) paraMap.get("detList");
	}
	
	public Map<String, Object> getSubmenu(Map<String, Object> paraMap) {
		sqlSession.selectOne("mapper.acbook.DetailMapper.sub_info", paraMap);
		return paraMap;
	}
	
	public List<Map<String, Object>> getMonthlyExByCate(Map<String, Object> paraMap) {
		//한달간 대분류 별 지출합계
		return sqlSession.selectList("mapper.acbook.DetailMapper.mon_ex_bycate", paraMap);	
	}
	public List<Map<String, Object>> getMonthlyExByCate2(Map<String, Object> paraMap) {
		//한달간 대분류 별 지출합계
		return sqlSession.selectList("mapper.acbook.DetailMapper.mon_ex_bycate2", paraMap);	
	}
	public List<Map<String, Object>> getMonthlyInByCate(Map<String, Object> paraMap) {
		//한달간 대분류 별 수입합계
		return sqlSession.selectList("mapper.acbook.DetailMapper.mon_in_bycate", paraMap);	
	}
	
	public int getMonthlyInSum(Map<String, Object> paraMap) {
		if(Objects.isNull(sqlSession.selectOne("mapper.acbook.DetailMapper.mon_in_sum", paraMap))) {
			return 0;
		} else { return (Integer) sqlSession.selectOne("mapper.acbook.DetailMapper.mon_in_sum", paraMap);}
	}
	public int getMonthlyExSum(Map<String, Object> paraMap) {
		if(Objects.isNull(sqlSession.selectOne("mapper.acbook.DetailMapper.mon_ex_sum", paraMap))) {
			return 0;
		} else { return (Integer) sqlSession.selectOne("mapper.acbook.DetailMapper.mon_ex_sum", paraMap);}
	}
	
	public List<Map<String, Object>> getMonthlySubSum(Map<String, Object> paraMap) {
		return sqlSession.selectList("mapper.acbook.DetailMapper.mon_sub",paraMap);
	}
	
}
