package cally.business.beans;

public class Biz_comment {
	private int cmt_code;
	private int pj_code;
	private int mem_id;
	private String mem_name;
	private int share_code;
	private String cmt_content;
	private String cmt_day;
	private int auth_code;
	
	public Biz_comment() {}	

	public Biz_comment(int cmt_code, int pj_code, int mem_id, String mem_name, int share_code, String cmt_content,
			String cmt_day, int auth_code) {
		super();
		this.cmt_code = cmt_code;
		this.pj_code = pj_code;
		this.mem_id = mem_id;
		this.mem_name = mem_name;
		this.share_code = share_code;
		this.cmt_content = cmt_content;
		this.cmt_day = cmt_day;
		this.auth_code = auth_code;
	}

	public int getPj_code() {
		return pj_code;
	}

	public void setPj_code(int pj_code) {
		this.pj_code = pj_code;
	}

	public int getAuth_code() {
		return auth_code;
	}

	public void setAuth_code(int auth_code) {
		this.auth_code = auth_code;
	}

	public String getCmt_day() {
		return cmt_day;
	}

	public void setCmt_day(String cmt_day) {
		this.cmt_day = cmt_day;
	}

	public int getCmt_code() {
		return cmt_code;
	}

	public void setCmt_code(int cmt_code) {
		this.cmt_code = cmt_code;
	}

	public int getMem_id() {
		return mem_id;
	}

	public void setMem_id(int mem_id) {
		this.mem_id = mem_id;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	public int getShare_code() {
		return share_code;
	}

	public void setShare_code(int share_code) {
		this.share_code = share_code;
	}

	public String getCmt_content() {
		return cmt_content;
	}

	public void setCmt_content(String cmt_content) {
		this.cmt_content = cmt_content;
	}
	
	
	
}
