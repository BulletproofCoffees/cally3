package cally.movie.beans;

public class M_m_mstime {
	private int mst_code;
	private String mst_name;
	public M_m_mstime(int mst_code, String mst_name) {
		super();
		this.mst_code = mst_code;
		this.mst_name = mst_name;
	}
	public M_m_mstime() {}
	public int getMst_code() {
		return mst_code;
	}
	public void setMst_code(int mst_code) {
		this.mst_code = mst_code;
	}
	public String getMst_name() {
		return mst_name;
	}
	public void setMst_name(String mst_name) {
		this.mst_name = mst_name;
	}
	
}
