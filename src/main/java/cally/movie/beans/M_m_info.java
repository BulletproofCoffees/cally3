package cally.movie.beans;

public class M_m_info {
	private int mmi_no;
	private int mmg_code;
	private int mmt_code;
	private String mmi_name;
	private String mmi_img;
	private String mmi_plot;
	private String mmi_r_time;
	public M_m_info(int mmi_no, int mmg_code, int mmt_code, String mmi_name, String mmi_img, String mmi_plot,
			String mmi_r_time) {
		super();
		this.mmi_no = mmi_no;
		this.mmg_code = mmg_code;
		this.mmt_code = mmt_code;
		this.mmi_name = mmi_name;
		this.mmi_img = mmi_img;
		this.mmi_plot = mmi_plot;
		this.mmi_r_time = mmi_r_time;
	}
	public M_m_info() {}
	public int getMmi_no() {
		return mmi_no;
	}
	public void setMmi_no(int mmi_no) {
		this.mmi_no = mmi_no;
	}
	public int getMmg_code() {
		return mmg_code;
	}
	public void setMmg_code(int mmg_code) {
		this.mmg_code = mmg_code;
	}
	public int getMmt_code() {
		return mmt_code;
	}
	public void setMmt_code(int mmt_code) {
		this.mmt_code = mmt_code;
	}
	public String getMmi_name() {
		return mmi_name;
	}
	public void setMmi_name(String mmi_name) {
		this.mmi_name = mmi_name;
	}
	public String getMmi_img() {
		return mmi_img;
	}
	public void setMmi_img(String mmi_img) {
		this.mmi_img = mmi_img;
	}
	public String getMmi_plot() {
		return mmi_plot;
	}
	public void setMmi_plot(String mmi_plot) {
		this.mmi_plot = mmi_plot;
	}
	public String getMmi_r_time() {
		return mmi_r_time;
	}
	public void setMmi_r_time(String mmi_r_time) {
		this.mmi_r_time = mmi_r_time;
	}
	
}
