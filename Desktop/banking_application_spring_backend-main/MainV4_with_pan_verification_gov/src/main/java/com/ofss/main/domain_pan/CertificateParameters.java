package com.ofss.main.domain_pan;

public class CertificateParameters {
	 private String panno;
	    private String UID;
	    private String FullName;
	    private String DOB;
	    private String GENDER;
		public CertificateParameters(String panno, String uID, String fullName, String dOB, String gENDER) {
			super();
			this.panno = panno;
			UID = uID;
			FullName = fullName;
			DOB = dOB;
			GENDER = gENDER;
		}
		public String getPanno() {
			return panno;
		}
		public void setPanno(String panno) {
			this.panno = panno;
		}
		public String getUID() {
			return UID;
		}
		public void setUID(String uID) {
			UID = uID;
		}
		public String getFullName() {
			return FullName;
		}
		public void setFullName(String fullName) {
			FullName = fullName;
		}
		public String getDOB() {
			return DOB;
		}
		public void setDOB(String dOB) {
			DOB = dOB;
		}
		public String getGENDER() {
			return GENDER;
		}
		public void setGENDER(String gENDER) {
			GENDER = gENDER;
		}
		@Override
		public String toString() {
			return "CertificateParameters [panno=" + panno + ", UID=" + UID + ", FullName=" + FullName + ", DOB=" + DOB
					+ ", GENDER=" + GENDER + "]";
		}
	    
	    
}
