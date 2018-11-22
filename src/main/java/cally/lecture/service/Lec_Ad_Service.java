package cally.lecture.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import cally.lecture.beans.Lec_Lecsearch;
import cally.lecture.dao.Lec_Ad_Dao;

@Repository
public class Lec_Ad_Service {
	@Inject
	private Lec_Ad_Dao ad_dao;
	
	//강의목록
	public  List<Map<String, Object>> sel_Lkind() {
		return ad_dao.sel_Lkind();
	}
	//강의실고르기
	public  List<Map<String, Object>> sel_Rkind() {
		return ad_dao.sel_Rkind();
	}
	//교수님고르기
	public  List<Map<String, Object>> sel_Pkind(int lec_dan_code) {
		return ad_dao.sel_Pkind(lec_dan_code);
	}
	//요일고르기
	public  List<Map<String, Object>> sel_Dkind() {
		return ad_dao.sel_Dkind();
	}
	//시간고르기
	public  List<Map<String, Object>> sel_Hkind() {
		return ad_dao.sel_Hkind();
	}
	
	//
	public Map<String,Object> lecInfo(int lec_code) {
		return ad_dao.lec_info(lec_code);		
}
	
	//강의디테일
	public Map<String, Object> lecDetail(int code) {
		return ad_dao.lec_detail(code);
}
	//강의스케쥴삭제
	public void lecScheDel(int code) {
		ad_dao.lec_sche_del(code);
	}
	
	//강의평가리스트
	public List<Map<String, Object>> eval_list() {
		return ad_dao.eval_list();
	}
	
	//학생리스트
	public List<Map<String, Object>> st_list() {
		return ad_dao.st_list();
	}
	//휴학재학학생찾기
	public List<Map<String, Object>> st_sear(String info) {
		return ad_dao.st_sear(info);
}
	//이름찾기
	public List<Map<String, Object>> st_Nsear(String name) {
		return ad_dao.st_Nsear(name);
}
	//성적디테일
	public List<Map<String, Object>> recDetail(int code) {
		return ad_dao.rec_detail(code);
}
}
