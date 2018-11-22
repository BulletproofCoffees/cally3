package cally.acbook.beans;

public class Ac_Budget {
private String cate_name;
private int cate_code;
private int budget_value;
public Ac_Budget() {
}
public Ac_Budget(String cate_name, int cate_code, int budget_value) {
	super();
	this.cate_name = cate_name;
	this.cate_code = cate_code;
	this.budget_value = budget_value;
}
public String getCate_name() {
	return cate_name;
}
public void setCate_name(String cate_name) {
	this.cate_name = cate_name;
}
public int getCate_code() {
	return cate_code;
}
public void setCate_code(int cate_code) {
	this.cate_code = cate_code;
}
public int getBudget_value() {
	return budget_value;
}
public void setBudget_value(int budget_value) {
	this.budget_value = budget_value;
}


}
