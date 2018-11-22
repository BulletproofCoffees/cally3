package cally.sharing.beans;

public class Cally_Admin {
private int adm_no;
private String adm_id;
private String adm_pw;
private String adm_email;

public Cally_Admin() {
}
public Cally_Admin(int adm_no, String adm_id, String adm_pw, String adm_email) {
	this.adm_no = adm_no;
	this.adm_id = adm_id;
	this.adm_pw = adm_pw;
	this.adm_email = adm_email;
}
public int getAdm_no() {
	return adm_no;
}
public void setAdm_no(int adm_no) {
	this.adm_no = adm_no;
}
public String getAdm_id() {
	return adm_id;
}
public void setAdm_id(String adm_id) {
	this.adm_id = adm_id;
}
public String getAdm_pw() {
	return adm_pw;
}
public void setAdm_pw(String adm_pw) {
	this.adm_pw = adm_pw;
}
public String getAdm_email() {
	return adm_email;
}
public void setAdm_email(String adm_email) {
	this.adm_email = adm_email;
}


}
