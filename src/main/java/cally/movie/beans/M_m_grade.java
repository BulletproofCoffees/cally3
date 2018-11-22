package cally.movie.beans;

public class M_m_grade {
	private int mmg_code;
	private String mmg_name;
	public M_m_grade(int mmg_code, String mmg_name) {
		super();
		this.mmg_code = mmg_code;
		this.mmg_name = mmg_name;
	}
	public M_m_grade() {}
	public int getMmg_code() {
		return mmg_code;
	}
	public void setMmg_code(int mmg_code) {
		this.mmg_code = mmg_code;
	}
	public String getMmg_name() {
		return mmg_name;
	}
	public void setMmg_name(String mmg_name) {
		this.mmg_name = mmg_name;
	}
	
}
