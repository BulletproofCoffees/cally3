package cally.acbook.dao;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public class Ac_Naver_Api {
	public String getJson(Map<String, Object> paraMap) {
		String clientId = "LRmqlOB4j8pjTXGBQuel";//애플리케이션 클라이언트 아이디값";
		String clientSecret = "OyTtneLaAf";//애플리케이션 클라이언트 시크릿값";
		String result = null;

		final String theme = "shop";
		final int display = 9;
		String query = (String) paraMap.get("query");
		int start = (Integer) paraMap.get("start");
		String sort = (String) paraMap.get("sort");
		
		try {
		    String text = URLEncoder.encode(query, "UTF-8");
		    String apiURL = "https://openapi.naver.com/v1/search/"+theme+"?query="+ text
		    		+ "&display=" + display + "&start=" + start
		    		+ "&sort=" + sort ; // json 결과
		    URL url = new URL(apiURL);
		    HttpURLConnection con = (HttpURLConnection)url.openConnection();
		    con.setRequestMethod("GET");
		    con.setRequestProperty("X-Naver-Client-Id", clientId);
		    con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
		    int responseCode = con.getResponseCode();
		    BufferedReader br;
		    if(responseCode==200) { // 정상 호출
		        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		    } else {  // 에러 발생
		        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		    }
		    String inputLine;
		    StringBuffer res = new StringBuffer();
		    while ((inputLine = br.readLine()) != null) {
		        res.append(inputLine);
		    }
		    br.close();
		    //콘솔에 출력
		    System.out.println(res.toString());
		    //Json 결과 리턴
		    result = res.toString();
		} catch (Exception e) {
		    System.out.println(e);
		} return result;
		}
}
