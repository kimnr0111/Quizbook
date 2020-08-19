package com.javaex.vo;

public class UserVo {
	
	private int userNo;
	private String id;
	private String firstName;
	private String lastName;
	private String nickName;
	private String password;
	private String joinDate;
	private int age;
	private String userImg;
	private String userInfo;
	private String email;
	private String gender;
	
	public UserVo() {}

	public UserVo(int userNo, String id, String firstName, String lastName, String nickName, String password,
			String joinDate, int age, String userImg, String userInfo, String email, String gender) {
		this.userNo = userNo;
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.nickName = nickName;
		this.password = password;
		this.joinDate = joinDate;
		this.age = age;
		this.userImg = userImg;
		this.userInfo = userInfo;
		this.email = email;
		this.gender = gender;
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

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getUserImg() {
		return userImg;
	}

	public void setUserImg(String userImg) {
		this.userImg = userImg;
	}

	public String getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(String userInfo) {
		this.userInfo = userInfo;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	@Override
	public String toString() {
		return "UserVo [userNo=" + userNo + ", id=" + id + ", firstName=" + firstName + ", lastName=" + lastName
				+ ", nickName=" + nickName + ", password=" + password + ", joinDate=" + joinDate + ", age=" + age
				+ ", userImg=" + userImg + ", userInfo=" + userInfo + ", email=" + email + ", gender=" + gender + "]";
	}
	
	
	
	

}
