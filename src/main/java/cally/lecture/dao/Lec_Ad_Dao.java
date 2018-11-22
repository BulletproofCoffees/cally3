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
public class Lec_Ad_Dao {
	@Inject
	private SqlSession session;
	
	//강의검색-LEC REGI SEL
	public List<Map<String, Object>> sel_Lkind() {
		return session.selectList("mapper.lec.AdminMapper.selL_kind");
	}
	//강의실 고르기-LEC REGI SEL
	public List<Map<String, Object>> sel_Rkind() {
		return session.selectList("mapper.lec.AdminMapper.selR_kind");
	}
	//교수님 고르기-LEC REGI SEL
	public List<Map<String, Object>> sel_Pkind(int lec_dan_code) {
		return session.selectList("mapper.lec.AdminMapper.selP_kind",lec_dan_code);
	}
	//요일 고르기-LEC REGI SEL
	public List<Map<String, Object>> sel_Dkind() {
		return session.selectList("mapper.lec.AdminMapper.selD_kind");
	}
	//시간 고르기-LEC REGI SEL
	public List<Map<String, Object>> sel_Hkind() {
		return session.selectList("mapper.lec.AdminMapper.selH_kind");
	}
	
	//강의뿌리기
	public Map<String,Object> lec_info(int lec_code) {
		return session.selectOne("mapper.lec.AdminMapper.selL_info", lec_code);
	}
	
	//강의디테일
	public Map<String, Object> lec_detail(int code) {
		return session.selectOne("mapper.lec.AdminMapper.lec_detail", code);
	}
	
	//강의삭제
	public void lec_sche_del(int code) {
		session.selectOne("mapper.lec.AdminMapper.p_lec_sche_del", code);
	}
	
	//강의평가목록
	public List<Map<String, Object>> eval_list() {
		return session.selectList("mapper.lec.AdminMapper.eval_list");
	}
	
	//학생목록
	public List<Map<String, Object>> st_list() {
		return session.selectList("mapper.lec.AdminMapper.st_list");
	}
	
	//휴학재학
	public List<Map<String, Object>> st_sear(String info) {
		return session.selectList("mapper.lec.AdminMapper.st_sear", info);
	}
	//이름
	public List<Map<String, Object>> st_Nsear(String name) {
		return session.selectList("mapper.lec.AdminMapper.st_name_sear", name);
	}
	//성적디테일
	public List<Map<String, Object>> rec_detail(int code) {
		return session.selectList("mapper.lec.AdminMapper.rec_detail", code);
	}
	

}
