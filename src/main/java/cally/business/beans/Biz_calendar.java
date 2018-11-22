package cally.business.beans;

public class Biz_calendar {
	private int cal_code;
	private int mem_num;
	private String cal_title;
	private char cal_important;
	private String cal_start;
	private String cal_end;
	private String cal_place;
	private String cal_content;
	private String cal_file;
	
	public Biz_calendar() {	}
	
	public Biz_calendar(int cal_code, int mem_num, String cal_title, char cal_important, String cal_start, String cal_end,
			String cal_place, String cal_content, String cal_file) {
		this.cal_code = cal_code;
		this.mem_num = mem_num;
		this.cal_title = cal_title;
		this.cal_important = cal_important;
		this.cal_start = cal_start;
		this.cal_end = cal_end;
		this.cal_place = cal_place;
		this.cal_content = cal_content;
		this.cal_file = cal_file;
	}

	public int getCal_code() {
		return cal_code;
	}

	public void setCal_code(int cal_code) {
		this.cal_code = cal_code;
	}

	public int getMem_num() {
		return mem_num;
	}

	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}

	public String getCal_title() {
		return cal_title;
	}

	public void setCal_title(String cal_title) {
		this.cal_title = cal_title;
	}

	public char getCal_important() {
		return cal_important;
	}

	public void setCal_important(char cal_important) {
		this.cal_important = cal_important;
	}

	public String getCal_start() {
		return cal_start;
	}

	public void setCal_start(String cal_start) {
		this.cal_start = cal_start;
	}

	public String getCal_end() {
		return cal_end;
	}

	public void setCal_end(String cal_end) {
		this.cal_end = cal_end;
	}

	public String getCal_place() {
		return cal_place;
	}

	public void setCal_place(String cal_place) {
		this.cal_place = cal_place;
	}

	public String getCal_content() {
		return cal_content;
	}

	public void setCal_content(String cal_content) {
		this.cal_content = cal_content;
	}

	public String getCal_file() {
		return cal_file;
	}

	public void setCal_file(String cal_file) {
		this.cal_file = cal_file;
	}
	
}
