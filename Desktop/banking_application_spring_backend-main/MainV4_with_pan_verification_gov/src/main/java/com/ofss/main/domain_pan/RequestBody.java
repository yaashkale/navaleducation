package com.ofss.main.domain_pan;

public class RequestBody {
	private String txnId;
    private String format;
    private CertificateParameters certificateParameters;
    private ConsentArtifact consentArtifact;
    
    public RequestBody() {
    	
    }
	public RequestBody(String txnId, String format, CertificateParameters certificateParameters,
			ConsentArtifact consentArtifact) {
		super();
		this.txnId = txnId;
		this.format = format;
		this.certificateParameters = certificateParameters;
		this.consentArtifact = consentArtifact;
	}
	public String getTxnId() {
		return txnId;
	}
	public void setTxnId(String txnId) {
		this.txnId = txnId;
	}
	public String getFormat() {
		return format;
	}
	public void setFormat(String format) {
		this.format = format;
	}
	public CertificateParameters getCertificateParameters() {
		return certificateParameters;
	}
	public void setCertificateParameters(CertificateParameters certificateParameters) {
		this.certificateParameters = certificateParameters;
	}
	public ConsentArtifact getConsentArtifact() {
		return consentArtifact;
	}
	public void setConsentArtifact(ConsentArtifact consentArtifact) {
		this.consentArtifact = consentArtifact;
	}
	@Override
	public String toString() {
		return "RequestBody [txnId=" + txnId + ", format=" + format + ", certificateParameters=" + certificateParameters
				+ ", consentArtifact=" + consentArtifact + "]";
	}
    
    
}
