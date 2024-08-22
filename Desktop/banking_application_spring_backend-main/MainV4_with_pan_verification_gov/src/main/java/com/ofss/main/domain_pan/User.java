package com.ofss.main.domain_pan;

public class User {
	private String idType;
	private String idNumber;
	private String mobile;
	private String email;
	
	public User() {
		
	}
	public User(String idType, String idNumber, String mobile, String email) {
		super();
		this.idType = idType;
		this.idNumber = idNumber;
		this.mobile = mobile;
		this.email = email;
	}
	public String getIdType() {
		return idType;
	}
	public void setIdType(String idType) {
		this.idType = idType;
	}
	public String getIdNumber() {
		return idNumber;
	}
	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return "User [idType=" + idType + ", idNumber=" + idNumber + ", mobile=" + mobile + ", email=" + email + "]";
	}
	
	
	
}

