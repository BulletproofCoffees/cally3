package cally.sharing.beans;

public class Cally_Member {
	private int mem_num;
	private String mem_state;
	private String mem_id;
	private String mem_pw;
	private String mem_email;
	private String mem_name;
	
	public Cally_Member() {
	}
	public Cally_Member(String mem_id) {
		this.mem_id = mem_id;
	}

	
	public Cally_Member(String mem_id, String mem_pw) {
		this.mem_id = mem_id;
		this.mem_pw = mem_pw;
	}

	public Cally_Member(int mem_num, String mem_state, String mem_id, String mem_pw, String mem_email,
			String mem_name) {
		this.mem_num = mem_num;
		this.mem_state = mem_state;
		this.mem_id = mem_id;
		this.mem_pw = mem_pw;
		this.mem_email = mem_email;
		this.mem_name = mem_name;
	}

	public int getMem_num() {
		return mem_num;
	}

	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}

	public String getMem_state() {
		return mem_state;
	}

	public void setMem_state(String mem_state) {
		this.mem_state = mem_state;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getMem_pw() {
		return mem_pw;
	}

	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}

	public String getMem_email() {
		return mem_email;
	}

	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	

}
