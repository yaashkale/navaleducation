package com.ofss.main.domain_pan;

public class DataConsumer {
	private String id;

	public DataConsumer() {
		
	}
	public DataConsumer(String id) {
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
		return "dataConsumer [id=" + id + "]";
	}
	
	
}
