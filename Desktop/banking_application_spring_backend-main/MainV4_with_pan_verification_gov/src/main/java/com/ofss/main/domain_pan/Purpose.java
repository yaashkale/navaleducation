package com.ofss.main.domain_pan;

public class Purpose {
	private String description;

	public String getDescription() {
		return description;
	}

	public Purpose() {
		
	}
	public Purpose(String description) {
		super();
		this.description = description;
	}


	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public String toString() {
		return "Purpose [description=" + description + "]";
	}
	
	
}
