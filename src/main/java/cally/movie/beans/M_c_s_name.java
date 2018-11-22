package cally.movie.beans;

public class M_c_s_name {
	private int mcsn_code;
	private String mcsn_name;
	private int mcss_code;
	public M_c_s_name(int mcsn_code, String mcsn_name, int mcss_code) {
		super();
		this.mcsn_code = mcsn_code;
		this.mcsn_name = mcsn_name;
		this.mcss_code = mcss_code;
	}
	public M_c_s_name() {}
	public int getMcsn_code() {
		return mcsn_code;
	}
	public void setMcsn_code(int mcsn_code) {
		this.mcsn_code = mcsn_code;
	}
	public String getMcsn_name() {
		return mcsn_name;
	}
	public void setMcsn_name(String mcsn_name) {
		this.mcsn_name = mcsn_name;
	}
	public int getMcss_code() {
		return mcss_code;
	}
	public void setMcss_code(int mcss_code) {
		this.mcss_code = mcss_code;
	}
	
}
