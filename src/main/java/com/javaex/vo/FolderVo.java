package com.javaex.vo;

public class FolderVo {
	
	private int folderNo;
	private int userNo;
	private String folderName;
	private int groupNo;
	private int depth;
	private String regDate;
	
	public FolderVo() {}

	public FolderVo(int folderNo, int userNo, String folderName, int groupNo, int depth, String regDate) {
		this.folderNo = folderNo;
		this.userNo = userNo;
		this.folderName = folderName;
		this.groupNo = groupNo;
		this.depth = depth;
		this.regDate = regDate;
	}

	public int getFolderNo() {
		return folderNo;
	}

	public void setFolderNo(int folderNo) {
		this.folderNo = folderNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getFolderName() {
		return folderName;
	}

	public void setFolderName(String folderName) {
		this.folderName = folderName;
	}

	public int getGroupNo() {
		return groupNo;
	}

	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}

	public int getDepth() {
		return depth;
	}

	public void setDepth(int depth) {
		this.depth = depth;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "FolderVo [folderNo=" + folderNo + ", userNo=" + userNo + ", folderName=" + folderName + ", groupNo="
				+ groupNo + ", depth=" + depth + ", regDate=" + regDate + "]";
	}
	
	
	
	

}
