package com.javaex.vo;

public class StudyVo {
	
	private int studyNo;
	private int userNo;
	private int setNo;
	private String studyDate;
	private int studyPct;
	
	public StudyVo() {}

	public StudyVo(int studyNo, int userNo, int setNo, String studyDate, int studyPct) {
		this.studyNo = studyNo;
		this.userNo = userNo;
		this.setNo = setNo;
		this.studyDate = studyDate;
		this.studyPct = studyPct;
	}

	public StudyVo(int userNo, int setNo) {
		this.userNo = userNo;
		this.setNo = setNo;
	}

	public int getStudyNo() {
		return studyNo;
	}

	public void setStudyNo(int studyNo) {
		this.studyNo = studyNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getSetNo() {
		return setNo;
	}

	public void setSetNo(int setNo) {
		this.setNo = setNo;
	}

	public String getStudyDate() {
		return studyDate;
	}

	public void setStudyDate(String studyDate) {
		this.studyDate = studyDate;
	}

	public int getStudyPct() {
		return studyPct;
	}

	public void setStudyPct(int studyPct) {
		this.studyPct = studyPct;
	}

	@Override
	public String toString() {
		return "StudyVo [studyNo=" + studyNo + ", userNo=" + userNo + ", setNo=" + setNo + ", studyDate=" + studyDate
				+ ", studyPct=" + studyPct + "]";
	}
	
	

}
