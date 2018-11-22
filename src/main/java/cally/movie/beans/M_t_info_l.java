package cally.movie.beans;

public class M_t_info_l {
	private int mtil_code;
	private String mtil_name;
	public M_t_info_l(int mtil_code, String mtil_name) {
		super();
		this.mtil_code = mtil_code;
		this.mtil_name = mtil_name;
	}
	public M_t_info_l() {}
	public int getMtil_code() {
		return mtil_code;
	}
	public void setMtil_code(int mtil_code) {
		this.mtil_code = mtil_code;
	}
	public String getMtil_name() {
		return mtil_name;
	}
	public void setMtil_name(String mtil_name) {
		this.mtil_name = mtil_name;
	}
	
}
