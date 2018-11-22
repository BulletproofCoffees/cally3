package cally.business.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Repository;

import cally.business.beans.Biz_share;
import cally.business.dao.Biz_Share_Dao;

@Repository
public class Biz_share_Service {
	
	@Inject
	private Biz_Share_Dao share_dao;
	
	public int selSharecode(HashMap<String, Object> hmap) {
		return share_dao.sel_sharecode(hmap);
	}
	
	public List<Biz_share> selShare_list(int pj_code){
		return share_dao.sel_share_list(pj_code);
	}	
	
	public List<Biz_share> selShare_invite(int pj_code){
		return share_dao.sel_share_invite(pj_code);
	}
	
	public int selAuth_code(HashMap<String, Object> hmap) {
		return share_dao.sel_auth_code(hmap);
	}
	
	public void upAuth_code(HashMap<String, Object> hmap) {
		share_dao.up_auth_code(hmap);
	}
	
	public void delShare(HashMap<String, Object> hmap) {
		share_dao.del_share(hmap);
	}
}
