package cally.lecture.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.omg.CORBA.Request;
import org.springframework.stereotype.Repository;

import cally.lecture.beans.Lec_Eval;
import cally.lecture.beans.Lec_Lecsearch;

@Repository
public class Lec_Dao {
	@Inject
	private  SqlSession session;
	
	public String lectureMain(int mem_num) {
		return session.selectOne("mapper.lec.lectureMapper.st_info", mem_num);
	}
	
	//강의목록
	public List<Lec_Lecsearch> lec_list() {
		return session.selectList("mapper.lec.lectureMapper.all_lec");
	}
	
	//강의검색
	public List<Lec_Lecsearch> lec_s_list(Lec_Lecsearch e) {
		return session.selectList("mapper.lec.lectureMapper.search_lec", e);
	}
	
	//개인강의검색
	public List<Lec_Lecsearch> lec_indi_list(Lec_Lecsearch e) {
		return session.selectList("mapper.lec.lectureMapper.search_indi_lec", e);
	}
	
	//개인강의삭제
	public void lec_del(Lec_Lecsearch e) {
		session.selectOne("mapper.lec.lectureMapper.p_lec_del", e);
	}
	
	//개인강의시간표검색
	public List<Lec_Lecsearch> lec_time_list(Lec_Lecsearch e) {
		return session.selectList("mapper.lec.lectureMapper.search_time_lec", e);
	}
	
	public void lec_app_pro(Lec_Lecsearch e) {
		session.selectOne("mapper.lec.lectureMapper.p_lec_app", e);
	}
	
	//강의평가 강의리스트
	public List<Lec_Lecsearch> sel_eval(int mem_num) {
		return session.selectList("mapper.lec.lectureMapper.sel_eval", mem_num);
	}
	
	//강의평가 평가리스트
	public Map<String,Object> list_eval(int lec_app_code) {
		return session.selectOne("mapper.lec.lectureMapper.list_eval", lec_app_code);
	}
	
	//강의평가 업데이트
	public void eval_app(Lec_Eval e) {
		session.selectOne("mapper.lec.lectureMapper.p_lec_eval", e);
	}
	
	/*	휴학신청 	*/
	//휴학신청
	public void leave_app(Lec_Eval e) {
		session.selectOne("mapper.lec.lectureMapper.p_lec_leave_app", e);
	}
	
	public Map<String,Object> leave_info(Map<String, Object> param) {
		System.out.println(param.toString());
		return session.selectOne("mapper.lec.lectureMapper.leav_info", param);
	}
	

}
