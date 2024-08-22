package com.ofss.main.domain_pan;

public class PanVerificationRequest {
	 private String panNumber;
	    private String aadhaar;
	    private String fullName;
	    private String mobile;
	    private String email;
	    private String dob;
	    private String gender;
	    
	    
	    public PanVerificationRequest() {
	    	
	    }
		
		public PanVerificationRequest(String panNumber, String aadhaar, String fullName, String mobile, String email,
				String dob, String gender) {
			super();
			this.panNumber = panNumber;
			this.aadhaar = aadhaar;
			this.fullName = fullName;
			this.mobile = mobile;
			this.email = email;
			this.dob = dob;
			this.gender = gender;
		}

		public String getPanNumber() {
			return panNumber;
		}
		public void setPanNumber(String panNumber) {
			this.panNumber = panNumber;
		}
		public String getAadhaar() {
			return aadhaar;
		}
		public void setAadhaar(String aadhaar) {
			this.aadhaar = aadhaar;
		}
		public String getFullName() {
			return fullName;
		}
		public void setFullName(String fullName) {
			this.fullName = fullName;
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
		
		public String getDob() {
			return dob;
		}
		public void setDob(String dob) {
			this.dob = dob;
		}
		public String getGender() {
			return gender;
		}
		public void setGender(String gender) {
			this.gender = gender;
		}
		@Override
		public String toString() {
			return "PanVerificationRequest [panNumber=" + panNumber + ", aadhaar=" + aadhaar + ", fullName=" + fullName
					+ ", mobile=" + mobile + ", email=" + email + ", dob=" + dob + ", gender=" + gender + "]";
		}
		
	    
	    
}
