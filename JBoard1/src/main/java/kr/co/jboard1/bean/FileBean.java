package kr.co.jboard1.bean;

import java.sql.Date;

public class FileBean {

	private int fno;
	private int parpent;
	private String newName;
	private String oriName;
	private int download;
	private String rdate;
	public int getFno() {
		return fno;
	}
	public void setFno(int fno) {
		this.fno = fno;
	}
	public int getParpent() {
		return parpent;
	}
	public void setParpent(int parpent) {
		this.parpent = parpent;
	}
	public String getNewName() {
		return newName;
	}
	public void setNewName(String newName) {
		this.newName = newName;
	}
	public String getOriName() {
		return oriName;
	}
	public void setOriName(String oriName) {
		this.oriName = oriName;
	}
	public int getDownload() {
		return download;
	}
	public void setDownload(int download) {
		this.download = download;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	
	
	
}
