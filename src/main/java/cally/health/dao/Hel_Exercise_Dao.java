package cally.health.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import cally.sharing.beans.Cally_Member;

@Repository
public class Hel_Exercise_Dao {

	@Inject
	private SqlSession session;

	public List<Map<String, Object>> Exercise(String ex) {
		return session.selectList("mapper.hel.ExerciseMapper.se_exercise", ex);
	}

	public List<Map<String, Object>> Exercise_code(String ec) {
		return session.selectList("mapper.hel.ExerciseMapper.se_exercise_code", ec);
	}

	public List<Map<String, Object>> Exercise_met(String em) {
		return session.selectList("mapper.hel.ExerciseMapper.se_exercise_met", em);
	}

	public List<Map<String, Object>> Exercise_met_code(String emc) {
		return session.selectList("mapper.hel.ExerciseMapper.se_exercise_met_code", emc);
	}
	
	public List<Map<String, Object>> Food_code(String fd) {
		return session.selectList("mapper.hel.ExerciseMapper.se_food_code", fd);
	}

	public void a_Health_Write(Map<String, Object> paraMap) {
		session.selectOne("mapper.hel.ExerciseMapper.p_hel_video", paraMap);
	}

	public void CalWrite2(Map<String, Object> paraMap) {
		session.selectOne("mapper.hel.ExerciseMapper.p_hel_cal_met", paraMap);
	}

	public List<Map<String, Object>> Calculator_one(int H_KIND) {
		return session.selectList("mapper.hel.ExerciseMapper.se_exercise_met_one", H_KIND);
	}

	public List<Map<String, Object>> Exercise_video(int HH_CODE) {
		return session.selectList("mapper.hel.ExerciseMapper.se_exercise_one", HH_CODE);
	}

}
