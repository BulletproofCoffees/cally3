package cally.movie.beans;

public class M_m_type {
	private int mmt_code;
	private String mmt_name;
	public M_m_type(int mmt_code, String mmt_name) {
		super();
		this.mmt_code = mmt_code;
		this.mmt_name = mmt_name;
	}
	public M_m_type() {}
	public int getMmt_code() {
		return mmt_code;
	}
	public void setMmt_code(int mmt_code) {
		this.mmt_code = mmt_code;
	}
	public String getMmt_name() {
		return mmt_name;
	}
	public void setMmt_name(String mmt_name) {
		this.mmt_name = mmt_name;
	}
	
}
