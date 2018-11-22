package cally.health.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import cally.health.service.Hel_Exercise_Service;
import cally.health.service.Hel_Mypage_Service;
import cally.sharing.beans.Cally_Member;

@Controller
@RequestMapping(value="/health")
public class HealthController {
   
   @Inject
   Hel_Exercise_Service ex_service;
   @Inject
   Hel_Mypage_Service my_service;
   
   
   @RequestMapping(value="/health_main",method=RequestMethod.GET)
   public String showMain() {
      return "view/health/health_main";   
   }

   @RequestMapping(value="/health_bmi",method=RequestMethod.GET)
   public String Bmi(Model m , HttpServletRequest r) {
      m.addAttribute("mypage", my_service.myPage(r));
      m.addAttribute("calorie",my_service.Hel_Calorie(r));
      System.out.println(my_service.myPage(r));
      return "view/health/health_bmi";   
   }
   
   @RequestMapping(value="/health_bmi", method=RequestMethod.POST)
   public String Health_Bmi (Model m, HttpServletRequest r) {
      m.addAttribute("mypage", my_service.myPage(r));
      m.addAttribute("calorie",my_service.Hel_Calorie(r));
      
      return "view/health/health_bmi";   
   }
   
   
   @RequestMapping(value="/health_calorie",method=RequestMethod.GET)
   public String Calorie(Model m , HttpServletRequest r) {
      m.addAttribute("mypage", my_service.myPage(r));
      m.addAttribute("acode" , my_service.Hel_Active());
      m.addAttribute("calorie",my_service.Hel_Calorie(r));
      return "view/health/health_calorie";   
   }
   
   @RequestMapping(value="/health_calorie", method=RequestMethod.POST)
   public String Health_Calorie (Model m, HttpServletRequest r) {
      return my_service.Health_Calorie(m, r);   
   }
   
   @RequestMapping(value="/health_calorie_past",method=RequestMethod.GET)
   public String Calorie_past(Model m , HttpServletRequest r) {
      m.addAttribute("calorie",my_service.Calorie_past(r));
      return "view/health/health_calorie_past";   
   }
   @Inject
   private SqlSession session;
   @ResponseBody
   @RequestMapping(value="/health_calorie2", method=RequestMethod.POST, produces = "text/plain; charset=UTF-8")
   public String Health_Calorie2 (Model m, HttpServletRequest r) {
   
      /*m.addAttribute("calorie",my_service.Hel_Calorie(r));*/
      
      Cally_Member cm = (Cally_Member) r.getSession().getAttribute("loginUser");
       int num = cm.getMem_num();
       
       ArrayList<Object> list = new ArrayList<>();
         list.add(session.selectList("mapper.hel.MypageMapper.se_calorie_all",num));      
      Gson gson = new Gson();
      return gson.toJson(list);
   }
   
   @RequestMapping(value="/health_calculator",method=RequestMethod.GET)
   public String Calculator(Model m , HttpServletRequest r) {
      String ex = r.getParameter("Exercise");   
      m.addAttribute("exercise", ex_service.Exercise(ex));
      System.out.println(ex_service.Exercise(ex));
      return "view/health/health_calculator";   
   }
   
   @RequestMapping(value="/health_calculator",method=RequestMethod.POST)
   @ResponseBody
      public List<Map<String,Object>> Calculator_one(HttpServletRequest r) {
      return ex_service.Calculator_one(r);
   }
   
   @RequestMapping(value="/health_exercise",method=RequestMethod.GET)
   public String Exercise(Model m , HttpServletRequest r) {
      String ex = r.getParameter("Exercise");
      String em = r.getParameter("Exercise_met");
      String ec = r.getParameter("Exercise_code");
      m.addAttribute("exercise_code", ex_service.Exercise_code(ec));
      m.addAttribute("exercise", ex_service.Exercise(ex));
      m.addAttribute("exercise_met", ex_service.Exercise_met(em));
      System.out.println(ex_service.Exercise(ex));
      System.out.println(ex_service.Exercise_met(em));
      return "view/health/health_exercise";   
   }
   
   @RequestMapping(value="/health_exercise",method=RequestMethod.POST)
   @ResponseBody
   public List<Map<String,Object>> health_exercise(HttpServletRequest r) {
      return    ex_service.Exercise_video(r);
   
   }
   
   
   
   @RequestMapping(value="/health_write",method=RequestMethod.GET)
   public String Write() {
      return "view/health/health_write";   
   }
   
   @RequestMapping(value="/health_mypage", method=RequestMethod.POST)
   public String Mypage(Model m, HttpServletRequest r) {
      m.addAttribute("mypage",my_service.myPage(r));
      return my_service.Health_Mypage(m, r);   
   }
   
   @RequestMapping(value="/health_mypage", method=RequestMethod.GET)
   public String Mypage2(Model m, HttpServletRequest r) {
      m.addAttribute("mypage",my_service.myPage(r));
      return "view/health/health_mypage";   
       
   }
   
/*   @RequestMapping(value="/health_mypage_view",method=RequestMethod.GET)
   public String MypageSelect(Model m , HttpServletRequest r) {
      m.addAttribute("mypage", my_service.myPage(r));
      System.out.println(my_service.myPage(r));

      return "view/health/health_mypage_view";   
   }*/
   
   
   
   
   
/*   @RequestMapping()
   @ResponseBody //return을 그냥 보내줘요
   public sdfjdsjfsdjf () {
      return "안녕";
   }*/
}