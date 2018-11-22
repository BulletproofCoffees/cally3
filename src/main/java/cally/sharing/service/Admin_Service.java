package cally.sharing.service;

import java.util.Objects;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import cally.sharing.beans.Cally_Admin;
import cally.sharing.beans.Cally_Member;
import cally.sharing.dao.Admin_Dao;

@Repository
public class Admin_Service {
	@Inject
	private Admin_Dao admin_dao;

	public String login(Cally_Admin adm, Model m, HttpServletRequest request, Cally_Member mem) {
		Cally_Admin loginAdmin = admin_dao.selectAdmin(adm);
		if(Objects.isNull(loginAdmin)) {
			//로그인 실패
			String message = "아이디 혹은 패스워드가 틀립니다. 다시 시도해보세요.";
			m.addAttribute("message", message);
			return "admin/admin_login";
		}  else {
			//HttpSession에 추가해주고 리턴 트루
			request.getSession().setAttribute("loginAdmin", loginAdmin);
			m.addAttribute("memberlist", admin_dao.memberList(mem));
			return "admin/member/a_member_list";
		}
	}
	
	public String memberList(Cally_Member mem, Model m) {
		m.addAttribute("memberlist", admin_dao.memberList(mem));
		return "admin/member/a_member_list";
	}
	
	public void subMember(Model m) {
		m.addAttribute("sum_y", admin_dao.subMember("y"));
		m.addAttribute("sum_n", admin_dao.subMember("n"));
	}
}
