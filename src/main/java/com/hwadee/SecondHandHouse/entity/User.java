package com.hwadee.SecondHandHouse.entity;

public class User {
	private int userId;
	private String userAccount;
	private String userPassword;
	private String email;
	private int roleId = 1;
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getUserAccount() {
		return userAccount;
	}
	public void setUserAccount(String userAccount) {
		this.userAccount = userAccount;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public int getRoleId() {
		return roleId;
	}
	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}
	@Override
	public String toString() {
		return "User [userId=" + userId + ", userAccount=" + userAccount + ", userPassword=" + userPassword
				+ ", roleId=" + roleId + "]";
	}
	
}
