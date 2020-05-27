package com.vo;

public class Elect {

	private int sid;
	private int cid;
	private double score;
	
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public double getScore() {
		return score;
	}
	public void setScore(double score) {
		this.score = score;
	}
	@Override
	public String toString() {
		return "Elect [sid=" + sid + ", cid=" + cid + ", score=" + score + "]";
	}
	
	
}
