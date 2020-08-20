package com.javaex.vo;

public class MainVo {
	
	private int setNo;
	private int folderNo;
	private int userNo;
	private String id;
	private String setName;
	private String setExplain;
	private String regDate;
	private String setImg;
	private String search_tag;
	private int setlike;
	private int setdislike;
	
	public MainVo() {}

	public MainVo(int setNo, int folderNo, int userNo, String id, String setName, String setExplain, String regDate,
			String setImg, String search_tag, int setlike, int setdislike) {
		this.setNo = setNo;
		this.folderNo = folderNo;
		this.userNo = userNo;
		this.id = id;
		this.setName = setName;
		this.setExplain = setExplain;
		this.regDate = regDate;
		this.setImg = setImg;
		this.search_tag = search_tag;
		this.setlike = setlike;
		this.setdislike = setdislike;
	}

	public int getSetNo() {
		return setNo;
	}

	public void setSetNo(int setNo) {
		this.setNo = setNo;
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

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getSetName() {
		return setName;
	}

	public void setSetName(String setName) {
		this.setName = setName;
	}

	public String getSetExplain() {
		return setExplain;
	}

	public void setSetExplain(String setExplain) {
		this.setExplain = setExplain;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getSetImg() {
		return setImg;
	}

	public void setSetImg(String setImg) {
		this.setImg = setImg;
	}

	public String getSearch_tag() {
		return search_tag;
	}

	public void setSearch_tag(String search_tag) {
		this.search_tag = search_tag;
	}

	public int getSetlike() {
		return setlike;
	}

	public void setSetlike(int setlike) {
		this.setlike = setlike;
	}

	public int getSetdislike() {
		return setdislike;
	}

	public void setSetdislike(int setdislike) {
		this.setdislike = setdislike;
	}

	@Override
	public String toString() {
		return "MainVo [setNo=" + setNo + ", folderNo=" + folderNo + ", userNo=" + userNo + ", id=" + id + ", setName="
				+ setName + ", setExplain=" + setExplain + ", regDate=" + regDate + ", setImg=" + setImg
				+ ", search_tag=" + search_tag + ", setlike=" + setlike + ", setdislike=" + setdislike + "]";
	}
	

}
