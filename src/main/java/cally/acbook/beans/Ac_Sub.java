package cally.acbook.beans;

public class Ac_Sub {
private int sub_code;
private int mem_num;
private int cate_code;
private String sub_name;
private String sub_basic;
private int acc_code;
public Ac_Sub() {
}
public Ac_Sub(int sub_code, int mem_num, int cate_code, String sub_name, String sub_basic, int acc_code) {
	this.sub_code = sub_code;
	this.mem_num = mem_num;
	this.cate_code = cate_code;
	this.sub_name = sub_name;
	this.sub_basic = sub_basic;
	this.acc_code = acc_code;
}
public int getSub_code() {
	return sub_code;
}
public void setSub_code(int sub_code) {
	this.sub_code = sub_code;
}
public int getMem_num() {
	return mem_num;
}
public void setMem_num(int mem_num) {
	this.mem_num = mem_num;
}
public int getCate_code() {
	return cate_code;
}
public void setCate_code(int cate_code) {
	this.cate_code = cate_code;
}
public String getSub_name() {
	return sub_name;
}
public void setSub_name(String sub_name) {
	this.sub_name = sub_name;
}
public String getSub_basic() {
	return sub_basic;
}
public void setSub_basic(String sub_basic) {
	this.sub_basic = sub_basic;
}
public int getAcc_code() {
	return acc_code;
}
public void setAcc_code(int acc_code) {
	this.acc_code = acc_code;
}

}
