package cally.movie.beans;

public class M_m_char {
	private int mmc_no;
	private String mmc_name;
	private String mmc_info;
	public M_m_char(int mmc_no, String mmc_name, String mmc_info) {
		super();
		this.mmc_no = mmc_no;
		this.mmc_name = mmc_name;
		this.mmc_info = mmc_info;
	}
	public M_m_char() {
	}
	public int getMmc_no() {
		return mmc_no;
	}
	public void setMmc_no(int mmc_no) {
		this.mmc_no = mmc_no;
	}
	public String getMmc_name() {
		return mmc_name;
	}
	public void setMmc_name(String mmc_name) {
		this.mmc_name = mmc_name;
	}
	public String getMmc_info() {
		return mmc_info;
	}
	public void setMmc_info(String mmc_info) {
		this.mmc_info = mmc_info;
	}
	
}
