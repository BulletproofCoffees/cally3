package cally.movie.beans;

import java.sql.Date;

public class M_schedule {
	private int ms_no;
	private int mvi_no;
	private int mst_code;
	private Date mo_p_stime;
	private Date mo_p_etime;
	private int mo_pay;
	public M_schedule(int ms_no, int mvi_no, int mst_code, Date mo_p_stime, Date mo_p_etime, int mo_pay) {
		super();
		this.ms_no = ms_no;
		this.mvi_no = mvi_no;
		this.mst_code = mst_code;
		this.mo_p_stime = mo_p_stime;
		this.mo_p_etime = mo_p_etime;
		this.mo_pay = mo_pay;
	}
	public M_schedule() {}
	public int getMs_no() {
		return ms_no;
	}
	public void setMs_no(int ms_no) {
		this.ms_no = ms_no;
	}
	public int getMvi_no() {
		return mvi_no;
	}
	public void setMvi_no(int mvi_no) {
		this.mvi_no = mvi_no;
	}
	public int getMst_code() {
		return mst_code;
	}
	public void setMst_code(int mst_code) {
		this.mst_code = mst_code;
	}
	public Date getMo_p_stime() {
		return mo_p_stime;
	}
	public void setMo_p_stime(Date mo_p_stime) {
		this.mo_p_stime = mo_p_stime;
	}
	public Date getMo_p_etime() {
		return mo_p_etime;
	}
	public void setMo_p_etime(Date mo_p_etime) {
		this.mo_p_etime = mo_p_etime;
	}
	public int getMo_pay() {
		return mo_pay;
	}
	public void setMo_pay(int mo_pay) {
		this.mo_pay = mo_pay;
	}
	
}
