package com.ofss.main.domain_pan;

public class DataProvider {
	private String id;
	
	public DataProvider(){
		
	}
	
	public DataProvider(String id) {
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
		return "dataProvider [id=" + id + "]";
	}
	
	
	
}
