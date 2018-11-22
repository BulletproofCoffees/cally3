package cally.movie.beans;

public class M_s_pick {
	private int msp_no;
	private int ms_no;
	private int mcsn_code;
	public M_s_pick(int msp_no, int ms_no, int mcsn_code) {
		super();
		this.msp_no = msp_no;
		this.ms_no = ms_no;
		this.mcsn_code = mcsn_code;
	}
	public M_s_pick() {}
	public int getMsp_no() {
		return msp_no;
	}
	public void setMsp_no(int msp_no) {
		this.msp_no = msp_no;
	}
	public int getMs_no() {
		return ms_no;
	}
	public void setMs_no(int ms_no) {
		this.ms_no = ms_no;
	}
	public int getMcsn_code() {
		return mcsn_code;
	}
	public void setMcsn_code(int mcsn_code) {
		this.mcsn_code = mcsn_code;
	}
	
}
