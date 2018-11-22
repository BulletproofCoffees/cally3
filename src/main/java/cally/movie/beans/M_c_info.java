package cally.movie.beans;

public class M_c_info {
	private int mci_code;
	private int m_c_no;
	private int mmi_no;
	private String mci_s_total;
	private String mci_s_now;
	public M_c_info(int mci_code, int m_c_no, int mmi_no, String mci_s_total, String mci_s_now) {
		super();
		this.mci_code = mci_code;
		this.m_c_no = m_c_no;
		this.mmi_no = mmi_no;
		this.mci_s_total = mci_s_total;
		this.mci_s_now = mci_s_now;
	}
	public M_c_info() {}
	public int getMci_code() {
		return mci_code;
	}
	public void setMci_code(int mci_code) {
		this.mci_code = mci_code;
	}
	public int getM_c_no() {
		return m_c_no;
	}
	public void setM_c_no(int m_c_no) {
		this.m_c_no = m_c_no;
	}
	public int getMmi_no() {
		return mmi_no;
	}
	public void setMmi_no(int mmi_no) {
		this.mmi_no = mmi_no;
	}
	public String getMci_s_total() {
		return mci_s_total;
	}
	public void setMci_s_total(String mci_s_total) {
		this.mci_s_total = mci_s_total;
	}
	public String getMci_s_now() {
		return mci_s_now;
	}
	public void setMci_s_now(String mci_s_now) {
		this.mci_s_now = mci_s_now;
	}
	
}
