package cally.sj.beans;

public class Sj_m_VO {
	private int mem_code;
	private String mem_id;
	
	public Sj_m_VO() {
	}
	public Sj_m_VO(int mem_code, String mem_id) {
		this.mem_code = mem_code;
		this.mem_id = mem_id;
	}
	
	public int getMem_code() {
		return mem_code;
	}
	public void setMem_code(int mem_code) {
		this.mem_code = mem_code;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
}
