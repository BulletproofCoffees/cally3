package cally.health.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class Hel_Mypage_Dao {
	
	
	
	@Inject
	private SqlSession session;

	public List<Map<String, Object>> myPage(int mem_num) {
		return session.selectList("mapper.hel.MypageMapper.se_mypage",mem_num);
	}
	
	public void Health_Mypage(Map<String, Object> paraMap) {
		session.selectOne("mapper.hel.MypageMapper.in_mypage", paraMap);
	}
	
	public void Health_Calorie(Map<String, Object> paraMap) {
		session.selectOne("mapper.hel.MypageMapper.p_hel_cal_insert", paraMap);
	}
	
/*	public void Health_Bmi(int mem_num) {
		session.selectOne("mapper.hel.MypageMapper.p_hel_cal_insert", mem_num);
	}*/
	
	public List<Map<String, Object>> Hel_Active() {
		return session.selectList("mapper.hel.MypageMapper.se_a_code");
	}
	
	public List<Map<String, Object>> Hel_Calorie(int mem_num) {
		System.out.println(session.selectList("mapper.hel.MypageMapper.se_calorie",mem_num));
		return session.selectList("mapper.hel.MypageMapper.se_calorie",mem_num);
		
	}
	
	public List<Map<String, Object>> Calorie_past(int mem_num) {
		System.out.println(session.selectList("mapper.hel.MypageMapper.se_calorie_all",mem_num));
		return session.selectList("mapper.hel.MypageMapper.se_calorie_all",mem_num);
		
	}



}
