package cally.acbook.dao;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Repository;

import cally.sharing.beans.Cally_Member;

@Repository
public class Ac_Help_Dao {

	public int getMem_num(HttpServletRequest request) {
		// 로그인 유저의 mem_num 리턴
		Cally_Member loginUser = (Cally_Member)request.getSession().getAttribute("loginUser");
		return loginUser.getMem_num();
	}
	
	public Map<String, Object> getParaMap(HttpServletRequest request){
		//request의 파라미터를 모두 받고(배열 안됨, 단일네임 파라미터만!) mem_num도 추가함
		Map<String, Object> paraMap = new HashMap<String, Object>();
		paraMap.put("mem_num", this.getMem_num(request));
		
		Map<String, String[]> getMap = request.getParameterMap();
		Object[] keyset = getMap.keySet().toArray();
		for (int i=0; i < keyset.length; i++) {
			String key = keyset[i].toString();
			String value = getMap.get(keyset[i])[0];
			try {
				int intval = Integer.parseInt(value);
				paraMap.put(key, intval);
			} catch(Exception e) {
				paraMap.put(key, value);
			}
		}
		
		return paraMap;
	}
	
	public void writeMessage(HttpServletResponse response, String message) {
		//ajax에 다시 메세지 String을 보낼때 사용
		try {
			PrintWriter writer = response.getWriter();
			writer.write(message);
			writer.flush();
			writer.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
}
