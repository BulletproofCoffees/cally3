package cally.business.beans;

public class Biz_notice {
	private String mem_id;
	private int mem_num;
	private int user_n_code;
	private int addressee_code;
	private String add_name;
	private int sender_code;
	private String sender_name;
	private String sender_id;
	private String notice_time;
	private String notice_content;
	private int state_code;
	
	public Biz_notice() {}
	
	public Biz_notice(String mem_id, int mem_num, int user_n_code, int addressee_code, String add_name, int sender_code,
			String sender_name, String sender_id, String notice_time, String notice_content, int state_code) {
		super();
		this.mem_id = mem_id;
		this.mem_num = mem_num;
		this.user_n_code = user_n_code;
		this.addressee_code = addressee_code;
		this.add_name = add_name;
		this.sender_code = sender_code;
		this.sender_name = sender_name;
		this.sender_id = sender_id;
		this.notice_time = notice_time;
		this.notice_content = notice_content;
		this.state_code = state_code;
	}

	public String getSender_id() {
		return sender_id;
	}

	public void setSender_id(String sender_id) {
		this.sender_id = sender_id;
	}

	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public int getUser_n_code() {
		return user_n_code;
	}
	public void setUser_n_code(int user_n_code) {
		this.user_n_code = user_n_code;
	}
	public int getAddressee_code() {
		return addressee_code;
	}
	public void setAddressee_code(int addressee_code) {
		this.addressee_code = addressee_code;
	}
	public String getAdd_name() {
		return add_name;
	}
	public void setAdd_name(String add_name) {
		this.add_name = add_name;
	}
	public int getSender_code() {
		return sender_code;
	}
	public void setSender_code(int sender_code) {
		this.sender_code = sender_code;
	}
	public String getSender_name() {
		return sender_name;
	}
	public void setSender_name(String sender_name) {
		this.sender_name = sender_name;
	}
	public String getNotice_time() {
		return notice_time;
	}
	public void setNotice_time(String notice_time) {
		this.notice_time = notice_time;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public int getState_code() {
		return state_code;
	}
	public void setState_code(int state_code) {
		this.state_code = state_code;
	}
	
}
