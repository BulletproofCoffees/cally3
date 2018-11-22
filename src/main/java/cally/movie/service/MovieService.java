package cally.movie.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import cally.movie.dao.MovieDao;
import cally.sharing.beans.Cally_Member;

@Service
public class MovieService {
	@Inject
	private MovieDao mDao;
	String uploadPath;
	
	public List<Map<String,Object>> doReservList(HttpServletRequest req, Model m){
		Cally_Member loginUser = (Cally_Member) req.getSession().getAttribute("loginUser");
		int mem_num  = loginUser.getMem_num();
		return mDao.get_reserv_list(mem_num);
	}
	public List<Map<String,Object>>get_ad_reserv(){
		return mDao.get_ad_reserv();
	}
	public List<Map<String,Object>> getLocalCode(){
		return mDao.get_local_code();
	}
	public List<Map<String,Object>> getCinemaNo(){
		return mDao.get_cinema_no();
	}
	public List<Map<String,Object>> getMovieInfo(){
		return mDao.get_movie_info();
	}
	public List<Map<String,Object>> getTheaterInfo(){
		return mDao.get_theater_info();
	}
	public List<Map<String,Object>> getMovieName(){
		return mDao.get_movie_name();
	}
	public List<Map<String,Object>> getMovieType(){
		return mDao.get_movie_type();
	}
	public List<Map<String,Object>> getMovieGrade(){
		return mDao.get_movie_grade();
	}
	public List<Map<String,Object>> getMovieStime(){
		return mDao.get_movie_stime();
	}
	public List<Map<String,Object>> getMovieList(){
		return mDao.get_movie_list();
	}
	public Map<String,Object> getVmovieInfo(int detail){
		return mDao.get_vmovie_info(detail);
	}
	public Map<String,Object> getMovieDerector(int detail){
		return mDao.get_movie_derector(detail);
	}
	public List<Map<String,Object>> getMovieActor(int detail){
		return mDao.get_movie_actor(detail);
	}
	public List<Map<String,Object>> get_all_movie(){
		return mDao.get_all_movie();
	}
	public List<String> getMschedule(HttpServletRequest req, Model m){
		int detail = Integer.parseInt(req.getParameter("detail"));
		int cno = Integer.parseInt(req.getParameter("cno"));
		int tinfo = Integer.parseInt(req.getParameter("tinfo"));
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("detail", detail);
		map.put("cno", cno);
		map.put("mti_code", tinfo);
		return mDao.get_m_schedule(map);
	}
	public List<Map<String,Object>> getNowschedule(){
		return mDao.get_time_now();
	}
	public void inTheaterInfo(HttpServletRequest req, Model m) {
		int local_no = Integer.parseInt(req.getParameter("local_no"));
		String local_name=req.getParameter("local_name");
		String local_detail=req.getParameter("local_detail");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mtil_code", local_no);
		map.put("mti_name", local_name);
		map.put("mti_local", local_detail);
		mDao.in_theater_info(map);
	}
	public List<String> checkTime(HttpServletRequest req, Model m){
		int tinfo = Integer.parseInt(req.getParameter("tinfo"));
		int cno = Integer.parseInt(req.getParameter("cno"));
		String c_date = req.getParameter("c_date");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("paramDate", c_date);
		map.put("mcn", cno);
		map.put("mti_code", tinfo);
		return mDao.check_time(map);
	}
	public void inMovieAdd(HttpServletRequest req, Model m,MultipartFile movieImg) throws Exception{
		
		int mmg_code = Integer.parseInt(req.getParameter("movieGrade"));
		int mmt_code = Integer.parseInt(req.getParameter("movieType"));
		String mmi_name = req.getParameter("movieName");
		String oname = movieImg.getOriginalFilename();
		ServletContext appliaction = req.getServletContext();
		String upath = appliaction.getRealPath("/resources/img/callyPlus");
		File uname = new File(upath,oname);
		FileCopyUtils.copy(movieImg.getBytes(), uname);
		String mmi_plot = req.getParameter("moviePlot");
		int mmi_r_time = Integer.parseInt(req.getParameter("movieRunning"));
		String mmi_trailer = req.getParameter("y_link");
		String[] s_link = mmi_trailer.split("=");
		String mmc_name = req.getParameter("movieDerector");
		String mmi_stime = req.getParameter("movieFrom");
		String mmi_etime = req.getParameter("movieTo");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mmg_code",mmg_code);
		map.put("mmt_code", mmt_code);
		map.put("mmi_name", mmi_name);
		map.put("mmi_img", oname);
		map.put("mmi_plot", mmi_plot);
		map.put("mmi_r_time", mmi_r_time);
		map.put("mmi_trailer", s_link[1]);
		map.put("mmc_name", mmc_name);
		map.put("mmi_stime",mmi_stime);
		map.put("mmi_etime", mmi_etime);
		mDao.in_movie_add(map);
	}
	public void inScheduleAdd(HttpServletRequest req, Model m) {
		int mmi_no = Integer.parseInt(req.getParameter("sel_mname"));
		int mti_code = Integer.parseInt(req.getParameter("sel_theater"));
		int m_c_no = Integer.parseInt(req.getParameter("sel_cno"));
		String ms_date = req.getParameter("ms_date");
		int mst_code = Integer.parseInt(req.getParameter("stime"));
		int mo_pay = Integer.parseInt(req.getParameter("moviePay"));
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mti_code", mti_code);
		map.put("m_c_no", m_c_no);
		map.put("mst_code", mst_code);
		map.put("mo_pay", mo_pay);
		map.put("mmi_no", mmi_no);
		map.put("ms_date", ms_date);
		mDao.in_schedule_add(map);
	}
	public void insertSeat(HttpServletRequest req, Model m,int mr_no,String msp_name) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("msp_name", msp_name);
		map.put("mr_no", mr_no);
		mDao.in_seat(map);
	}
	public void inReserv(HttpServletRequest req, Model m,String s_time,int ms_no) {
		Cally_Member loginUser = (Cally_Member) req.getSession().getAttribute("loginUser");		
		int mem_no  = loginUser.getMem_num();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mem_num", mem_no);
		map.put("ms_no", ms_no);
		map.put("mr_date", s_time);
		mDao.in_reserv(map);
	}
	public List<String> selectReserv(HttpServletRequest req, Model m){
		Cally_Member loginUser = (Cally_Member) req.getSession().getAttribute("loginUser");
		int mem_no  = loginUser.getMem_num();
		int ms_no = Integer.parseInt(req.getParameter("ms_no"));
		int cno = Integer.parseInt(req.getParameter("cno"));
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mem_num", mem_no);
		map.put("ms_no", ms_no);
		map.put("cno", cno);
		return mDao.sel_reserv(map);
	}
	public List<Map<String, Object>> getSelectSeat(HttpServletRequest req,Model m,int ms_no,int detail,int cno){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("ms_no", ms_no);
		map.put("cno", cno);
		map.put("detail", detail);
		return mDao.getSelectSeat(map);
		
	}
	public void update_reserv(HttpServletRequest req,Model m) {
		Cally_Member loginUser = (Cally_Member) req.getSession().getAttribute("loginUser");
		int mem_no  = loginUser.getMem_num();
		int mr_no = Integer.parseInt(req.getParameter("maxRes"));
		int ms_no= Integer.parseInt(req.getParameter("ms_no")); 
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mem_num", mem_no);
		map.put("mr_no", mr_no);
		map.put("ms_no", ms_no);
		mDao.update_reserv(map);
	}
	public void del_movie(HttpServletRequest req,Model m,int mmi_no) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mmi_no", mmi_no);
		mDao.del_movie(map);
	}
	public void del_reserv(HttpServletRequest req,Model m,int mr_no) {
		Cally_Member loginUser = (Cally_Member) req.getSession().getAttribute("loginUser");
		int mem_num  = loginUser.getMem_num();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mr_no", mr_no);
		map.put("mem_num", mem_num);
		mDao.del_reserv(map);
	}
	public void del_seat(HttpServletRequest req,Model m,int mr_no) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mr_no", mr_no);
		mDao.del_seat(map);
	}
	public List<String> reserv_seat(HttpServletRequest req,Model m){
		Cally_Member loginUser = (Cally_Member) req.getSession().getAttribute("loginUser");
		int mem_no  = loginUser.getMem_num();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mem_num", mem_no);
		return mDao.reserv_seat(map);
	}
}
