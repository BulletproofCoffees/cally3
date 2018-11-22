package cally.sharing.service;

import java.util.Objects;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import cally.sharing.beans.Cally_Member;
import cally.sharing.dao.Cally_Dao;

@Repository
public class Cally_Service {
	@Inject
	private Cally_Dao cally_dao;
	
	public String login(Cally_Member member, Model m, HttpServletRequest request) {
		Cally_Member loginUser = cally_dao.selectMember(member);
		if(Objects.isNull(loginUser)) {
			//로그인 실패
			String message = "아이디 혹은 패스워드가 틀립니다. 다시 시도해보세요.";
			m.addAttribute("idxmessage", message);
			return "index";
		} else {
			//HttpSession에 추가해주고 리턴 트루
			request.getSession().setAttribute("loginUser", loginUser);
			
			return "view/business/business_main";
		}
	}
	
	public String join(Cally_Member member, Model m, HttpServletRequest request) {
		if(cally_dao.checkId(member.getMem_id())) {
			//아이디 중복
			String message = "중복된 아이디입니다. 다른 아이디를 사용하세요.";
			m.addAttribute("idxmessage", message);
		} else {
			//아이디 중복없음
			//가입 insert
			cally_dao.joinMember(member);
			
			String message = "가입이 완료되었습니다. 로그인 하십시오.";
			m.addAttribute("idxmessage", message);
		}
		return "index";
	}
}
