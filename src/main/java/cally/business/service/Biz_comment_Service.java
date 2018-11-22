package cally.business.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Repository;

import cally.business.beans.Biz_comment;
import cally.business.dao.Biz_Comment_Dao;

@Repository
public class Biz_comment_Service {
	
	@Inject
	private Biz_Comment_Dao cmt_dao;
	
	public List<Biz_comment> selPj_cmt(int pj_code){
		return cmt_dao.sel_pj_cmt(pj_code);
	}
	
	public void delCmt(HashMap<String, Object> hmap) {
		cmt_dao.del_cmt(hmap);
	}
	
	public void inCmt(HashMap<String, Object> hmap) {
		cmt_dao.in_cmt(hmap);
	}
}
