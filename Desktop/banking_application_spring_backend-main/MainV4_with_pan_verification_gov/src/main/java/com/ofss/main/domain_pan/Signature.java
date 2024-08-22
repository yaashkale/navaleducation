package com.ofss.main.domain_pan;

public class Signature {
	private String signature;

	public Signature() {

	}

	public Signature(String signature) {
		super();
		this.signature = signature;
	}

	public String getSignature() {
		return signature;
	}

	public void setSignature(String signature) {
		this.signature = signature;
	}

	@Override
	public String toString() {
		return "Signature [signature=" + signature + "]";
	}

}
