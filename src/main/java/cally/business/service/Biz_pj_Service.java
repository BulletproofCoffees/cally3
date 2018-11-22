package cally.business.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Repository;

import cally.business.beans.Biz_pj;
import cally.business.beans.Biz_task;
import cally.business.dao.Biz_Pj_Dao;

@Repository
public class Biz_pj_Service {
	
	@Inject
	private Biz_Pj_Dao pj_dao;
	
	public void inProject(Biz_pj bp) {
		pj_dao.in_Project(bp);
	}
	
	public List<Biz_pj> selAll_Pj_list(int mem_num) {
		return pj_dao.sel_all_pj_list(mem_num);
	}
	
	public List<Biz_pj> selPj_list(int mem_num) {
		return pj_dao.sel_pj_list(mem_num);
	}
	
	public List<Map<String, Object>> selPj_title(int mem_num) {
		return pj_dao.sel_pj_title(mem_num);
	}
	
	public Biz_pj selPj_detail(HashMap<String, Object> hmap) {
		return pj_dao.sel_pj_detail(hmap);
	}
	
	public void delProject(HashMap<String, Object> hmap) {
		pj_dao.del_Project(hmap);
	}
	
	public int selPj_attain(int pj_code) {
		return pj_dao.sel_pj_attain(pj_code);
	}
	
	public void upPj_complete(HashMap<String, Object> hmap){
		pj_dao.up_pj_complete(hmap);
	}
	
	public void upPj(Biz_pj bp) {
		pj_dao.up_Pj(bp);
	}
	
	public int selPj_code(int share_code) {
		return pj_dao.sel_pj_attain(share_code);
	}
	
	public List<Biz_pj> selPj_search(HashMap<String, Object> hmap) {
		return pj_dao.sel_pj_search(hmap);
	}
}
