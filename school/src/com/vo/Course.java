package com.vo;

public class Course {

	private int cid;
	private int tid;
	private String cname;
	private int ctype;
	private double credit;
	private int cmax;
	private int curr;
	private String cnote;
	
	private Teacher teacher;
	private Elect elect;
	
	public Elect getElect() {
		return elect;
	}
	public void setElect(Elect elect) {
		this.elect = elect;
	}
	public Teacher getTeacher() {
		return teacher;
	}
	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}
	
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public int getTid() {
		return tid;
	}
	public void setTid(int tid) {
		this.tid = tid;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public int getCtype() {
		return ctype;
	}
	public void setCtype(int ctype) {
		this.ctype = ctype;
	}
	public double getCredit() {
		return credit;
	}
	public void setCredit(double credit) {
		this.credit = credit;
	}
	public int getCmax() {
		return cmax;
	}
	public void setCmax(int cmax) {
		this.cmax = cmax;
	}
	public int getCurr() {
		return curr;
	}
	public void setCurr(int curr) {
		this.curr = curr;
	}
	public String getCnote() {
		return cnote;
	}
	public void setCnote(String cnote) {
		this.cnote = cnote;
	}
	@Override
	public String toString() {
		return "Course [cid=" + cid + ", tid=" + tid + ", cname=" + cname + ", ctype=" 
				+ ctype + ", credit=" + credit+ ", cmax=" + cmax + ", curr=" + curr +
				", teacher=" + teacher + ", elect=" + elect + "]";
	}
	
}
