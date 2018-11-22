package cally.business.beans;

public class Biz_task {
	private int pj_t_code;
	private int pj_code;
	private String pj_title;
	private int mem_num;
	private String mem_id;
	private String mem_name;
	private int share_code;
	private int auth_code;
	private String task_title;
	private char task_important;
	private String task_start;
	private String task_end;
	private String task_attain;
	private String task_place;
	private String task_content;
	private String task_file;
	private char task_state;
	private int r_c_code;
	private String r_c_color;
	
	public Biz_task() {	}

	public Biz_task(int pj_t_code, int pj_code, String pj_title, int mem_num, String mem_id, String mem_name,
			int share_code, int auth_code, String task_title, char task_important, String task_start, String task_end,
			String task_attain, String task_place, String task_content, String task_file, char task_state, int r_c_code,
			String r_c_color) {
		super();
		this.pj_t_code = pj_t_code;
		this.pj_code = pj_code;
		this.pj_title = pj_title;
		this.mem_num = mem_num;
		this.mem_id = mem_id;
		this.mem_name = mem_name;
		this.share_code = share_code;
		this.auth_code = auth_code;
		this.task_title = task_title;
		this.task_important = task_important;
		this.task_start = task_start;
		this.task_end = task_end;
		this.task_attain = task_attain;
		this.task_place = task_place;
		this.task_content = task_content;
		this.task_file = task_file;
		this.task_state = task_state;
		this.r_c_code = r_c_code;
		this.r_c_color = r_c_color;
	}

	public String getPj_title() {
		return pj_title;
	}

	public void setPj_title(String pj_title) {
		this.pj_title = pj_title;
	}
	
	public int getR_c_code() {
		return r_c_code;
	}

	public void setR_c_code(int r_c_code) {
		this.r_c_code = r_c_code;
	}

	public int getAuth_code() {
		return auth_code;
	}

	public void setAuth_code(int auth_code) {
		this.auth_code = auth_code;
	}

	public int getPj_code() {
		return pj_code;
	}

	public void setPj_code(int pj_code) {
		this.pj_code = pj_code;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	public int getPj_t_code() {
		return pj_t_code;
	}

	public void setPj_t_code(int pj_t_code) {
		this.pj_t_code = pj_t_code;
	}

	public int getMem_num() {
		return mem_num;
	}

	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}

	public int getShare_code() {
		return share_code;
	}

	public void setShare_code(int share_code) {
		this.share_code = share_code;
	}

	public String getTask_title() {
		return task_title;
	}

	public void setTask_title(String task_title) {
		this.task_title = task_title;
	}

	public char getTask_important() {
		return task_important;
	}

	public void setTask_important(char task_important) {
		this.task_important = task_important;
	}

	public String getTask_start() {
		return task_start;
	}

	public void setTask_start(String task_start) {
		this.task_start = task_start;
	}

	public String getTask_end() {
		return task_end;
	}

	public void setTask_end(String task_end) {
		this.task_end = task_end;
	}

	public String getTask_attain() {
		return task_attain;
	}

	public void setTask_attain(String task_attain) {
		this.task_attain = task_attain;
	}

	public String getTask_place() {
		return task_place;
	}

	public void setTask_place(String task_place) {
		this.task_place = task_place;
	}

	public String getTask_content() {
		return task_content;
	}

	public void setTask_content(String task_content) {
		this.task_content = task_content;
	}

	public String getTask_file() {
		return task_file;
	}

	public void setTask_file(String task_file) {
		this.task_file = task_file;
	}

	public char getTask_state() {
		return task_state;
	}

	public void setTask_state(char task_state) {
		this.task_state = task_state;
	}

	public String getR_c_color() {
		return r_c_color;
	}

	public void setR_c_color(String r_c_color) {
		this.r_c_color = r_c_color;
	}	
	
	
}
