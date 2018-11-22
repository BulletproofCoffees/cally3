package cally.movie.beans;

public class M_r_state {
	private int mrs_code;
	private String msr_name;
	public M_r_state(int mrs_code, String msr_name) {
		super();
		this.mrs_code = mrs_code;
		this.msr_name = msr_name;
	}
	public M_r_state() {}
	public int getMrs_code() {
		return mrs_code;
	}
	public void setMrs_code(int mrs_code) {
		this.mrs_code = mrs_code;
	}
	public String getMsr_name() {
		return msr_name;
	}
	public void setMsr_name(String msr_name) {
		this.msr_name = msr_name;
	}
	
}
