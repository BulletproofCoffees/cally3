package cally.health.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import cally.health.dao.Hel_Exercise_Dao;
import cally.sharing.beans.Cally_Member;

@Service
public class Hel_Exercise_Service {

	@Inject
	private Hel_Exercise_Dao exercise_dao;

	public List<Map<String, Object>> Exercise(String ex) {
		return exercise_dao.Exercise(ex);

	}

	public List<Map<String, Object>> Exercise_code(String ec) {
		return exercise_dao.Exercise_code(ec);

	}

	public List<Map<String, Object>> Exercise_met(String em) {
		return exercise_dao.Exercise_met(em);

	}

	public List<Map<String, Object>> Exercise_met_code(String emc) {
		return exercise_dao.Exercise_met_code(emc);

	}
	
	public List<Map<String, Object>> Food_code(String fd) {
		return exercise_dao.Food_code(fd);

	}


	public String a_Health_Write(Model m, HttpServletRequest r) {

		int code = Integer.parseInt(r.getParameter("HH_CODE"));
		String key = r.getParameter("H_KEY");
		String title = r.getParameter("H_TITLE");
		String comment = r.getParameter("H_COMMENT");
		String calorie = r.getParameter("H_CALORIE");
		String name = r.getParameter("E_NAME");
		String img = "default.jpg";

		Map<String, Object> paraMap = new HashMap<String, Object>();

		paraMap.put("HH_CODE", code);
		paraMap.put("H_KEY", key);
		paraMap.put("H_TITLE", title);
		paraMap.put("H_COMMENT", comment);
		paraMap.put("E_NAME", name);
		paraMap.put("H_CALORIE", calorie);
		paraMap.put("E_IMG", img);

		// 다넣고

		exercise_dao.a_Health_Write(paraMap);

		return "admin/health/a_health_exercise";
	}

	public String CalWrite2(Model m, HttpServletRequest r) {

		int code = Integer.parseInt(r.getParameter("HM_CODE"));
		int kind = Integer.parseInt(r.getParameter("H_KIND"));
		int met = Integer.parseInt(r.getParameter("H_MET"));

		Map<String, Object> paraMap = new HashMap<String, Object>();

		paraMap.put("HM_CODE", code);
		paraMap.put("H_KIND", kind);
		paraMap.put("H_MET", met);

		// 다넣고

		exercise_dao.CalWrite2(paraMap);

		return "admin/health/a_health_calculator";
	}

	public List<Map<String, Object>> Exercise_video(HttpServletRequest r) {
		System.out.println(Integer.parseInt(r.getParameter("HH_CODE")));
		return exercise_dao.Exercise_video(Integer.parseInt(r.getParameter("HH_CODE")));

	}
	
	public List<Map<String, Object>> Calculator_one(HttpServletRequest r) {
		System.out.println(Integer.parseInt(r.getParameter("H_KIND")));
		return exercise_dao.Calculator_one(Integer.parseInt(r.getParameter("H_KIND")));

	}

}