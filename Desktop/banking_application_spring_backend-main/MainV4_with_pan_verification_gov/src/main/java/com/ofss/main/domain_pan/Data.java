package com.ofss.main.domain_pan;

public class Data {
	private String id;

	public Data() {
		
	}
	public Data(String id) {
		super();
		this.id = id;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "Data [id=" + id + "]";
	}
	
	
	
}
