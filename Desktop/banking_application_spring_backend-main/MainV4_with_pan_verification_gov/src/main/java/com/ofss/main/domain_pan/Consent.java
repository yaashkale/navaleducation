package com.ofss.main.domain_pan;

public class Consent {
	private String consentId;
	private String timeStamp;
	private DataConsumer dataConsumer;
	private DataProvider dataProvider;
	private String purpose;
	private User user;
	private Permission permission;
	public Consent(String consentId, String timeStamp, DataConsumer dataConsumer, DataProvider dataProvider,
			String purpose, User user, Permission permission) {
		super();
		this.consentId = consentId;
		this.timeStamp = timeStamp;
		this.dataConsumer = dataConsumer;
		this.dataProvider = dataProvider;
		this.purpose = purpose;
		this.user = user;
		this.permission = permission;
	}
	public Consent() {
		// TODO Auto-generated constructor stub
	}
	public String getConsentId() {
		return consentId;
	}
	public void setConsentId(String consentId) {
		this.consentId = consentId;
	}
	public String getTimeStamp() {
		return timeStamp;
	}
	public void setTimeStamp(String timeStamp) {
		this.timeStamp = timeStamp;
	}
	public DataConsumer getDataConsumer() {
		return dataConsumer;
	}
	public void setDataConsumer(DataConsumer dataConsumer) {
		this.dataConsumer = dataConsumer;
	}
	public DataProvider getDataProvider() {
		return dataProvider;
	}
	public void setDataProvider(DataProvider dataProvider) {
		this.dataProvider = dataProvider;
	}
	public String getPurpose() {
		return purpose;
	}
	public void setPurpose(String string) {
		this.purpose = string;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Permission getPermission() {
		return permission;
	}
	public void setPermission(Permission permission) {
		this.permission = permission;
	}
	@Override
	public String toString() {
		return "Consent [consentId=" + consentId + ", timeStamp=" + timeStamp + ", dataConsumer=" + dataConsumer
				+ ", dataProvider=" + dataProvider + ", purpose=" + purpose + ", user=" + user + ", permission="
				+ permission + "]";
	}
	
	
	
}
