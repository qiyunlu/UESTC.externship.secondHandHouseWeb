package com.hwadee.SecondHandHouse.entity;

public class Authrity {
	private int authId;
	private String authName;
	private String url;
	public int getAuthId() {
		return authId;
	}
	public void setAuthId(int authId) {
		this.authId = authId;
	}
	public String getAuthName() {
		return authName;
	}
	public void setAuthName(String authName) {
		this.authName = authName;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	@Override
	public String toString() {
		return "Authrity [authId=" + authId + ", authName=" + authName + ", url=" + url + "]";
	}
	
}
