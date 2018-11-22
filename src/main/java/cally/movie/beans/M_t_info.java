package cally.movie.beans;

public class M_t_info {
	private int mti_code;
	private int mtil_code;
	private String mti_name;
	private String mti_local;
	public M_t_info(int mti_code, int mtil_code, String mti_name, String mti_local) {
		super();
		this.mti_code = mti_code;
		this.mtil_code = mtil_code;
		this.mti_name = mti_name;
		this.mti_local = mti_local;
	}
	public M_t_info() {}
	public int getMti_code() {
		return mti_code;
	}
	public void setMti_code(int mti_code) {
		this.mti_code = mti_code;
	}
	public int getMtil_code() {
		return mtil_code;
	}
	public void setMtil_code(int mtil_code) {
		this.mtil_code = mtil_code;
	}
	public String getMti_name() {
		return mti_name;
	}
	public void setMti_name(String mti_name) {
		this.mti_name = mti_name;
	}
	public String getMti_local() {
		return mti_local;
	}
	public void setMti_local(String mti_local) {
		this.mti_local = mti_local;
	}
	
}
