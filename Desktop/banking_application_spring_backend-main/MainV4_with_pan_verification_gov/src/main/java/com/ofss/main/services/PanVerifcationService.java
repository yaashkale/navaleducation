package com.ofss.main.services;

import org.springframework.stereotype.Service;

import com.ofss.main.domain_pan.ConsentArtifact;

@Service
public interface PanVerifcationService {
//	public ConsentArtifact createConsentArtifact(String panNumber, String Aadhar, String fullName, String mobile, String email);
	public void verifyPan (String panNumber, String aadhar, String fullName, String mobile,String email, String dob, String gender);
//	public void verifyPan(ConsentArtifact consentArtifact);

}