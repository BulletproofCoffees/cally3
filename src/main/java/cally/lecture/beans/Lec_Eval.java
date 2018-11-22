package cally.lecture.beans;

public class Lec_Eval {
	private int mem_num;
	private int lec_app_code;
	private String lec_whe;
	private int lec_qone;
	private int lec_qtwo;
	private int lec_qthr;
	private int lec_qfou;
	private int lec_qfiv;
	private int lec_qsix;
	private String lec_qsev;
	private String lec_qeig;
	private int lec_sem_code;
	private int lec_res_code;
	
	public Lec_Eval() {}
	
	public Lec_Eval(int mem_num, int lec_res_code, int lec_sem_code) {
		super();
		this.mem_num = mem_num;
		this.lec_res_code = lec_res_code;
		this.lec_sem_code = lec_sem_code;
	}
	
	
	public Lec_Eval(int lec_app_code) {
		super();
		this.lec_app_code = lec_app_code;
	}
	
	public Lec_Eval(int lec_app_code, int lec_qone, int lec_qtwo, int lec_qthr, int lec_qfou, int lec_qfiv, int lec_qsix, String lec_qsev, String lec_qeig, String lec_whe) {
		super();
		this.lec_app_code = lec_app_code;
		this.lec_qone = lec_qone;
		this.lec_qtwo = lec_qtwo;
		this.lec_qthr = lec_qthr;
		this.lec_qfou = lec_qfou;
		this.lec_qfiv = lec_qfiv;
		this.lec_qsix = lec_qsix;
		this.lec_qsev = lec_qsev;
		this.lec_qeig = lec_qeig;
		this.lec_whe = lec_whe;
	}
	
	public Lec_Eval(int lec_app_code, int lec_qone, int lec_qtwo, int lec_qthr, int lec_qfou, int lec_qfiv, int lec_qsix, String lec_qsev, String lec_qeig) {
		super();
		this.lec_app_code = lec_app_code;
		this.lec_qone = lec_qone;
		this.lec_qtwo = lec_qtwo;
		this.lec_qthr = lec_qthr;
		this.lec_qfou = lec_qfou;
		this.lec_qfiv = lec_qfiv;
		this.lec_qsix = lec_qsix;
		this.lec_qsev = lec_qsev;
		this.lec_qeig = lec_qeig;
	}

	
	public int getMem_num() {
		return mem_num;
	}

	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}

	public int getLec_app_code() {
		return lec_app_code;
	}

	public void setLec_app_code(int lec_app_code) {
		this.lec_app_code = lec_app_code;
	}

	public String getLec_whe() {
		return lec_whe;
	}

	public void setLec_whe(String lec_whe) {
		this.lec_whe = lec_whe;
	}

	public int getLec_qone() {
		return lec_qone;
	}

	public void setLec_qone(int lec_qone) {
		this.lec_qone = lec_qone;
	}

	public int getLec_qtwo() {
		return lec_qtwo;
	}

	public void setLec_qtwo(int lec_qtwo) {
		this.lec_qtwo = lec_qtwo;
	}

	public int getLec_qthr() {
		return lec_qthr;
	}

	public void setLec_qthr(int lec_qthr) {
		this.lec_qthr = lec_qthr;
	}

	public int getLec_qfou() {
		return lec_qfou;
	}

	public void setLec_qfou(int lec_qfou) {
		this.lec_qfou = lec_qfou;
	}

	public int getLec_qfiv() {
		return lec_qfiv;
	}

	public void setLec_qfiv(int lec_qfiv) {
		this.lec_qfiv = lec_qfiv;
	}

	public int getLec_qsix() {
		return lec_qsix;
	}

	public void setLec_qsix(int lec_qsix) {
		this.lec_qsix = lec_qsix;
	}

	public String getLec_qsev() {
		return lec_qsev;
	}

	public void setLec_qsev(String lec_qsev) {
		this.lec_qsev = lec_qsev;
	}

	public String getLec_qeig() {
		return lec_qeig;
	}

	public void setLec_qeig(String lec_qeig) {
		this.lec_qeig = lec_qeig;
	}

	public int getLec_sem_code() {
		return lec_sem_code;
	}

	public void setLec_sem_code(int lec_sem_code) {
		this.lec_sem_code = lec_sem_code;
	}

	public int getLec_res_code() {
		return lec_res_code;
	}

	public void setLec_res_code(int lec_res_code) {
		this.lec_res_code = lec_res_code;
	}


	
	
	
	
	
}



