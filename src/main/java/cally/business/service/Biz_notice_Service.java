package cally.business.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Repository;

import cally.business.beans.Biz_notice;
import cally.business.dao.Biz_Notice_Dao;


@Repository
public class Biz_notice_Service {

	@Inject
	private Biz_Notice_Dao no_dao;
	
	public List<Biz_notice> selNotice(int mem_num) {
		return no_dao.sel_Notice(mem_num);
	}
	
	public List<Biz_notice> selNotice_all(int mem_num) {
		return no_dao.sel_Notice_all(mem_num);
	}
	
	public List<Biz_notice> selNotice_search(HashMap<String, Object> hmap) {
		return no_dao.sel_Notice_search(hmap);
	}
	
	public int selNotice_new(int mem_num) {
		return no_dao.sel_Notice_new(mem_num);
	}
	
	public void inNotice_msg(HashMap<String, Object> hmap) {
		no_dao.in_notice(hmap);
	}
	
	public void inNotice_invite(HashMap<String, Object> hmap) {
		no_dao.in_notice_invite(hmap);
	}
	
	public void upNotice_state(int user_n_code) {
		no_dao.up_n_state(user_n_code);
	}
	
	public void upNotice_invite(HashMap<String, Object> hmap) {
		no_dao.up_notice_invite(hmap);
	}
	
	public void delNotice(int user_n_code) {
		no_dao.del_notice(user_n_code);
	}
}
