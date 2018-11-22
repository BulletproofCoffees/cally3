 package cally.business.beans;

public class Biz_pj {
	private int pj_code;
	private int mem_num;
	private String mem_id;
	private int auth_code;
	private int share_code;
	private String pj_title;
	private char pj_important;
	private String pj_summary;
	private String pj_content;
	private String pj_start;
	private String pj_end;
	private String pj_predict;
	private String pj_complete;
	private String pj_file;
	private String pj_creator_name;
	private String pj_creator_id;

	public Biz_pj() {}	
	
	public Biz_pj(int pj_code, int mem_num, String mem_id, int auth_code, int share_code, String pj_title,
			char pj_important, String pj_summary, String pj_content, String pj_start, String pj_end, String pj_predict,
			String pj_complete, String pj_file, String pj_creator_name, String pj_creator_id) {
		super();
		this.pj_code = pj_code;
		this.mem_num = mem_num;
		this.mem_id = mem_id;
		this.auth_code = auth_code;
		this.share_code = share_code;
		this.pj_title = pj_title;
		this.pj_important = pj_important;
		this.pj_summary = pj_summary;
		this.pj_content = pj_content;
		this.pj_start = pj_start;
		this.pj_end = pj_end;
		this.pj_predict = pj_predict;
		this.pj_complete = pj_complete;
		this.pj_file = pj_file;
		this.pj_creator_name = pj_creator_name;
		this.pj_creator_id = pj_creator_id;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public int getAuth_code() {
		return auth_code;
	}
	

	public void setAuth_code(int auth_code) {
		this.auth_code = auth_code;
	}

	
	public int getShare_code() {
		return share_code;
	}


	public void setShare_code(int share_code) {
		this.share_code = share_code;
	}


	public String getPj_creator_name() {
		return pj_creator_name;
	}


	public void setPj_creator_name(String pj_creator_name) {
		this.pj_creator_name = pj_creator_name;
	}


	public String getPj_creator_id() {
		return pj_creator_id;
	}


	public void setPj_creator_id(String pj_creator_id) {
		this.pj_creator_id = pj_creator_id;
	}


	public int getPj_code() {
		return pj_code;
	}

	public void setPj_code(int pj_code) {
		this.pj_code = pj_code;
	}

	public int getMem_num() {
		return mem_num;
	}

	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}

	public String getPj_title() {
		return pj_title;
	}

	public void setPj_title(String pj_title) {
		this.pj_title = pj_title;
	}

	public char getPj_important() {
		return pj_important;
	}

	public void setPj_important(char pj_important) {
		this.pj_important = pj_important;
	}

	public String getPj_summary() {
		return pj_summary;
	}

	public void setPj_summary(String pj_summary) {
		this.pj_summary = pj_summary;
	}

	public String getPj_content() {
		return pj_content;
	}

	public void setPj_content(String pj_content) {
		this.pj_content = pj_content;
	}

	public String getPj_start() {
		return pj_start;
	}

	public void setPj_start(String pj_start) {
		this.pj_start = pj_start;
	}

	public String getPj_end() {
		return pj_end;
	}

	public void setPj_end(String pj_end) {
		this.pj_end = pj_end;
	}

	public String getPj_predict() {
		return pj_predict;
	}

	public void setPj_predict(String pj_predict) {
		this.pj_predict = pj_predict;
	}

	public String getPj_complete() {
		return pj_complete;
	}

	public void setPj_complete(String pj_complete) {
		this.pj_complete = pj_complete;
	}

	public String getPj_file() {
		return pj_file;
	}

	public void setPj_file(String pj_file) {
		this.pj_file = pj_file;
	}
	
	
}
