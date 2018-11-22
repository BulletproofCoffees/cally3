package cally.sj.service;


import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;

import java.util.HashMap;
import java.util.Map;
import java.util.Objects;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Repository;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import cally.sharing.beans.Cally_Member;
import cally.sj.beans.Sj_m_VO;
import cally.sj.dao.Sj_Dao;

@Repository
public class Sj_Service {
	@Inject
	private Sj_Dao sj_dao;
	
	public void callyM_Service( ServletRequest request, HttpServletRequest req) {
		Cally_Member loginUser = (Cally_Member) req.getSession().getAttribute("loginUser");		
		String id  = loginUser.getMem_id();	
		sj_dao.doP_in_t_enter(new Cally_Member(id), request);	
			
		//interceptor용
		Sj_m_VO sjlogin = sj_dao.sjlogin(id);
		req.getSession().setAttribute("sjlogin", sjlogin);
	}
	public void hm_join(ServletRequest request) {	
		int mem_num =  Integer.parseInt(request.getParameter("mem_num"));
		String sex = request.getParameter("sex");
	      Map<String, Object> param = new HashMap<>();	
	      param.put("mem_num", mem_num);
	      param.put("sex", sex);
	      sj_dao.hm_join(param,request);
	}
	

	public void food_search(ServletRequest request, String desc_kor) {
		Map<String, Object> param = new HashMap<>();
		param.put("DESC_KOR", desc_kor);
		sj_dao.food_search(request, param,desc_kor);
		
	}	
	public void food_search(ServletRequest request) {		
		String desc_kor = request.getParameter("desc_kor");
		 if (Objects.isNull(desc_kor)) {
			  desc_kor = "안성탕면";
		  }
		Map<String, Object> param = new HashMap<>();
		param.put("DESC_KOR", desc_kor);
		sj_dao.food_search(request, param,desc_kor);		
	}

	
	
	
	
	public void counter(HttpServletRequest request, String bno) {		
		Cally_Member loginUser = (Cally_Member) request.getSession().getAttribute("loginUser");	
		int m_num = loginUser.getMem_num();	
		String dayurl = bno.substring(bno.lastIndexOf("=")+1);

		Map<String, Object> param = new HashMap<>();
		param.put("m_num", m_num);
		param.put("dayurl", dayurl);		
		sj_dao.counter_post(request,param);//날짜 프로시저
		sj_dao.counter(request, param);
	
	}

	
	// 리스트 삭제
	public void Ingredient_ajax(ServletRequest request) {		
		String button = request.getParameter("button");
		System.out.println("ajax" + button);
		Map<String, Object> map = new HashMap<>();
		map.put("re_no", button);
		sj_dao.Ingredient_ajax(request, map);
	}
	
	
	@Resource(name="uploadPath")
	 private String upath;
	public void counter_post_img(HttpServletRequest request, MultipartFile img, String text) {
		
		Cally_Member loginUser = (Cally_Member) request.getSession().getAttribute("loginUser");		
		int m_num = loginUser.getMem_num();		
		String dayurl =request.getParameter("dayurl");				  
		Map<String, Object> param = new HashMap<>();
		param.put("m_num", m_num);
		param.put("dayurl", dayurl);
		
		//이름램덤생성기		
		UUID uid = UUID.randomUUID();
		String oname = img.getOriginalFilename();
		String fname = uid.toString() + "_" + oname;
		// 파일생성
		File sfile = new File(upath, fname);		
		try {
			Map<String, Object> imgmap = new HashMap<>();
			imgmap.put("img", fname);
			imgmap.put("text", text);	
			sj_dao.img(imgmap,request,param);
			
			FileCopyUtils.copy(img.getBytes(), sfile);
					
			
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		
	}

	public void counter_post(HttpServletRequest request) throws ParseException, UnsupportedEncodingException {		
		
		Cally_Member loginUser = (Cally_Member) request.getSession().getAttribute("loginUser");		
		int m_num = loginUser.getMem_num();		
		String dayurl =request.getParameter("dayurl");		
		  
		Map<String, Object> param = new HashMap<>();
		param.put("m_num", m_num);
		param.put("dayurl", dayurl);		
		sj_dao.counter_post(request,param);
  	
		int the_code = Integer.parseInt(request.getParameter("the_code")); //아점저코드
		String[] DESC_KOR  = request.getParameterValues("DESC_KOR");//음식이름
		String[] AMOUNT = request.getParameterValues("AMOUNT");//수량		
		String[] F_NO = request.getParameterValues("F_NO");//음식넘버
		
		String[] SERVING_WT = request.getParameterValues("SERVING_WT");//일회제공량
		String[] MN = request.getParameterValues("ANIMAL_PLANT");//제조사
	    String[] NUTR_CONT1 = request.getParameterValues("NUTR_CONT1");//
		String[] NUTR_CONT2 = request.getParameterValues("NUTR_CONT2");//
		String[] NUTR_CONT3 = request.getParameterValues("NUTR_CONT3");//
		String[] NUTR_CONT4 = request.getParameterValues("NUTR_CONT4");//
		String[] NUTR_CONT5 = request.getParameterValues("NUTR_CONT5");//
		String[] NUTR_CONT6 = request.getParameterValues("NUTR_CONT6");//
		String[] NUTR_CONT7 = request.getParameterValues("NUTR_CONT7");//
		String[] NUTR_CONT8 = request.getParameterValues("NUTR_CONT8");//
		String[] NUTR_CONT9 = request.getParameterValues("NUTR_CONT9");//
	
		for (int i = 0; i < F_NO.length; i++) {
			float amount = Float.valueOf(AMOUNT[i]);
			int f_no = Integer.parseInt(F_NO[i]);

			if (f_no == 0) {

				float nu1 = Float.parseFloat(NUTR_CONT1[i]);
				float nu2 = Float.parseFloat(NUTR_CONT2[i]);
				float nu3 = Float.parseFloat(NUTR_CONT3[i]);
				float nu4 = Float.parseFloat(NUTR_CONT4[i]);
				float nu5 = Float.parseFloat(NUTR_CONT5[i]);
				float nu6 = Float.parseFloat(NUTR_CONT6[i]);
				float nu7 = Float.parseFloat(NUTR_CONT7[i]);
				float nu8 = Float.parseFloat(NUTR_CONT8[i]);
				float nu9 = Float.parseFloat(NUTR_CONT9[i]);

				Map<String, Object> foodup = new HashMap<>();
				foodup.put("MN", MN[i]);
				foodup.put("DESC_KOR", DESC_KOR[i]);
				foodup.put("SERVING_WT", SERVING_WT[i]);

				foodup.put("NUTR_CONT1", nu1);
				foodup.put("NUTR_CONT2", nu2);
				foodup.put("NUTR_CONT3", nu3);
				foodup.put("NUTR_CONT4", nu4);
				foodup.put("NUTR_CONT5", nu5);
				foodup.put("NUTR_CONT6", nu6);
				foodup.put("NUTR_CONT7", nu7);
				foodup.put("NUTR_CONT8", nu8);
				foodup.put("NUTR_CONT9", nu9);
				
				foodup.put("the_code", the_code);				
				foodup.put("amount", amount);
				
				Map<String, Object> map = sj_dao.counter_post_food_up(foodup,request,param);
				map.put("f_no", f_no);
				sj_dao.counter_list(request, map);
				
				
				
			} else {
				Map<String, Object> map = new HashMap<>();
				map.put("the_code", the_code);
				map.put("DESC_KOR", DESC_KOR[i]);
				map.put("amount", amount);
				map.put("f_no", f_no);
				System.out.println(map);
				sj_dao.counter_post_up(request, param, map);

			}
       }	 
	}
	
	
	
	
  
	

	
	public void Ingredient_up_post(ServletRequest request) {
		String desc_kor = request.getParameter("desc_kor"); //식품명
		  String mn = request.getParameter("mn");//제조사				  
		  int serving_wt = Integer.parseInt(request.getParameter("serving_wt"));//1회제공량
		  int nutr_cont1 = Integer.parseInt(request.getParameter("nutr_cont1"));//칼로리
		  int nutr_cont2 = Integer.parseInt(request.getParameter("nutr_cont2"));//탄수
		  int nutr_cont3 = Integer.parseInt(request.getParameter("nutr_cont3"));//단백질
		  int nutr_cont4 = Integer.parseInt(request.getParameter("nutr_cont4"));//지방
		  int nutr_cont5 = Integer.parseInt(request.getParameter("nutr_cont5"));//당
		  int nutr_cont6 = Integer.parseInt(request.getParameter("nutr_cont6"));//나트륨
		  int nutr_cont7 = Integer.parseInt(request.getParameter("nutr_cont7"));//콜레스테롤
		  int nutr_cont8 = Integer.parseInt(request.getParameter("nutr_cont8"));//포화지방산
		  int nutr_cont9 = Integer.parseInt(request.getParameter("nutr_cont9"));//트랜스지방산
		  		  

		 		 
	      Map<String, Object> param = new HashMap<>();	       
	      param.put("DESC_KOR", desc_kor);
	      param.put("MN", mn);
	      param.put("SERVING_WT", serving_wt);
	      param.put("NUTR_CONT1", nutr_cont1);
	      param.put("NUTR_CONT2", nutr_cont2);
	      param.put("NUTR_CONT3", nutr_cont3);
	      param.put("NUTR_CONT4", nutr_cont4);
	      param.put("NUTR_CONT5", nutr_cont5);
	      param.put("NUTR_CONT6", nutr_cont6);
	      param.put("NUTR_CONT7", nutr_cont7);
	      param.put("NUTR_CONT8", nutr_cont8);
	      param.put("NUTR_CONT9", nutr_cont9);		
	      		 
	      sj_dao.Ingredient_up_post(request,param,desc_kor);
			   
	}
	public void analysis(HttpServletRequest request) {
		Cally_Member loginUser = (Cally_Member) request.getSession().getAttribute("loginUser");		
		int mem_num = loginUser.getMem_num();	
		Map<String, Object> m = new HashMap<>();
		m.put("mem_num", mem_num);
	
		sj_dao.analysis(request,m);
	}
	
	
	
	
	public void Changing_cal(String sex, String blankRadio, String mygoal, HttpServletRequest req, ServletRequest request) {
		
		Cally_Member loginUser = (Cally_Member) req.getSession().getAttribute("loginUser");		
		int mem_num  = loginUser.getMem_num();
		Map<String, Object> mymap= new HashMap<>();	
		mymap.put("mem_num", mem_num);
		
		if (Objects.isNull(sex)) {
			
			sj_dao.	Changing_cal(mymap, req);
		  }else {
			  //post
				
			  if (sex.equals("m")) {
					System.out.println("남");
					if (blankRadio.equals("activity1")) {
						System.out.println("정적활동");				
						if (mygoal.equals("1")) {
							System.out.println("유지");					
							mymap.put("cal", 2100);					
						} else if (mygoal.equals("2")) {
							System.out.println("증가");
							mymap.put("cal", 2600);
						} else if (mygoal.equals("3")) {
							System.out.println("느린 증가");
							mymap.put("cal", 2400);
						} else if (mygoal.equals("4")) {
							System.out.println("느린감소");
							mymap.put("cal", 1800);
						} else if (mygoal.equals("5")) {
							System.out.println("감소");
							mymap.put("cal", 1600);
						}
						
						
					}else if (blankRadio.equals("activity2")) {
						System.out.println("적은활동");
						if (mygoal.equals("1")) {
							System.out.println("유지");					
							mymap.put("cal", 2300);					
						} else if (mygoal.equals("2")) {
							System.out.println("증가");
							mymap.put("cal", 2700);
						} else if (mygoal.equals("3")) {
							System.out.println("느린 증가");
							mymap.put("cal", 2500);
						} else if (mygoal.equals("4")) {
							System.out.println("느린감소");
							mymap.put("cal", 2000);
						} else if (mygoal.equals("5")) {
							System.out.println("감소");
							mymap.put("cal", 1700);
						}
					}else if (blankRadio.equals("activity3")) {
						System.out.println("활동적");
						if (mygoal.equals("1")) {
							System.out.println("유지");					
							mymap.put("cal", 2500);					
						} else if (mygoal.equals("2")) {
							System.out.println("증가");
							mymap.put("cal", 3000);
						} else if (mygoal.equals("3")) {
							System.out.println("느린 증가");
							mymap.put("cal", 2700);
						} else if (mygoal.equals("4")) {
							System.out.println("느린감소");
							mymap.put("cal", 2000);
						} else if (mygoal.equals("5")) {
							System.out.println("감소");
							mymap.put("cal", 1700);
						}
					}else if (blankRadio.equals("activity4")) {
						System.out.println("매우 활동적");
						if (mygoal.equals("1")) {
							System.out.println("유지");					
							mymap.put("cal", 2700);					
						} else if (mygoal.equals("2")) {
							System.out.println("증가");
							mymap.put("cal", 3200);
						} else if (mygoal.equals("3")) {
							System.out.println("느린 증가");
							mymap.put("cal", 3000);
						} else if (mygoal.equals("4")) {
							System.out.println("느린감소");
							mymap.put("cal", 2100);
						} else if (mygoal.equals("5")) {
							System.out.println("감소");
							mymap.put("cal", 1800);
						}
					}
					
					
				}else{
					System.out.println("여");			
					if (blankRadio.equals("activity1")) {
						System.out.println("정적활동");
						
						if (mygoal.equals("1")) {
							System.out.println("유지");					
							mymap.put("cal", 1700);					
						} else if (mygoal.equals("2")) {
							System.out.println("증가");
							mymap.put("cal", 2100);
						} else if (mygoal.equals("3")) {
							System.out.println("느린 증가");
							mymap.put("cal", 2000);
						} else if (mygoal.equals("4")) {
							System.out.println("느린감소");
							mymap.put("cal", 1500);
						} else if (mygoal.equals("5")) {
							System.out.println("감소");
							mymap.put("cal", 1200);
						}				
						
					}else if (blankRadio.equals("activity2")) {
						System.out.println("적은활동");
						if (mygoal.equals("1")) {
							System.out.println("유지");					
							mymap.put("cal", 1800);					
						} else if (mygoal.equals("2")) {
							System.out.println("증가");
							mymap.put("cal", 2300);
						} else if (mygoal.equals("3")) {
							System.out.println("느린 증가");
							mymap.put("cal", 2000);
						} else if (mygoal.equals("4")) {
							System.out.println("느린감소");
							mymap.put("cal", 1600);
						} else if (mygoal.equals("5")) {
							System.out.println("감소");
							mymap.put("cal", 1400);
						}
					}else if (blankRadio.equals("activity3")) {
						System.out.println("활동적");
						if (mygoal.equals("1")) {
							System.out.println("유지");					
							mymap.put("cal", 2000);					
						} else if (mygoal.equals("2")) {
							System.out.println("증가");
							mymap.put("cal", 2400);
						} else if (mygoal.equals("3")) {
							System.out.println("느린 증가");
							mymap.put("cal", 2200);
						} else if (mygoal.equals("4")) {
							System.out.println("느린감소");
							mymap.put("cal", 1800);
						} else if (mygoal.equals("5")) {
							System.out.println("감소");
							mymap.put("cal", 1600);
						}
					}else if (blankRadio.equals("activity4")) {
						System.out.println("매우 활동적");
						if (mygoal.equals("1")) {
							System.out.println("유지");					
							mymap.put("cal", 2200);					
						} else if (mygoal.equals("2")) {
							System.out.println("증가");
							mymap.put("cal", 2600);
						} else if (mygoal.equals("3")) {
							System.out.println("느린 증가");
							mymap.put("cal", 2400);
						} else if (mygoal.equals("4")) {
							System.out.println("느린감소");
							mymap.put("cal", 2000);
						} else if (mygoal.equals("5")) {
							System.out.println("감소");
							mymap.put("cal", 1700);
						}
					}
				}	
			  
				sj_dao.	Changing_cal_poat(mymap, req);
				request.setAttribute("ok", "완료");
		}
		
	}





}
