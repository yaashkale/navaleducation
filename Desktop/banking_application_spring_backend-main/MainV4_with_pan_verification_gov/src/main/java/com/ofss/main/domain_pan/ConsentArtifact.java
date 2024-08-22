package com.ofss.main.domain_pan;

public class ConsentArtifact {
	private Consent consent;
	private Signature signature;
	
	public ConsentArtifact() {
		
	}
	public ConsentArtifact(Consent consent, Signature signature) {
		super();
		this.consent = consent;
		this.signature = signature;
	}
	public Consent getConsent() {
		return consent;
	}
	public void setConsent(Consent consent) {
		this.consent = consent;
	}
	public Signature getSignature() {
		return signature;
	}
	public void setSignature(Signature signature) {
		this.signature = signature;
	}
	@Override
	public String toString() {
		return "ConsentArtifact [consent=" + consent + ", signature=" + signature + "]";
	}
	
	
}
