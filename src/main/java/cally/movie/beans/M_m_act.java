package cally.movie.beans;

public class M_m_act {
	private int mma_no;
	private String mma_name;
	public M_m_act(int mma_no, String mma_name) {
		super();
		this.mma_no = mma_no;
		this.mma_name = mma_name;
	}
	public M_m_act () {
	}
	public int getMma_no() {
		return mma_no;
	}
	public void setMma_no(int mma_no) {
		this.mma_no = mma_no;
	}
	public String getMma_name() {
		return mma_name;
	}
	public void setMma_name(String mma_name) {
		this.mma_name = mma_name;
	}
}
