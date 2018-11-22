package cally.business.beans;

public class Biz_share {
	private int mem_id;
	private int share_code;
	private int pj_code;
	private String mem_name;
	private String mem_email;
	private String auth_code;
	
	public Biz_share() {}
	

	public Biz_share(int mem_id, int share_code, int pj_code, String mem_name, String mem_email, String auth_code) {
		super();
		this.mem_id = mem_id;
		this.share_code = share_code;
		this.pj_code = pj_code;
		this.mem_name = mem_name;
		this.mem_email = mem_email;
		this.auth_code = auth_code;
	}

	public int getPj_code() {
		return pj_code;
	}


	public void setPj_code(int pj_code) {
		this.pj_code = pj_code;
	}


	public int getShare_code() {
		return share_code;
	}

	public void setShare_code(int share_code) {
		this.share_code = share_code;
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

	public String getMem_email() {
		return mem_email;
	}

	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}

	public String getAuth_code() {
		return auth_code;
	}

	public void setAuth_code(String auth_code) {
		this.auth_code = auth_code;
	}
	
}
