package cally.movie.beans;

import java.sql.Date;

public class M_reservation {
	private int mr_no;
	private int msr_code;
	private int mem_num;
	private int ms_no;
	private Date mr_date;
	public M_reservation(int mr_no, int msr_code, int mem_num, int ms_no, Date mr_date) {
		super();
		this.mr_no = mr_no;
		this.msr_code = msr_code;
		this.mem_num = mem_num;
		this.ms_no = ms_no;
		this.mr_date = mr_date;
	}
	public M_reservation() {}
	public int getMr_no() {
		return mr_no;
	}
	public void setMr_no(int mr_no) {
		this.mr_no = mr_no;
	}
	public int getMsr_code() {
		return msr_code;
	}
	public void setMsr_code(int msr_code) {
		this.msr_code = msr_code;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public int getMs_no() {
		return ms_no;
	}
	public void setMs_no(int ms_no) {
		this.ms_no = ms_no;
	}
	public Date getMr_date() {
		return mr_date;
	}
	public void setMr_date(Date mr_date) {
		this.mr_date = mr_date;
	}
	
}
