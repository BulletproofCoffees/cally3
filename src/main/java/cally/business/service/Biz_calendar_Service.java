package cally.business.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Repository;

import com.google.gson.JsonElement;

import cally.business.beans.Biz_calendar;
import cally.business.beans.Biz_task;
import cally.business.dao.Biz_Calendar_Dao;
import cally.sharing.dao.Cally_Dao;

@Repository
public class Biz_calendar_Service {
	
	@Inject private Cally_Dao cally_dao;
	@Inject private Biz_Calendar_Dao cal_dao;
	
	public int getMem_num(HttpServletRequest request) {
		return cal_dao.getMem_num(request);
	}

	public List<Biz_calendar> selCalendar(int mem_num) {
		return cal_dao.sel_Calendar(mem_num);
	}
	
	public List<Biz_calendar> selCalendar_im(int mem_num) {
		return cal_dao.sel_Calendar_im(mem_num);
	}
	
	public Biz_calendar selCal_detail(HashMap<String, Object> hmap){
		return cal_dao.sel_cal_detail(hmap);
	}
	
	public void inCalendar(Biz_calendar bc) {
		cal_dao.in_Calendar(bc);
	}
	
	public void upCal_date(HashMap<String, Object> hmap) {
		cal_dao.up_Cal_date(hmap);
	}
	
	public void upCalendar(Biz_calendar bc) {
		cal_dao.up_Calendar(bc);
	}
	
	public void delCalendar(HashMap<String, Object> hmap) {
		cal_dao.del_Calendar(hmap);
	}
}
