package cally.acbook.beans;

import java.util.Date;

public class Ac_Memo {
private int mem_num;
private Date memo_date;
private String memo_value;

public Ac_Memo() {

}
public Ac_Memo(int mem_num, Date memo_date, String memo_value) {

	this.mem_num = mem_num;
	this.memo_date = memo_date;
	this.memo_value = memo_value;
}
public int getMem_num() {
	return mem_num;
}
public void setMem_num(int mem_num) {
	this.mem_num = mem_num;
}
public Date getMemo_date() {
	return memo_date;
}
public void setMemo_date(Date memo_date) {
	this.memo_date = memo_date;
}
public String getMemo_value() {
	return memo_value;
}
public void setMemo_value(String memo_value) {
	this.memo_value = memo_value;
}


}
