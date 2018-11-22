package cally.lecture.beans;

public class Lec_Lecsearch {
	private String lec_whe;
	private int lec_app_code;
	private int mem_num;
	private int lec_code;
	private String lec_name;
	private int lec_sche_code;
	private int lec_point;
	private String lec_type;
	private String lec_lang;
	private String lec_dan;
	private int lec_room_num;
	private int lec_sem_code;
	private String lec_day;
	private int lec_hour;
	private String lec_pro_name;
	private int lec_pro_cont;
	private int lec_dan_code;
	private String lec_way;
	private String lec_sum;
	private String lec_goal;
	private String lec_book_name;
	private String lec_athor;
	private String lec_publisher;
	private int lec_publ_year;
	private int lec_perso;
	private int lec_perso_now;
	
	public Lec_Lecsearch() {}
	
	public Lec_Lecsearch(int lec_app_code, String lec_whe, String lec_name) {
		super();
		this.lec_app_code = lec_app_code;
		this.lec_whe = lec_whe;
		this.lec_name = lec_name;
	}

	public Lec_Lecsearch(int lec_app_code) {
		super();
		this.lec_app_code = lec_app_code;
	}
	
	public Lec_Lecsearch(String lec_name, int lec_point, String lec_day, int lec_hour) {
		super();
		this.lec_name = lec_name;
		this.lec_point = lec_point;
		this.lec_day = lec_day;
		this.lec_hour = lec_hour;
	}
	
	public Lec_Lecsearch(String lec_type, int lec_sche_code, String lec_name, int lec_point, String lec_day, int lec_hour, String lec_pro_name, int lec_sem_code, int lec_app_code) {
		super();
		this.lec_type = lec_type;
		this.lec_sche_code = lec_sche_code;
		this.lec_name = lec_name;
		this.lec_point = lec_point;
		this.lec_day = lec_day;
		this.lec_hour = lec_hour;
		this.lec_pro_name = lec_pro_name;
		this.lec_sem_code = lec_sem_code;
		this.lec_app_code = lec_app_code;
	}
	
	public Lec_Lecsearch(int mem_num, int lec_sem_code) {
		super();
		this.mem_num = mem_num;
		this.lec_sem_code = lec_sem_code;
	}
	
	public Lec_Lecsearch(String lec_dan, String lec_name) {
		super();
		this.lec_dan = lec_dan;
		this.lec_name = lec_name;
	}
	
	public Lec_Lecsearch(int mem_num, String lec_day, int lec_hour, int lec_sche_code, int lec_point) {
		super();
		this.mem_num = mem_num;
		this.lec_day = lec_day;
		this.lec_hour = lec_hour;
		this.lec_sche_code = lec_sche_code;
		this.lec_point = lec_point;
	}
	
	public Lec_Lecsearch(int lec_code, String lec_name, int lec_sche_code, int lec_point, String lec_type,String lec_lang,
			String lec_dan, int lec_room_num,int lec_sem_code,String lec_day,int lec_hour,String lec_pro_name,int lec_pro_cont,
			int lec_dan_code, String lec_way,String lec_sum,String lec_goal,String lec_book_name,String lec_athor,String lec_publisher,
			int lec_publ_year,int lec_perso,int lec_perso_now) {
		super();
		this.lec_code = lec_code;
		this.lec_name = lec_name;
		this.lec_sche_code = lec_sche_code;
		this.lec_point = lec_point;
		this.lec_type = lec_type;
		this.lec_lang = lec_lang;
		this.lec_dan = lec_dan;
		this.lec_room_num = lec_room_num ;
		this.lec_sem_code = lec_sem_code;
		this.lec_day = lec_day;
		this.lec_hour = lec_hour;
		this.lec_pro_name = lec_pro_name;
		this.lec_pro_cont = lec_pro_cont;
		this.lec_dan_code = lec_dan_code;
		this.lec_way = lec_way;
		this.lec_sum = lec_sum;
		this.lec_goal = lec_goal;
		this.lec_book_name = lec_book_name;
		this.lec_athor = lec_athor;
		this.lec_publisher = lec_publisher;
		this.lec_publ_year = lec_publ_year;
		this.lec_perso = lec_perso;
		this.lec_perso_now = lec_perso_now;
	}
	
	public String getLec_whe() {
		return lec_whe;
	}

	public void setLec_whe(String lec_whe) {
		this.lec_whe = lec_whe;
	}
	

	public int getLec_app_code() {
		return lec_app_code;
	}

	public void setLec_app_code(int lec_app_code) {
		this.lec_app_code = lec_app_code;
	}
	
	public int getMem_num() {
		return mem_num;
	}

	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}

	public int getLec_code() {
		return lec_code;
	}

	public void setLec_code(int lec_code) {
		this.lec_code = lec_code;
	}

	public String getLec_name() {
		return lec_name;
	}

	public void setLec_name(String lec_name) {
		this.lec_name = lec_name;
	}

	public int getLec_sche_code() {
		return lec_sche_code;
	}

	public void setLec_sche_code(int lec_sche_code) {
		this.lec_sche_code = lec_sche_code;
	}

	public int getLec_point() {
		return lec_point;
	}

	public void setLec_point(int lec_point) {
		this.lec_point = lec_point;
	}

	public String getLec_type() {
		return lec_type;
	}

	public void setLec_type(String lec_type) {
		this.lec_type = lec_type;
	}

	public String getLec_lang() {
		return lec_lang;
	}

	public void setLec_lang(String lec_lang) {
		this.lec_lang = lec_lang;
	}

	public String getLec_dan() {
		return lec_dan;
	}

	public void setLec_dan(String lec_dan) {
		this.lec_dan = lec_dan;
	}

	public int getLec_room_num() {
		return lec_room_num;
	}

	public void setLec_room_num(int lec_room_num) {
		this.lec_room_num = lec_room_num;
	}

	public int getLec_sem_code() {
		return lec_sem_code;
	}

	public void setLec_sem_code(int lec_sem_code) {
		this.lec_sem_code = lec_sem_code;
	}

	public String getLec_day() {
		return lec_day;
	}

	public void setLec_day(String lec_day) {
		this.lec_day = lec_day;
	}

	public int getLec_hour() {
		return lec_hour;
	}

	public void setLec_hour(int lec_hour) {
		this.lec_hour = lec_hour;
	}

	public String getLec_pro_name() {
		return lec_pro_name;
	}

	public void setLec_pro_name(String lec_pro_name) {
		this.lec_pro_name = lec_pro_name;
	}

	public int getLec_pro_cont() {
		return lec_pro_cont;
	}

	public void setLec_pro_cont(int lec_pro_cont) {
		this.lec_pro_cont = lec_pro_cont;
	}

	public int getLec_dan_code() {
		return lec_dan_code;
	}

	public void setLec_dan_code(int lec_dan_code) {
		this.lec_dan_code = lec_dan_code;
	}

	public String getLec_way() {
		return lec_way;
	}

	public void setLec_way(String lec_way) {
		this.lec_way = lec_way;
	}

	public String getLec_sum() {
		return lec_sum;
	}

	public void setLec_sum(String lec_sum) {
		this.lec_sum = lec_sum;
	}

	public String getLec_goal() {
		return lec_goal;
	}

	public void setLec_goal(String lec_goal) {
		this.lec_goal = lec_goal;
	}

	public String getLec_book_name() {
		return lec_book_name;
	}

	public void setLec_book_name(String lec_book_name) {
		this.lec_book_name = lec_book_name;
	}

	public String getLec_athor() {
		return lec_athor;
	}

	public void setLec_athor(String lec_athor) {
		this.lec_athor = lec_athor;
	}

	public String getLec_publisher() {
		return lec_publisher;
	}

	public void setLec_publisher(String lec_publisher) {
		this.lec_publisher = lec_publisher;
	}

	public int getLec_publ_year() {
		return lec_publ_year;
	}

	public void setLec_publ_year(int lec_publ_year) {
		this.lec_publ_year = lec_publ_year;
	}

	public int getLec_perso() {
		return lec_perso;
	}

	public void setLec_perso(int lec_perso) {
		this.lec_perso = lec_perso;
	}

	public int getLec_perso_now() {
		return lec_perso_now;
	}

	public void setLec_perso_now(int lec_perso_now) {
		this.lec_perso_now = lec_perso_now;
	}

	
	
}
