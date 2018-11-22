package cally.movie.controller;


import java.util.List;
import java.util.Map;
import java.util.Objects;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import cally.movie.service.MovieService;

@Controller
@RequestMapping(value="/movie")
public class MovieController {
	@Inject
	private MovieService service;
	
	@RequestMapping(value="/up_reserv",method=RequestMethod.POST)
	public String update_reserv(HttpServletRequest req, Model m) {
		service.update_reserv(req, m);
		m.addAttribute("seat",service.reserv_seat(req, m));
		return "view/movie/m_tcheck";
	}
	@RequestMapping(value="/seatAdd",method=RequestMethod.POST,produces = "text/plain; charset=UTF-8")
	@ResponseBody
	public String getParamSeatInfo(HttpServletRequest req, Model m,int mr_no,String msp_name) {
		System.out.println("mr_no : " + mr_no);
		service.insertSeat(req,m,mr_no,msp_name);
		return "view/movie/m_main";
	}
	@RequestMapping(value="/seat_del",method=RequestMethod.POST,produces = "text/plain; charset=UTF-8")
	@ResponseBody
	public String del_seat(HttpServletRequest req, Model m,int mr_no) {
		service.del_seat(req, m, mr_no);
		return "view/movie/m_detail";
	}
	@RequestMapping(value="/movieAdd",method=RequestMethod.POST)
	public String getParamMovieInfo(HttpServletRequest req,Model m,MultipartFile movieImg) throws Exception{
		service.inMovieAdd(req, m,movieImg);
		m.addAttribute("alist",service.getMovieList());
		return "view/movie/a_movielist";
	}
	@RequestMapping(value="/reservAdd",method=RequestMethod.POST, produces = "text/plain; charset=UTF-8")
	@ResponseBody
	public String reservPost(HttpServletRequest req,Model m,String s_time,int ms_no) {
		service.inReserv(req, m,s_time,ms_no);
		return "view/movie/m_detail";
	}
	@RequestMapping(value="/scheduleAdd",method=RequestMethod.GET)
	public String scheduleAdd(Model m) {
		m.addAttribute("theater_info",service.getTheaterInfo());
		m.addAttribute("c_no",service.getCinemaNo());
		m.addAttribute("stime",service.getMovieStime());
		m.addAttribute("mname",service.getMovieName());
		return "view/movie/a_m_schduleAdd";
	}
	@RequestMapping(value="/scheduleAdd_b",method=RequestMethod.POST)
	public String scheduleAdd_b(HttpServletRequest req,Model m) {
		service.inScheduleAdd(req, m);
		m.addAttribute("alist",service.getMovieList());
		return "view/movie/a_movielist";
	}
	@RequestMapping(value="/m_nextstep1",method=RequestMethod.POST)
	public String nextPage(HttpServletRequest req,Model m) {
		m.addAttribute("movieL",service.checkTime(req, m));
		return "view/movie/m_list";
	}
	@RequestMapping(value="/m_c_theater",method=RequestMethod.GET)
	public String getMcTheater(Model m) {
		m.addAttribute("theater_info",service.getTheaterInfo());
		m.addAttribute("c_no",service.getCinemaNo());
		return "view/movie/m_chooseTheater";
	}
	@RequestMapping(value="/movieAllList",method=RequestMethod.GET)
	public String getMovieAllList(Model m ) {
		m.addAttribute("movieAll",service.get_all_movie());
		return "view/movie/m_AllList";
	}
	@RequestMapping(value="/movieNowList",method=RequestMethod.GET)
	public String getMovieNowList(Model m) {
		m.addAttribute("movieNow",service.getNowschedule());
		return "view/movie/m_Nlist";
	}
	@RequestMapping(value="/movieDetail/{detail}",method=RequestMethod.GET)
	public String getMovieLDetail(HttpServletRequest req,Model m,@PathVariable("detail") int detail) {
		String resultUrl = null;
		if(Objects.isNull(detail)) {
			return resultUrl = "view/movie/m_list";
		}else {
			m.addAttribute("movieI",service.getVmovieInfo(detail));
			m.addAttribute("movieDerec",service.getMovieDerector(detail));
			m.addAttribute("movieActor",service.getMovieActor(detail));
			m.addAttribute("scheduleS",service.getMschedule(req, m));
			m.addAttribute("reserv_no",service.selectReserv(req, m));
			resultUrl = "view/movie/m_detail";
			return resultUrl;
		}
		
	}
	@RequestMapping(value="/movieTcheck",method=RequestMethod.GET)
	public String getMovieTcheck(HttpServletRequest req,Model m) {
		m.addAttribute("seat",service.reserv_seat(req, m));
		return "view/movie/m_tcheck";
	}
	@RequestMapping(value="/movieResult",method=RequestMethod.GET)
	public String getMovieResult() {
		
		return "view/movie/m_result";
	}
	@RequestMapping(value="/movieAdd",method=RequestMethod.GET)
	public String getMovieAdd(Model m,HttpServletRequest req) {
		m.addAttribute("movie_info",service.getMovieInfo());
		m.addAttribute("movieType",service.getMovieType());
		m.addAttribute("movieGrade",service.getMovieGrade());
		return "view/movie/a_movieadd";
	}
	@RequestMapping(value="/movieAlist",method=RequestMethod.GET)
	public String getMovieAlist(Model m) {
		m.addAttribute("alist",service.getMovieList());
		return "view/movie/a_movielist";
	}
	@RequestMapping(value="/theaterAdd",method=RequestMethod.GET)
	public String getMovieTheaterAdd(Model m,HttpServletRequest req) {
		m.addAttribute("local",service.getLocalCode());
		m.addAttribute("c_no",service.getCinemaNo());
		return "view/movie/a_Theateradd";
	}
	@RequestMapping(value="/theaterAdd_b",method=RequestMethod.POST)
	public String getParamTheaterInfo(HttpServletRequest req,Model m) {
		service.inTheaterInfo(req,m);
		m.addAttribute("alist",service.getMovieList());
		return "view/movie/a_movielist";
	}
	
	
	@RequestMapping(value="/Reservation",method=RequestMethod.GET)
	public String getMovieReservation(Model m,HttpServletRequest req) {
		m.addAttribute("admin_reserv",service.get_ad_reserv());
		return "view/movie/a_reservCheck";
	}
	@RequestMapping(value="/del_movie",method=RequestMethod.POST)
	public String del_movie(Model m,HttpServletRequest req,int mmi_no) {
		service.del_movie(req, m, mmi_no);
		m.addAttribute("alist",service.getMovieList());
		return "view/movie/a_movielist";
	}
	@RequestMapping(value="/del_reserv",method=RequestMethod.POST)
	public String del_reserv (Model m,HttpServletRequest req, int mr_no) {
		service.del_reserv(req, m, mr_no);
		return "view/movie/m_tcheck";
	}
	@RequestMapping(value="/call_seat",method=RequestMethod.POST)
	@ResponseBody
	public String call_seat (Model m,HttpServletRequest req,int ms_no,int detail,int cno) {
		List<Map<String,Object>> list = service.getSelectSeat(req, m,ms_no,detail,cno);
		Gson gson = new Gson();
		System.out.println(list);
		return gson.toJson(list);
	}
	
}
