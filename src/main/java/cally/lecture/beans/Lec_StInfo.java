package cally.lecture.beans;

public class Lec_StInfo {
	private String lec_st_info;
	private int lec_st_po;
	public Lec_StInfo() {
	}
	public Lec_StInfo(String lec_st_info, int lec_st_po) {
		super();
		this.lec_st_info = lec_st_info;
		this.lec_st_po = lec_st_po;
	}
	public String getLec_st_info() {
		return lec_st_info;
	}
	public void setLec_st_info(String lec_st_info) {
		this.lec_st_info = lec_st_info;
	}
	public int getLec_st_po() {
		return lec_st_po;
	}
	public void setLec_st_po(int lec_st_po) {
		this.lec_st_po = lec_st_po;
	}
	
}
