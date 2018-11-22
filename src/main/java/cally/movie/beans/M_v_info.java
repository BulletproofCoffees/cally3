package cally.movie.beans;

public class M_v_info {
	private int mvi_no;
	private int mti_code;
	private int mci_code;
	public M_v_info(int mvi_no, int mti_code, int mci_code) {
		super();
		this.mvi_no = mvi_no;
		this.mti_code = mti_code;
		this.mci_code = mci_code;
	}
	public M_v_info() {}
	public int getMvi_no() {
		return mvi_no;
	}
	public void setMvi_no(int mvi_no) {
		this.mvi_no = mvi_no;
	}
	public int getMti_code() {
		return mti_code;
	}
	public void setMti_code(int mti_code) {
		this.mti_code = mti_code;
	}
	public int getMci_code() {
		return mci_code;
	}
	public void setMci_code(int mci_code) {
		this.mci_code = mci_code;
	}
	
}
