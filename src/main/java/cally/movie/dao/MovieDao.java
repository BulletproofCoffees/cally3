package cally.movie.dao;

import java.util.List;
import java.util.Map;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MovieDao {
	@Inject
	private SqlSession session;
	String namespace = "org.mapper.movieMapper.";
	public List<Map<String,Object>> get_reserv_list(int mem_num){ // 리스트에게 타입전달 TYPE PARAM
		return session.selectList(namespace + "get_reserv_List",mem_num);
	}
	public List<Map<String,Object>> get_ad_reserv(){
		return session.selectList(namespace+"get_ad_reserv");
	}
	public List<Map<String,Object>> get_local_code(){
		return session.selectList(namespace+"get_local_code");
	}
	public List<Map<String,Object>> get_cinema_no(){
		return session.selectList(namespace+"get_cinema_no");
	}
	public List<Map<String,Object>> get_movie_info(){
		return session.selectList(namespace+"get_movie_info");
	}
	public List<Map<String,Object>> get_theater_info(){
		return session.selectList(namespace+"get_theater_name");
	}
	public List<Map<String,Object>> get_movie_type(){
		return session.selectList(namespace+"get_movie_type");
	}
	public List<Map<String,Object>> get_movie_name(){
		return session.selectList(namespace+"get_movie_name");
	}
	public List<Map<String,Object>> get_movie_grade(){
		return session.selectList(namespace+"get_movie_grade");
	}
	public List<Map<String,Object>> get_movie_stime(){
		return session.selectList(namespace+"get_movie_stime");
	}
	public List<Map<String,Object>> get_movie_list(){
		return session.selectList(namespace+"get_movie_list");
	}
	public Map<String,Object> get_vmovie_info(int detail){
		return session.selectOne(namespace+"get_vmovie_info",detail);
	}
	public Map<String,Object> get_movie_derector(int detail){
		return session.selectOne(namespace+"get_movie_derector",detail);
	}
	public List<Map<String,Object>> get_movie_actor(int detail){
		return session.selectList(namespace+"get_movie_actor",detail);
	}
	public  List<String> get_m_schedule(Map<String,Object> map){
		return session.selectList(namespace+"get_m_schedule",map);
	}
	public void in_theater_info(Map<String,Object> map) {
		session.selectOne(namespace+"in_theater_info",map);
	}
	public void in_movie_add(Map<String,Object> map) {
		session.selectOne(namespace+"movie_add",map);
	}
	public void in_schedule_add(Map<String,Object>map) {
		session.selectOne(namespace+"schedule_add",map);
	}
	public List<String> check_time(Map<String,Object> map){
		return session.selectList(namespace+"movie_time_info",map);
	}
	public List<Map<String,Object>> get_time_now(){
		return session.selectList(namespace+"movie_time_now");
	}
	public void in_reserv(Map<String,Object> map) {
		session.insert(namespace+"in_reserv",map);
	}
	public List<String> sel_reserv(Map<String,Object>map){
		return session.selectList(namespace+"sel_reserv",map);
	}
	public void in_seat(Map<String,Object>map) {
		session.insert(namespace+"in_seat",map);
	}
	public List<Map<String, Object>> getSelectSeat(Map<String,Object>map){
		return session.selectList(namespace+"sel_seat",map);
	}
	public void update_reserv(Map<String,Object> map) {
		session.selectOne(namespace+"update_reserv",map);
	}
	public void del_movie(Map<String,Object> map) {
		session.delete(namespace+"del_movie",map);
	}
	public List<String> reserv_seat(Map<String,Object>map){
		return session.selectList(namespace+"reserv_seat",map);
	}
	public void del_reserv(Map<String,Object>map) {
		session.selectOne(namespace+"del_reserv",map);
	}
	public void del_seat(Map<String,Object>map) {
		session.delete(namespace+"del_seat",map);
	}
	public List<Map<String,Object>> get_all_movie(){
		return session.selectList(namespace+"get_all_movie");
	}
}
