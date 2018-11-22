package cally.movie.beans;

public class M_c_s_state {
	private int mcss_code;
	private String mcss_name;
	public M_c_s_state(int mcss_code, String mcss_name) {
		super();
		this.mcss_code = mcss_code;
		this.mcss_name = mcss_name;
	}
	public M_c_s_state() {}
	
	public int getMcss_code() {
		return mcss_code;
	}
	public void setMcss_code(int mcss_code) {
		this.mcss_code = mcss_code;
	}
	public String getMcss_name() {
		return mcss_name;
	}
	public void setMcss_name(String mcss_name) {
		this.mcss_name = mcss_name;
	}
	
}
