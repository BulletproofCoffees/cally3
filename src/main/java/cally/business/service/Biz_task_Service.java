package cally.business.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Repository;

import cally.business.beans.Biz_task;
import cally.business.dao.Biz_Task_Dao;

@Repository
public class Biz_task_Service {
	
	@Inject
	private Biz_Task_Dao task_dao;
	
	public void inTask(Biz_task bt) {
		task_dao.in_Task(bt);
	}
	
	public List<Biz_task> selTask(HashMap<String, Object> hmap) {
		return task_dao.sel_task(hmap);
	}
	
	public List<Biz_task> sel_pjTask(HashMap<String, Object> hmap) {
		return task_dao.sel_pjtask_state(hmap);
	}
	
	public List<Biz_task> selTask_im(int mem_num) {
		return task_dao.sel_task_im(mem_num);
	}
	
	public void upTask_date(HashMap<String, Object> hmap) {
		task_dao.up_task_date(hmap);
	}
	
	public List<Biz_task> selTask_state(HashMap<String, Object> hmap){
		return task_dao.sel_task_state(hmap);
	}
	
	public Biz_task selTask_detail(HashMap<String, Object> hmap){
		return task_dao.sel_task_detail(hmap);
	}
	
	public void upTask(Biz_task bt) {
		task_dao.up_Task(bt);
	}
	
	public void delTask(HashMap<String, Object> hmap) {
		task_dao.del_Task(hmap);
	}
	
	public void upTask_state(HashMap<String, Object> hmap) {
		task_dao.up_Task_state(hmap);
	}
	
	public List<Biz_task> selPjtask_search(HashMap<String, Object> hmap){
		return task_dao.sel_pjtask_search(hmap);
	}
	
	public List<Biz_task> selMytask_search(HashMap<String, Object> hmap){
		return task_dao.sel_mytask_search(hmap);
	}
	
}
